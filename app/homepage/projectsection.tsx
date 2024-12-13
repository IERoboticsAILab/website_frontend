'use client'
import ProjectCard from '@/components/projectcard';
import { useEffect, useState } from 'react';
import { getProjects } from '@/app/homepage/getProjects';
import { Project } from '@/types/project';

export const dynamic = 'force-dynamic';

export default function ProjectsSection() {
  const [projects, setProjects] = useState<Project[]>([]);

  useEffect(() => {
    const loadProjects = async () => {
      const data = await getProjects();
      setProjects(data);
    };

    loadProjects();
  }, []);

  return (
    <div className="mx-10 py-8">
      <h1 className="text-3xl font-bold mb-8">Projects</h1>
      <div className="relative">
        <div className="overflow-x-auto pb-4 scroll-smooth" id="projectScroll">
          <div className="flex flex-nowrap gap-6">
            {projects.map(project => (
              <div key={project.id}
                   className="w-80 h-80 flex-shrink-0">
                <ProjectCard
                  name={project.name}
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

        <button
          className="absolute left-0 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-2 rounded-r"
          onClick={() => {
            document.getElementById('projectScroll')?.scrollBy({
              left: -300,
              behavior: 'smooth'
            });
          }}
        >
          ←
        </button>

        <button
          className="absolute right-0 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-2 rounded-l"
          onClick={() => {
            document.getElementById('projectScroll')?.scrollBy({
              left: 300,
              behavior: 'smooth'
            });
          }}
        >
          →
        </button>
      </div>
    </div>
  );
}
