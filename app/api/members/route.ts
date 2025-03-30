import { NextResponse } from 'next/server';
import axios from 'axios';
import { Member } from '@/types/members';

interface StrapiResponse<T> {
  data: T;
}

export async function GET() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/members?populate=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<StrapiResponse<Member[]>>(url, { headers });
    
    // Find PI by name
    const principalInvestigator = res.data.data.find(member =>
      member.firstname.toLowerCase() === "eduardo"
    );

    // Filter out PI from other members and sort alphabetically
    const labMembers = res.data.data
      .filter(member =>
        member.firstname.toLowerCase() !== "eduardo" &&
        !member.alum // Exclude alumni from lab members
      )
      .sort((a, b) => a.lastnames.localeCompare(b.lastnames));

    // Filter and sort alumni members
    const alumniMembers = res.data.data
      .filter(member => member.alum)
      .sort((a, b) => a.lastnames.localeCompare(b.lastnames));

    return NextResponse.json({
      principalInvestigator,
      labMembers,
      alumniMembers
    });
  } catch (error) {
    console.error("Error fetching members data:", error);
    return NextResponse.json({ error: "Failed to fetch members data" }, { status: 500 });
  }
} 