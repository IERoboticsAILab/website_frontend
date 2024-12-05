import HeroSection from "./herosection";
import Intro from "./intro";
import ProjectsSection from "./projectsection";
import CustomSection from "./customsection";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";
import { Landing } from "@/types/landing";
import axios from "axios";

export const dynamic = 'force-dynamic';

export default async function Home() {
  let landing: Landing | null = null;

  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing?populate[customarea][populate]=*&populate[banner][populate]=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  try {
    const res = await axios.get(url, { headers });
    landing = res.data;
  } catch (error) {
    console.error("Error fetching landing data:", error);
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
      <ProjectsSection />
      <CustomSection customarea={customarea || []} />
      <Footer />
    </div>
  );
}
