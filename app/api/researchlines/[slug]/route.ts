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
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/research-lines?populate[members][populate][0]=profilepic&populate[banner][populate]=*&populate[gallery][populate]=*&populate[publications][populate][0]=members&populate[projects][populate]=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<StrapiResponse<Project[]>>(url, { headers });
    
    const researchLine = res.data.data.find((p: Project) => {
      const researchLineSlug = p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      return researchLineSlug === params.slug;
    });

    if (!researchLine) {
      return NextResponse.json({ error: "Research line not found" }, { status: 404 });
    }

    return NextResponse.json(researchLine);
  } catch (error) {
    console.error("Error fetching research line data:", error);
    return NextResponse.json({ error: "Failed to fetch research line data" }, { status: 500 });
  }
} 