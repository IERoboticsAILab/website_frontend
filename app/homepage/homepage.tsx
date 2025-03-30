import HeroSection from "./herosection";
import Intro from "./intro";
import ProjectsSection from "./projectsection";
import CustomSection from "./customsection";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";
import { Landing } from "@/types/landing";
import { Project } from '@/types/project';

export const dynamic = 'force-dynamic';

export default async function Home() {
  let landing: Landing | null = null;
  let projects: Project[] = [];
  let bannerUrls: string[] = [];
  let customarea: Landing['data']['customarea'] = [];

  try {
    // Get the base URL from environment or use a default
    const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:8081';
    const response = await fetch(`${baseUrl}/api/home`, {
      cache: 'no-store',
      next: { revalidate: 0 }
    });
    
    if (!response.ok) {
      throw new Error('Failed to fetch data');
    }

    const data = await response.json();
    landing = data.landing;
    projects = data.projects;
    bannerUrls = data.bannerUrls;
    customarea = data.customarea;

  } catch (error) {
    console.error("Error fetching data:", error);
  }

  return (
    <div className="">
      <Navbar />
      <HeroSection tagline={landing?.data?.tagline || ""} bannerUrls={bannerUrls} />
      <Intro
        videolink={landing?.data?.videolink || ""}
        videocaption={landing?.data?.videocaption || ""}
        intro2={landing?.data?.Intro2 || ""}
      />
      <ProjectsSection projects={projects} />
      <CustomSection customarea={customarea} />
      <Footer />
    </div>
  );
}
