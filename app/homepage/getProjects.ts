import axios from 'axios';
import { Project } from '@/types/project';

export async function getProjects() {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  let projects: Project[] = [];

  try {
    const res = await axios.get<{ data: Project[] }>(url, { headers });
    projects = res.data.data.map(project => ({
      ...project,
      gallery: project.gallery?.map(image => ({
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
    return projects;
  } catch (error) {
    console.error("Error fetching projects data:", error);
    return [];
  }
}
