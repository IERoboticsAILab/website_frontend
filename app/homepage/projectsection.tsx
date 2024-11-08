'use client'
import ProjectCard from '@/components/projectcard';
import axios from 'axios';
import { useState, useEffect } from 'react';
import { Project } from '@/types/project';

export default function ProjectsSection() {
  const [projects, setProjects] = useState<Project[]>([]);

  useEffect(() => {
    const fetchProjects = async () => {
      const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
      const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
      const headers = {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
      };

      try {
        const res = await axios.get<{ data: Project[] }>(url, { headers });
        const projectsData = res.data.data.map(project => ({
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
        setProjects(projectsData);
      } catch (error) {
        console.error("Error fetching projects data:", error);
      }
    };

    fetchProjects();
  }, []);

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Our Projects</h1>
      <div className="overflow-x-auto pb-4 md:overflow-x-visible">
        <div className="flex flex-nowrap md:flex-wrap md:justify-center gap-6">
          {projects.map(project => (
            <div key={project.id}
                 className="w-80 h-80 flex-shrink-0 md:flex-shrink
                           md:w-[45%] lg:w-[30%] xl:w-[30%] 2xl:w-[30%]">
              <ProjectCard
                id={project.id.toString()}
                title={project.name}
                description={project.tagline}
                imageUrl={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}`}
              />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
