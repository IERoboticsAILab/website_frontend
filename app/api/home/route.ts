import { NextResponse } from 'next/server';
import axios from 'axios';
import { Project } from '@/types/project';

interface StrapiResponse<T> {
  data: T;
}

export async function GET() {
  const landingUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing?populate[customarea][populate]=*&populate[banner][populate]=*`;
  const projectsUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const researchLinesUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/research-lines?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const [landingRes, projectsRes, researchLinesRes] = await Promise.all([
      fetch(landingUrl, {
        headers,
        cache: 'no-store',
        next: { revalidate: 0 }
      }),
      axios.get<StrapiResponse<Project[]>>(projectsUrl, { headers }),
      axios.get<StrapiResponse<Project[]>>(researchLinesUrl, { headers })
    ]);

    const landing = await landingRes.json();
    let projects = projectsRes.data.data;
    let researchLines = researchLinesRes.data.data;

    // Process image URLs
    projects = projects.map((project: Project) => ({
      ...project,
      gallery: project.gallery?.map(image => ({
        ...image,
        formats: {
          ...image.formats,
          thumbnail: {
            ...image.formats.thumbnail,
            url: `${imgurl}${image.formats.thumbnail.url}`
          }
        }
      }))
    }));

    researchLines = researchLines.map((researchLine: Project) => ({
      ...researchLine,
      researchLine: true,
      gallery: researchLine.gallery?.map(image => ({
        ...image,
        formats: {
          ...image.formats,
          thumbnail: {
            ...image.formats.thumbnail,
            url: `${imgurl}${image.formats.thumbnail.url}`
          }
        }
      }))
    }));

    // Filter out projects that have the same name as research lines
    projects = projects.filter((project: Project) =>
      !researchLines.some((researchLine: Project) =>
        researchLine.name.toLowerCase() === project.name.toLowerCase()
      )
    );

    // Filter out hidden projects
    projects = projects.filter((project: Project) => !project.hidden);

    // Sort projects by date (newest first)
    projects.sort((a: Project, b: Project) => {
      if (!a.date) return 1;  // If a has no date, put it at the end
      if (!b.date) return -1; // If b has no date, put it at the end
      return new Date(b.date).getTime() - new Date(a.date).getTime();
    });

    // Sort research lines by date (newest first)
    researchLines.sort((a: Project, b: Project) => {
      if (!a.date) return 1;  // If a has no date, put it at the end
      if (!b.date) return -1; // If b has no date, put it at the end
      return new Date(b.date).getTime() - new Date(a.date).getTime();
    });

    const bannerUrls = landing?.data.banner.map((banner: { url: string }) => `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${banner.url}`) || [];
    const customarea = landing?.data.customarea;

    // Combine projects and research lines
    const combinedItems = [...projects, ...researchLines];

    return NextResponse.json({
      landing,
      projects: combinedItems,
      bannerUrls,
      customarea
    });
  } catch (error) {
    console.error("Error fetching data:", error);
    return NextResponse.json({ error: "Failed to fetch data" }, { status: 500 });
  }
} 