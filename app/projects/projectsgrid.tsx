import ProjectCard from '@/components/projectcard';
import { Project } from "@/types/project";

interface ProjectsGridProps {
  projects: Project[];
}

const ProjectsGrid: React.FC<ProjectsGridProps> = ({ projects }) => {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2 justify-items-center">
      {projects.map((project: Project) => (
        <div key={project.id} className="w-full max-w-[400px] h-full">
          <ProjectCard
            id={project.id.toString()}
            title={project.name}
            description={project.tagline}
            imageUrl={project.banner?.url
              ? `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${project.banner.url}`
              : '/walle.jpg'}
            layout="stacked"
          />
        </div>
      ))}
    </div>
  );
};

export default ProjectsGrid;
