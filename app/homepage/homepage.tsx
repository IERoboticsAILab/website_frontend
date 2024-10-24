"use client";
import { useState, useEffect } from "react";
import axios from "axios";
import HeroSection from "./herosection";
import Intro from "./intro";
import ProjectsSection from "./projectsection";
import CustomSection from "./customsection";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";
import {Landing} from "@/types/landing";


export default function Home() {
  const [landing, setLanding] = useState<Landing | null>(null);

  useEffect(() => {
    const fetchLanding = async () => {
      const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing?populate=banner`;
      const headers = {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
      };

      try {
        const res = await axios.get(url, { headers });
        setLanding(res.data);
      } catch (error) {
        console.error("Error fetching landing data:", error);
      }
    };

    fetchLanding();
  }, []);

  const bannerUrls = landing?.data.banner.map(banner => `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${banner.url}`) || [];

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
      <CustomSection />
      <Footer />
    </div>
  );
}
