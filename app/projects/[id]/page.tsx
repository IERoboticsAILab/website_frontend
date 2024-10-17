import { notFound } from 'next/navigation';
import Navbar from '@/components/navbar';
import Footer from '@/components/footer';
import Image from 'next/image';
import { Project } from '@/types/project';
import React from 'react';

async function getProject(id: string): Promise<Project | null> {
  try {
    console.log('API Token:', process.env.NEXT_PUBLIC_STRAPI_API_TOKEN);
    const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?filters[id][$eq]=${id}&populate=*`;
    console.log('Fetching project from URL:', url);

    const response = await fetch(url, {
      next: { revalidate: 60 }, // ISR
      headers: {
        'Authorization': `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_TOKEN}`
      }
    });

    if (!response.ok) {
      console.error(`Failed to fetch project: ${response.status} ${response.statusText}`);
      return null;
    }

    const data = await response.json();
    console.log('Project data received:', data);

    if (!data.data || data.data.length === 0) {
      console.log('No project found with id:', id);
      return null;
    }

    const projectData = data.data[0];
    const imgUrl = process.env.NEXT_PUBLIC_STRAPI_API_URL || '';

    return {
      id: projectData.id.toString(),
      documentId: projectData.documentId,
      name: projectData.name,
      about: projectData.about,
      tagline: projectData.tagline,
      videolink: projectData.videolink,
      date: projectData.date,
      banner: projectData.banner
        ? {
            formats: {
              thumbnail: {
                url: `${imgUrl}${projectData.banner.formats.thumbnail.url}`,
              },


            },
          }
        : undefined,
      gallery: projectData.gallery
        ? projectData.gallery.map((image: any) => ({
            formats: {
              thumbnail: { url: `${imgUrl}${image.formats.thumbnail.url}` },
              small: { url: `${imgUrl}${image.formats.small.url}` },
              medium: { url: `${imgUrl}${image.formats.medium.url}` },
              large: { url: `${imgUrl}${image.formats.large.url}` },
            },
          }))
        : undefined,
      members: projectData.members
        ? projectData.members.map((member: any) => ({
            firstname: member.firstname,
            lastnames: member.lastnames,
            position: member.position,
            github: member.github,
            linkedin: member.linkedin,
            email: member.email,
          }))
        : [],
    };
  } catch (error) {
    console.error('Error fetching project:', error);
    return null;
  }
}

export default async function ProjectPage({ params }: { params: { id: string } }) {
  const project = await getProject(params.id);

  if (!project) {
    notFound();
  }

  return (
    <>
      <Navbar />
      <div className="relative">
        <div className="h-96 bg-gray-700 relative">
            <div className="w-full h-full bg-gray-300" />
          <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
            <h1 className="text-4xl font-bold text-white">{project.name}</h1>
          </div>
        </div>
      </div>
      <div className="container mx-auto px-4 py-8">
        <div className="flex flex-col md:flex-row gap-8">
          <div className="md:w-1/2">
            <h2 className="text-2xl font-bold mb-4">About</h2>
            {Array.isArray(project.about) ? (
              project.about.map((block, index) => {
                if (block.type === 'heading') {
                  const HeadingTag = `h${block.level}` as keyof JSX.IntrinsicElements;
                  return <HeadingTag key={index} className="text-xl font-bold my-2">{block.children[0].text}</HeadingTag>;
                } else if (block.type === 'paragraph') {
                  return <p key={index} className="text-lg mb-4">{block.children[0].text}</p>;
                }
                return null;
              })
            ) : (
              <p>{project.about}</p>
            )}
          </div>
          <div className="md:w-1/2">
            <h2 className="text-2xl font-bold mb-4">Video</h2>
            <div className="aspect-w-16 aspect-h-9">
              <iframe
                src={project.videolink.replace('watch?v=', 'embed/')}
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
                className="w-full h-full"
              ></iframe>
            </div>
          </div>
        </div>

        <div className="mt-12">
          <h2 className="text-3xl font-bold mb-4">Gallery</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {project.gallery?.map((image, index) => (
              <div key={index} className="aspect-square bg-gray-200 rounded-lg overflow-hidden">
                {/* {image.formats?.medium?.url && (
                  <Image
                    src={image.formats.medium.url}
                    alt={`Gallery image ${index + 1}`}
                    width={300}
                    height={300}
                    className="w-full h-full object-cover"
                  />
                )} */}
              </div>
            ))}
          </div>
        </div>

        <div className="mt-12">
          <h2 className="text-3xl font-bold mb-8">Members</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {project.members.map((member, index) => (
              <div key={index} className="flex flex-col items-center">
                <div className="w-32 h-32 rounded-full overflow-hidden mb-4 bg-gray-200"></div>
                <p className="text-center font-semibold">{`${member.firstname} ${member.lastnames}`}</p>
                <p className="text-center text-sm text-gray-600">{member.position}</p>
                <div className="flex mt-2">
                  {/* {member.github && (
                    <a href={member.github} target="_blank" rel="noopener noreferrer" className="mr-2">
                      <img src="/github-icon.svg" alt="GitHub" className="w-6 h-6" />
                    </a>
                  )}
                  {member.linkedin && (
                    <a href={member.linkedin} target="_blank" rel="noopener noreferrer">
                      <img src="/linkedin-icon.svg" alt="LinkedIn" className="w-6 h-6" />
                    </a>
                  )} */}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
      <Footer />
    </>
  );
}
