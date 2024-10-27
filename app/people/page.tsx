'use client'
import axios from "axios";
import { useState, useEffect } from "react";
import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import Image from "next/image";
import { Members } from "@/types/members";
import { FaGithub, FaLinkedin } from "react-icons/fa";
import { MdEmail } from "react-icons/md";

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

  const membersArray = members?.data;
  // Find PI by name
  const principalInvestigator = membersArray?.find(member =>
    member.firstname.toLowerCase() === "eduardo"
  );
  // Filter out PI from other members
  const labMembers = membersArray?.filter(member =>
    member.firstname.toLowerCase() !== "eduardo"
  );

  return (
    <div>
      <Navbar />
      <div className="min-h-screen">
        {/* Principal Investigator Card */}
        {principalInvestigator && (
        <div className="max-w-3xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
          <div className="flex justify-between">
            <div>
              <h2 className="text-3xl font-bold mb-2">Principal investigator</h2>
              <h1 className="text-4xl font-bold mb-2">{`${principalInvestigator.firstname} ${principalInvestigator.lastnames}`}</h1>
              <p className="text-xl mb-4">{principalInvestigator.position}</p>
              <p className="mb-4">{principalInvestigator.bio}</p>
              <div className="mt-4 flex space-x-4 items-center">
                {principalInvestigator.github && (
                  <a href={principalInvestigator.github} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline flex items-center gap-1">
                    <FaGithub className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">GitHub</span>
                  </a>
                )}
                {principalInvestigator.linkedin && (
                  <a href={principalInvestigator.linkedin} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline flex items-center gap-1">
                    <FaLinkedin className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">LinkedIn</span>
                  </a>
                )}
                {principalInvestigator.email && (
                  <a href={`mailto:${principalInvestigator.email}`} className="text-blue-600 hover:underline flex items-center gap-1">
                    <MdEmail className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">Email</span>
                  </a>
                )}
              </div>
            </div>
            {principalInvestigator.profilepic?.url && (
              <Image src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${principalInvestigator.profilepic.url}`} alt={principalInvestigator.firstname} width={200} height={200} className="rounded-full"/>
            )}
          </div>
        </div>
      )}

      {/* Lab Members Section */}
      <div className="max-w-6xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
        <h2 className="text-3xl font-bold mb-6">Lab members</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {labMembers?.map((member) => (
            <div key={member.id} className="flex flex-col items-center">
              {member.profilepic?.url && (
                <div className="w-48 h-48 rounded-full overflow-hidden mb-4">
                  <Image src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${member.profilepic.url}`} alt={member.firstname} width={192} height={192} className="w-full h-full object-cover"/>
                </div>
              )}
              <h3 className="font-semibold text-lg">{`${member.firstname} ${member.lastnames}`}</h3>
              <p className="text-sm text-gray-600">{member.position}</p>
              <div className="mt-2 flex space-x-2 items-center">
                {member.github && (
                  <a href={member.github} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline flex items-center gap-1">
                    <FaGithub className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">GitHub</span>
                  </a>
                )}
                {member.linkedin && (
                  <a href={member.linkedin} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline flex items-center gap-1">
                    <FaLinkedin className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">LinkedIn</span>
                  </a>
                )}
                {member.email && (
                  <a href={`mailto:${member.email}`} className="text-blue-600 hover:underline flex items-center gap-1">
                    <MdEmail className="text-xl inline-block align-middle" />
                    <span className="inline-block align-middle">Email</span>
                  </a>
                )}
              </div>
            </div>
          ))}
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
}
