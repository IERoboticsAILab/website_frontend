import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import ProjectCard from '@/components/projectcard';

// This function would typically fetch data from an API or database
async function getProjects() {
  // Simulating an API call
  return [
    { id: '1', title: 'Project 1', description: 'Description 1', imageUrl: '/walle.jpg' },
    { id: '2', title: 'Project 2', description: 'Description 2', imageUrl: '/walle.jpg' },
    { id: '3', title: 'Project 3', description: 'Description 3', imageUrl: '/walle.jpg' },
    { id: '4', title: 'Project 4', description: 'Description 4', imageUrl: '/walle.jpg' },
    { id: '5', title: 'Project 5', description: 'Description 5', imageUrl: '/walle.jpg' },
    { id: '6', title: 'Project 6', description: 'Description 6', imageUrl: '/walle.jpg' },
    { id: '7', title: 'Project 7', description: 'Description 7', imageUrl: '/walle.jpg' },
    { id: '8', title: 'Project 8', description: 'Description 8', imageUrl: '/walle.jpg' },
    { id: '9', title: 'Project 9', description: 'Description 9', imageUrl: '/walle.jpg' },
    { id: '10', title: 'Project 10', description: 'Description 10', imageUrl: '/walle.jpg' },
    // Add more projects as needed
  ];
}

export default async function ProjectsPage() {
  const projects = await getProjects();

  return (
    <div>
      <Navbar />
      <div className="container mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold mb-8">Our Projects</h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {projects.map((project) => (
            <div key={project.id}>
              <ProjectCard {...project} />
            </div>
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
}
