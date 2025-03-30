import { NextResponse } from 'next/server';
import axios from 'axios';
import { JobPost } from '@/types/jobpost';

interface StrapiResponse<T> {
  data: T;
}

export async function GET() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/jobposts?populate=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<StrapiResponse<JobPost[]>>(url, { headers });
    return NextResponse.json(res.data.data);
  } catch (error) {
    console.error("Error fetching job posts data:", error);
    return NextResponse.json({ error: "Failed to fetch job posts data" }, { status: 500 });
  }
} 