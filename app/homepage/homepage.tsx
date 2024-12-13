import HeroSection from "./herosection";
import Intro from "./intro";
import ProjectsSection from "./projectsection";
import CustomSection from "./customsection";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";
import { Landing } from "@/types/landing";
import axios from "axios";
import { Project } from '@/types/project';

export const dynamic = 'force-dynamic';

export default async function Home() {
  let landing: Landing | null = null;
  let projects: Project[] = [];

  const landingUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing?populate[customarea][populate]=*&populate[banner][populate]=*`;
  const projectsUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const [landingRes, projectsRes] = await Promise.all([
      axios.get(landingUrl, { headers }),
      axios.get<{ data: Project[] }>(projectsUrl, { headers })
    ]);

    landing = landingRes.data;
    projects = projectsRes.data.data.map(project => ({
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
  } catch (error) {
    console.error("Error fetching data:", error);
  }

  const bannerUrls = landing?.data.banner.map(banner => `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${banner.url}`) || [];
  const customarea = landing?.data.customarea;

  return (
    <div className="">
      <Navbar />
      <HeroSection tagline={landing?.data?.tagline || ""} bannerUrls={bannerUrls} />
      <Intro
        videolink={landing?.data?.videolink || ""}
        videocaption={landing?.data?.videocaption || ""}
        intro={landing?.data?.Intro || []}
      />
      <ProjectsSection projects={projects} />
      <CustomSection customarea={customarea || []} />
      <Footer />
    </div>
  );
}
