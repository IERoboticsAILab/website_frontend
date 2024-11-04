import { notFound } from 'next/navigation';
import axios from 'axios';
import Navbar from '@/components/navbar';
import Footer from '@/components/footer';
import Image from 'next/image';
import { Projects } from '@/types/project';


interface ProjectPageProps {
  params: { id: string };
}


export default async function ProjectPage({ params }: ProjectPageProps) {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate[members][populate][0]=profilepic&populate[banner]=*&populate[gallery]=*&populate[publications][populate][0]=members`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  let projects: Projects;
  try {
    const res = await axios.get(url, { headers });
    projects = res.data;
  } catch (error) {
    console.error("Error fetching projects data:", error);
    notFound();
  }

  const project = projects?.data.find(p => p.id.toString() === params.id);
  if (!project) {
    notFound();
  }



  return (
    <div>
      <Navbar />
      <div className="">
        <div className="h-96 bg-gray-700 relative">
          <Image
            src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}`}
            alt={project.name}
            className="w-full h-full object-cover"
            fill
          />
          <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
            <h1 className="text-4xl font-bold text-white">{project.name}</h1>
          </div>
        </div>
      </div>
      <div className="mx-auto px-4 py-8 h-full">
        <div className="flex flex-col md:flex-row gap-8 items-start">
          <div className="h-full flex flex-col w-full">
            <p className="text-sm text-gray-600 mb-2">{project.date}</p>
            <h2 className="text-5xl font-bold mb-4 text-gray-900">{project.name}</h2>
            <p className="text-xl text-gray-700 mb-6 leading-relaxed">{project.tagline}</p>
            <p className="text-gray-800 mb-6">{project.members.map(member => member.firstname + " " + member.lastnames).join(', ')}</p>
            <div className="flex flex-col lg:flex-row gap-8 mt-auto">
              <div className="w-full lg:w-1/2">
                <div className="relative w-full pt-[56.25%]">
                  <iframe
                    className="absolute top-0 left-0 w-full h-full"
                    src={project.videolink}
                    title="Project Video"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  ></iframe>
                </div>
              </div>
              <div className="w-full lg:w-1/2">
                <h2 className="text-3xl font-bold mb-6">About</h2>
                <div className="prose prose-lg max-w-none">
                  {project.about?.map((textItem, i) => (
                    textItem.children?.map((child, j) => (
                      textItem.type === "paragraph" ? (
                        <p key={`${i}-${j}`}>{child.text}</p>
                      ) : textItem.type === "heading" ? (
                        <h2 key={`${i}-${j}`} className="text-2xl font-semibold mb-4">{child.text}</h2>
                      ) : null
                    ))
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-12">
        <h2 className="text-3xl font-bold mb-4"> {project.publications?.length > 0 ? "Publications" : ""}</h2>
        {project.publications?.map((publication) => (
          <div key={publication.id} className="bg-gray-100 p-4 rounded-lg mb-4">
            <p className="text-sm text-gray-600">{publication.date}</p>
            <h3 className="text-xl font-semibold my-2">{publication.name}</h3>
            <p className="text-gray-700">{ publication.authors ? publication.authors : publication.members.map(member => member.firstname + " " + member.lastnames).join(', ')}</p>
            <div className="mt-4 flex space-x-4">
              {publication.pdflink && (
                <a href={publication.pdflink} className="flex items-center text-blue-600 hover:underline" target="_blank" rel="noopener noreferrer">
                  <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 2a2 2 0 00-2 2v8a2 2 0 002 2h6a2 2 0 002-2V6.414A2 2 0 0016.414 5L14 2.586A2 2 0 0012.586 2H9z"></path>
                    <path d="M3 8a2 2 0 012-2h2.93a.5.5 0 01.5.5v7a.5.5 0 01-.5.5H5a2 2 0 01-2-2V8z"></path>
                  </svg>
                  PDF
                </a>
              )}
              {publication.paperlink && (
                <a href={publication.paperlink} className="flex items-center text-blue-600 hover:underline" target="_blank" rel="noopener noreferrer">
                  <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z"></path>
                  </svg>
                  Link
                </a>
              )}
            </div>
          </div>
        ))}
      </div>

      <div className="mt-12">
        <h2 className="text-3xl font-bold mb-4">Gallery</h2>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {project?.gallery?.map((image) => (
            <div key={image.id} className="aspect-square bg-gray-200 rounded-lg overflow-hidden">
              <Image
                src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${image.url}`}
                alt={image.name}
                width={300}
                height={300}
                className="w-full h-full object-cover"
              />
            </div>
          ))}
        </div>
      </div>

      <div className="mt-12">
        <h2 className="text-3xl font-bold mb-8">CyPhyLife Members</h2>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          {project.members.map((member) => (
            <div key={member.firstname + " " + member.lastnames} className="flex flex-col items-center">
              <div className="w-32 h-32 rounded-full overflow-hidden mb-4">
                <Image
                  src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${member?.profilepic?.url}`}
                  alt={member.firstname + " " + member.lastnames}
                  width={128}
                  height={128}
                  className="w-full h-full object-cover"
                />
              </div>
              <p className="text-center font-semibold">{member.firstname + " " + member.lastnames}</p>
            </div>
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
}
