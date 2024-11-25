'use client'
import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import ProjectsGrid from './projectsgrid';
import { useState, useEffect } from 'react';
import axios from 'axios';
import { Project } from "@/types/project";

export default function ProjectsPage() {
  const [projects, setProjects] = useState<Project[]>([]);

  useEffect(() => {
    const fetchProjects = async () => {
      const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
      const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
      const headers = {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
      };

      try {
        const res = await axios.get(url, { headers });
        const projectsWithFullImageUrls = res.data.data.map((project: Project) => ({
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
        setProjects(projectsWithFullImageUrls);
      } catch (error) {
        console.error("Error fetching projects data:", error);
      }
    };

    fetchProjects();
  }, []);

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
