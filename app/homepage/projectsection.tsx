'use client';
import ProjectCard from '@/components/projectcard';
import { Project } from '@/types/project';

interface ProjectsSectionProps {
  projects: Project[];
}

export default function ProjectsSection({ projects }: ProjectsSectionProps) {
  const scrollContainer = (direction: 'left' | 'right') => {
    const container = document.querySelector('.scroll-container');
    if (container) {
      const scrollAmount = 320; // Width of card (w-80) + gap
      container.scrollLeft += direction === 'left' ? -scrollAmount : scrollAmount;
    }
  };

  return (
    <div className="mx-10 py-8">
      <h1 className="text-3xl font-bold mb-8">Projects</h1>
      <div className="relative">
        <div className="overflow-x-auto pb-4 scroll-container scroll-smooth">
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
          onClick={() => scrollContainer('left')}
          className="absolute left-0 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-md"
          aria-label="Scroll left"
        >
          ←
        </button>

        <button
          onClick={() => scrollContainer('right')}
          className="absolute right-0 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-md"
          aria-label="Scroll right"
        >
          →
        </button>
      </div>
    </div>
  );
}
