import ProjectCard from '@/components/projectcard';
import { Project } from '@/types/project';

interface ProjectsSectionProps {
  projects: Project[];
}

export default function ProjectsSection({ projects }: ProjectsSectionProps) {
  return (
    <div className="mx-10 py-8">
      <h1 className="text-3xl font-bold mb-8">Projects</h1>
      <div className="overflow-x-auto pb-4 ">
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
    </div>
  );
}
