import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import ProjectsGrid from './projectsgrid';
import { Project } from "@/types/project";

export const dynamic = 'force-dynamic';

export default async function ProjectsPage() {
  let projects: Project[] = [];

  try {
    const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:8081';
    const response = await fetch(`${baseUrl}/api/projects`, {
      cache: 'no-store',
      next: { revalidate: 0 }
    });

    if (!response.ok) {
      throw new Error('Failed to fetch projects');
    }

    projects = await response.json();
  } catch (error) {
    console.error("Error fetching projects:", error);
  }

  return (
    <div>
      <Navbar />
      <div className="px-6 mx-4 py-8 min-h-screen">
        <h1 className="text-3xl font-bold mb-8">Projects</h1>
        <ProjectsGrid projects={projects} />
      </div>
      <Footer />
    </div>
  );
}
