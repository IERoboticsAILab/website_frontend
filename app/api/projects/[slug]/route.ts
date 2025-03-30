import { NextResponse } from 'next/server';
import axios from 'axios';
import { Project } from '@/types/project';

interface StrapiResponse<T> {
  data: T;
}

export async function GET(
  request: Request,
  { params }: { params: { slug: string } }
) {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate[members][populate][0]=profilepic&populate[banner][populate]=*&populate[gallery][populate]=*&populate[publications][populate][0]=members`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<StrapiResponse<Project[]>>(url, { headers });
    
    const project = res.data.data.find((p: Project) => {
      const projectSlug = p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      return projectSlug === params.slug;
    });

    if (!project) {
      return NextResponse.json({ error: "Project not found" }, { status: 404 });
    }

    return NextResponse.json(project);
  } catch (error) {
    console.error("Error fetching project data:", error);
    return NextResponse.json({ error: "Failed to fetch project data" }, { status: 500 });
  }
} 