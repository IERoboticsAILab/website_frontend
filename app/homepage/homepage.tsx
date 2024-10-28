import axios from "axios";
import HeroSection from "./herosection";
import Intro from "./intro";
import ProjectsSection from "./projectsection";
import CustomSection from "./customsection";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";

export const dynamic = 'force-static'

export default async function Home() {
  console.log(`This is the process.env.STRAPI_API_URL: ${process.env.STRAPI_API_URL}`);
  if (!process.env.STRAPI_API_URL) {
    throw new Error('STRAPI_API_URL environment variable is not defined');
  }

  if (!process.env.STRAPI_API_KEY) {
    throw new Error('STRAPI_API_KEY environment variable is not defined');
  }
  const url = `${process.env.STRAPI_API_URL}/landing?populate[customarea][populate]=*&populate[banner]=*`;
  const headers = {
    Authorization: `Bearer ${process.env.STRAPI_API_KEY}`,
  };

  let landing = null;
  try {
    const res = await axios.get(url, { headers });
    landing = res.data;
  } catch (error) {
    console.error("Error fetching landing data:", error);
  }

  const bannerUrls = landing?.data.banner.map((banner: { url: string }) => `${process.env.STRAPI_API_URL_IMG}${banner.url}`) || [];
  const customarea = landing?.data.customarea;

  return (
    <div className="">
      <Navbar />
      <HeroSection tagline={landing?.data?.tagline || ""} bannerUrls={bannerUrls}/>
      <Intro
        videolink={landing?.data?.videolink || ""}
        videocaption={landing?.data?.videocaption || ""}
        introtitle={landing?.data?.introtitle || ""}
        introdescription={landing?.data?.introdescription || ""}
      />
      <ProjectsSection />
      <CustomSection customarea={customarea || []} />
      <Footer />
    </div>
  );
}
