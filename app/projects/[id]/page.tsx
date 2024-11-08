import { notFound } from 'next/navigation';
import axios from 'axios';
import Navbar from '@/components/navbar';
import Footer from '@/components/footer';
import Image from 'next/image';
import { Projects } from '@/types/project';
import Gallery from '@/app/components/Gallery';


interface ProjectPageProps {
  params: { id: string };
}


export default async function ProjectPage({ params }: ProjectPageProps) {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate[members][populate][0]=profilepic&populate[banner][populate]=*&populate[gallery][populate]=*&populate[publications][populate][0]=members`;
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
    <div className="min-h-screen bg-gray-50">
      <Navbar />
      <div className="relative">
        <div className="h-[70vh] bg-gray-900 relative">
          <Image
            src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}`}
            alt={project.name}
            className="w-full h-full object-cover opacity-80"
            fill
            priority
          />
          <div className="absolute inset-0 bg-gradient-to-b from-black/60 to-black/30 flex items-center">
            <div className="container mx-auto px-6">
              <h1 className="text-6xl font-bold text-white mb-4 max-w-3xl">{project.name}</h1>
              <p className="text-2xl text-gray-200 max-w-2xl">{project.tagline}</p>
            </div>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-6 py-12">
        <div className="bg-white rounded-lg shadow-lg p-8 -mt-24 relative z-10 mb-12">
          <div className="flex flex-col lg:flex-row gap-12">
            <div className="w-full lg:w-1/2">
              <div className="relative w-full pt-[56.25%] rounded-lg overflow-hidden shadow-lg">
                <iframe
                  className="absolute top-0 left-0 w-full h-full"
                  src={project.videolink}
                  title="Project Video"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                ></iframe>
              </div>
            </div>
            <div className="w-full lg:w-1/2">
              <h2 className="text-3xl font-bold mb-6 text-gray-900">About the Project</h2>
              <div className="prose prose-lg max-w-none">
                {project.about?.map((textItem, i) => (
                  textItem.children?.map((child, j) => (
                    textItem.type === "paragraph" ? (
                      <p key={`${i}-${j}`} className="text-gray-600">{child.text}</p>
                    ) : textItem.type === "heading" ? (
                      <h2 key={`${i}-${j}`} className="text-2xl font-semibold text-gray-800 mb-4">{child.text}</h2>
                    ) : null
                  ))
                ))}
              </div>
            </div>
          </div>
        </div>

        {project.publications?.length > 0 && (
          <div className="mb-16">
            <h2 className="text-3xl font-bold mb-8 text-gray-900">Publications</h2>
            <div className="grid gap-6">
              {project.publications?.map((publication) => (
                <div key={publication.id} className="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow">
                  <p className="text-sm text-blue-600 mb-2">{publication.date}</p>
                  <h3 className="text-xl font-bold text-gray-900 mb-3">{publication.name}</h3>
                  <p className="text-gray-600 mb-4">{publication.authors ? publication.authors : publication.members.map(member => member.firstname + " " + member.lastnames).join(', ')}</p>
                  <div className="flex space-x-4">
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
          </div>
        )}

        <Gallery
          images={project.gallery?.map(image => ({
            id: image.id,
            url: image.url,
            name: image.name,
          })) || []}
          baseUrl={process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG || ''}
        />

        <div className="mt-16">
          <h2 className="text-3xl font-bold mb-8 text-gray-900">Team Members</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {project.members.map((member) => (
              <div key={member.firstname + " " + member.lastnames} className="group">
                <div className="aspect-square rounded-xl overflow-hidden mb-4 shadow-md transition-transform transform group-hover:scale-105">
                  <Image
                    src={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${member?.profilepic?.url}`}
                    alt={member.firstname + " " + member.lastnames}
                    width={300}
                    height={300}
                    className="w-full h-full object-cover"
                  />
                </div>
                <p className="text-center font-semibold text-gray-900">{member.firstname + " " + member.lastnames}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
}
