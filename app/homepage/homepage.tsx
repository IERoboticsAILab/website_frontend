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
  let researchLines: Project[] = [];

  const landingUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing?populate[customarea][populate]=*&populate[banner][populate]=*`;
  const projectsUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/projects?populate=*`;
  const researchLinesUrl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/research-lines?populate=*`;
  const imgurl = `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const [landingRes, projectsRes, researchLinesRes] = await Promise.all([
      axios.get(landingUrl, { headers }),
      axios.get<{ data: Project[] }>(projectsUrl, { headers }),
      axios.get<{ data: Project[] }>(researchLinesUrl, { headers })
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

    researchLines = researchLinesRes.data.data.map(researchLine => ({
      ...researchLine,
      researchLine: true,
      gallery: researchLine.gallery?.map(image => ({
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

    // Filter out projects that have the same name as research lines
    projects = projects.filter(project =>
      !researchLines.some(researchLine =>
        researchLine.name.toLowerCase() === project.name.toLowerCase()
      )
    );

  } catch (error) {
    console.error("Error fetching data:", error);
  }

  const bannerUrls = landing?.data.banner.map(banner => `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${banner.url}`) || [];
  const customarea = landing?.data.customarea;

  // Combine projects and research lines
  const combinedItems = [...projects, ...researchLines];

  return (
    <div className="">
      <Navbar />
      <HeroSection tagline={landing?.data?.tagline || ""} bannerUrls={bannerUrls} />
      <Intro
        videolink={landing?.data?.videolink || ""}
        videocaption={landing?.data?.videocaption || ""}
        intro={landing?.data?.Intro || []}
      />
      <ProjectsSection projects={combinedItems} />
      <CustomSection customarea={customarea || []} />
      <Footer />
    </div>
  );
}
