import ProjectCard from '@/components/projectcard';
import { Project } from "@/types/project";

interface ProjectsGridProps {
  projects: Project[];
}

const ProjectsGrid: React.FC<ProjectsGridProps> = ({ projects }) => {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {projects.map((project: Project) => (
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
  );
};

export default ProjectsGrid;
