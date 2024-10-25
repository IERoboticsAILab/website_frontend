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
      <div className="overflow-x-auto pb-4">
        <div className="flex space-x-6" style={{ width: `${projects.length * 20}%` }}>
          {projects.map(project => (
            <div key={project.id} className="w-64 h-64 flex-shrink-0">
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
