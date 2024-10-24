'use client'
import ProjectCard from '@/components/projectcard';
import axios from 'axios';
import { useState, useEffect } from 'react';
import { Projects } from '@/types/project';

export default function ProjectsSection() {
  const [projects, setProjects] = useState<Projects[]>([]);

  useEffect(() => {
    const fetchProjects = async () => {
      const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
      const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
      const headers = {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
      };

      try {
        const res = await axios.get(url, { headers });
        const projectsWithFullImageUrls = res.data.data.map((project: Projects) => ({
          ...project,
          gallery: project.gallery?.map((image: { formats?: { thumbnail?: { url: string } } }) => ({
            ...image,
            formats: image.formats ? {
              ...image.formats,
              thumbnail: image.formats.thumbnail ? {
                ...image.formats.thumbnail,
                url: `${imgurl}${image.formats.thumbnail.url}`
              } : undefined
            } : undefined
          }))
        }));
        setProjects(projectsWithFullImageUrls);
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
          {projects.map((project: Projects) => (
            <div key={project.id} className="w-64 h-64 flex-shrink-0">
              <ProjectCard
                id={project.id}
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
