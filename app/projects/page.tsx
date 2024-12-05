import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import ProjectsGrid from './projectsgrid';
import { Project } from "@/types/project";

async function getProjects() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  const res = await fetch(url, { headers });
  if (!res.ok) {
    throw new Error('Failed to fetch projects');
  }

  const data = await res.json();
  return data.data.map((project: Project) => ({
    ...project,
    gallery: project.gallery?.map((image) => ({
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
}

export default async function ProjectsPage() {
  const projects = await getProjects();

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
