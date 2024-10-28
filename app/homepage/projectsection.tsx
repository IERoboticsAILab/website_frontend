import ProjectCard from '@/components/projectcard';
import axios from 'axios';
import { Project } from '@/types/project';

async function fetchProjects() {
  const url = `${process.env.STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get<{ data: Project[] }>(url, { headers });
    return res.data.data.map(project => ({
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
    return [];
  }
}

export default async function ProjectsSection() {
  const projects = await fetchProjects();

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Our Projects</h1>
      <div className="overflow-x-auto pb-4 md:overflow-x-visible">
        <div className="flex flex-nowrap md:flex-wrap md:justify-center gap-6">
          {projects.map(project => (
            <div key={project.id}
                 className="w-64 h-64 flex-shrink-0 md:flex-shrink
                           md:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/5">
              <ProjectCard
                id={project.id.toString()}
                title={project.name}
                description={project.tagline}
                imageUrl={project.gallery?.[0]?.formats?.thumbnail?.url || ''}
              />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
