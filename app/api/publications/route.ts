import { NextResponse } from 'next/server';
import axios from 'axios';
import { Publication } from '@/types/publication';

interface StrapiResponse<T> {
  data: T;
}

export async function GET() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/publications?populate[members][populate]=*&populate[projects][populate][0]=banner&populate[image][populate]=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<StrapiResponse<Publication[]>>(url, { headers });
    
    // Sort publications by date in descending order (newest first)
    const sortedPublications = [...res.data.data].sort((a, b) => {
      if (!a.date) return 1;  // If a has no date, put it at the end
      if (!b.date) return -1; // If b has no date, put it at the end
      return new Date(b.date).getTime() - new Date(a.date).getTime();
    });

    return NextResponse.json(sortedPublications);
  } catch (error) {
    console.error("Error fetching publications data:", error);
    return NextResponse.json({ error: "Failed to fetch publications data" }, { status: 500 });
  }
} 