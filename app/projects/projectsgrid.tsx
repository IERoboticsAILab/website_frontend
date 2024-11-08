import ProjectCard from '@/components/projectcard';
import { Project } from "@/types/project";

interface ProjectsGridProps {
  projects: Project[];
}

const ProjectsGrid: React.FC<ProjectsGridProps> = ({ projects }) => {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 justify-items-center px-4">
      {projects.map((project: Project) => (
        <div key={project.id} className="w-full max-w-[256px] h-64">
          <ProjectCard
            id={project.id.toString()}
            title={project.name}
            description={project.tagline}
            imageUrl={`${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}`}
          />
        </div>
      ))}
    </div>
  );
};

export default ProjectsGrid;
