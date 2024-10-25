'use client'
import axios from "axios";
import { useState, useEffect } from "react";
import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import Image from "next/image";
import { Members } from "@/types/members";

export default function People() {
  const [members, setMembers] = useState<Members>();

  useEffect(() => {
    fetchMembers();
  }, []);

  const fetchMembers = async () => {
    const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/members?populate=*`;
    const headers = {
      Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
    };

    try {
      const res = await axios.get(url, { headers });
      setMembers(res.data);
    } catch (error) {
      console.error("Error fetching members data:", error);
    }
  };

  const membersArray = members?.data;  // Now this will work correctly

  return (
    <div>
      <Navbar />
      {/* Principal Investigator Card */}
      {membersArray && membersArray.length > 0 && (
        <div className="max-w-3xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
          <div className="flex justify-between">
            <div>
              <h2 className="text-3xl font-bold mb-2">Principal investigator</h2>
              <h1 className="text-4xl font-bold mb-2">{`${membersArray[0].firstname} ${membersArray[0].lastnames}`}</h1>
              <p className="text-xl mb-4">{membersArray[0].position}</p>
              <p className="mb-4">{membersArray[0].bio}</p>
              <div className="mt-4 flex space-x-4">
                {membersArray[0].github && (
                  <a href={membersArray[0].github} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                    GitHub
                  </a>
                )}
                {membersArray[0].linkedin && (
                  <a href={membersArray[0].linkedin} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                    LinkedIn
                  </a>
                )}
                {membersArray[0].email && (
                  <a href={`mailto:${membersArray[0].email}`} className="text-blue-600 hover:underline">
                    Email
                  </a>
                )}
              </div>
            </div>
            {/* Placeholder for headshot - you'll need to add this field to your API if you want to display it */}
            {membersArray[0].profilepic?.url && (
              <Image src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${membersArray[0].profilepic.url}`} alt={membersArray[0].firstname} width={200} height={200} className="rounded-full"/>
            )}
          </div>
        </div>
      )}

      {/* Lab Members Section */}
      <div className="max-w-6xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
        <h2 className="text-3xl font-bold mb-6">Lab members</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {membersArray?.slice(1).map((member) => (
            <div key={member.id} className="flex flex-col items-center">
              {member.profilepic?.url && (
                <Image src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${member.profilepic.url}`} alt={member.firstname} width={200} height={200} className="rounded-full"/>
              )}
              <h3 className="font-semibold text-lg">{`${member.firstname} ${member.lastnames}`}</h3>
              <p className="text-sm text-gray-600">{member.position}</p>
              <div className="mt-2 flex space-x-2">
                {member.github && (
                  <a href={member.github} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                    GitHub
                  </a>
                )}
                {member.linkedin && (
                  <a href={member.linkedin} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                    LinkedIn
                  </a>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
}
