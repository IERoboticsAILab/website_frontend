import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import ProjectsGrid from './projectsgrid';
import { Project } from "@/types/project";
import axios from "axios";

export const dynamic = 'force-dynamic';

async function getProjects() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  const res = await axios.get<{ data: Project[] }>(url, { headers });
  return res.data.data.map((project: Project) => ({
    ...project,
    gallery: project.gallery?.map((image) => ({
      ...image,
      formats: {
        ...image.formats,
        thumbnail: {
          ...image.formats.thumbnail,
          url: `${imgurl}${image.formats.thumbnail.url}`
        }
      }
    }))
  }));
}

async function getResearchLines() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/research-lines?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  const res = await axios.get<{ data: Project[] }>(url, { headers });
  return res.data.data.map((researchLine: Project) => ({
    ...researchLine,
    researchLine: true,
    gallery: researchLine.gallery?.map((image) => ({
      ...image,
      formats: {
        ...image.formats,
        thumbnail: {
          ...image.formats.thumbnail,
          url: `${imgurl}${image.formats.thumbnail.url}`
        }
      }
    }))
  }));
}

export default async function ProjectsPage() {
  const projects = await getProjects();
  const researchLines = await getResearchLines();

  // Filter out hidden projects
  const visibleProjects = projects.filter((project: Project) => !project.hidden);

  // Filter out projects that have the same name as research lines
  const filteredProjects = visibleProjects.filter(project =>
    !researchLines.some(researchLine =>
      researchLine.name.toLowerCase() === project.name.toLowerCase()
    )
  );

  // Combine and sort by date
  const combinedItems = [...filteredProjects, ...researchLines].sort((a, b) => {
    return new Date(b.publishedAt).getTime() - new Date(a.publishedAt).getTime();
  });

  return (
    <div>
      <Navbar />
      <div className="px-6 mx-4 py-8 min-h-screen">
        <h1 className="text-3xl font-bold mb-8">Projects</h1>
        <ProjectsGrid projects={combinedItems} />
      </div>
      <Footer />
    </div>
  );
}
