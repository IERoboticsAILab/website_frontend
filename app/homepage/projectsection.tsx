import ProjectCard from '@/components/projectcard';
import axios from 'axios';
import { Project } from '@/types/project';

export const dynamic = 'force-dynamic';

export default async function ProjectsSection() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  let projects: Project[] = [];

  try {
    const res = await axios.get<{ data: Project[] }>(url, { headers });
    projects = res.data.data.map(project => ({
      ...project,
      gallery: project.gallery?.map(image => ({
        ...image,
        formats: {
          ...image.formats,
          thumbnail: {
            ...image.formats.thumbnail,
            url: `${imgurl}${image.formats.thumbnail.url}`
          }
        }
      }))
    }));
  } catch (error) {
    console.error("Error fetching projects data:", error);
  }

  return (
    <div className="mx-10 py-8">
      <h1 className="text-3xl font-bold mb-8">Projects</h1>
      <div className="overflow-x-auto pb-4 ">
        <div className="flex flex-nowrap gap-6">
          {projects.map(project => (
            <div key={project.id}
                 className="w-80 h-80 flex-shrink-0">
              <ProjectCard
                id={project.id.toString()}
                title={project.name}
                description={project.tagline}
                imageUrl={project.banner ?
                  `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}` :
                  '/walle.jpg'}
              />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
