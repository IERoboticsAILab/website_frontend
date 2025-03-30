import { NextResponse } from 'next/server';
import axios from 'axios';
import { Project } from '@/types/project';

interface StrapiResponse<T> {
  data: T;
}

export async function GET() {
  const projectsUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const researchLinesUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/research-lines?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const [projectsRes, researchLinesRes] = await Promise.all([
      axios.get<StrapiResponse<Project[]>>(projectsUrl, { headers }),
      axios.get<StrapiResponse<Project[]>>(researchLinesUrl, { headers })
    ]);

    const projects = projectsRes.data.data.map(project => ({
      ...project,
      gallery: project.gallery?.map(image => ({
        ...image,
        formats: image.formats ? {
          ...image.formats,
          thumbnail: image.formats.thumbnail ? {
            ...image.formats.thumbnail,
            url: `${imgurl}${image.formats.thumbnail.url}`
          } : undefined
        } : undefined
      }))
    }));

    const researchLines = researchLinesRes.data.data.map(researchLine => ({
      ...researchLine,
      researchLine: true,
      gallery: researchLine.gallery?.map(image => ({
        ...image,
        formats: image.formats ? {
          ...image.formats,
          thumbnail: image.formats.thumbnail ? {
            ...image.formats.thumbnail,
            url: `${imgurl}${image.formats.thumbnail.url}`
          } : undefined
        } : undefined
      }))
    }));

    // Filter out projects that have the same name as research lines
    const filteredProjects = projects.filter(project =>
      !researchLines.some(researchLine =>
        researchLine.name.toLowerCase() === project.name.toLowerCase()
      )
    );

    // Filter out hidden projects
    const visibleProjects = filteredProjects.filter(project => !project.hidden);

    // Combine projects and research lines
    const combinedItems = [...visibleProjects, ...researchLines];

    return NextResponse.json(combinedItems);
  } catch (error) {
    console.error("Error fetching projects data:", error);
    return NextResponse.json({ error: "Failed to fetch projects data" }, { status: 500 });
  }
} 