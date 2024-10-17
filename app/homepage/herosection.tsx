"use client";

import Image from "next/image";
import { useEffect, useState } from "react";
import axios from "axios";

export default function HeroSection() {
  const [landing, setLanding] = useState<any>(null);

  useEffect(() => {
    const fetchLanding = async () => {
      const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/landing`;
      console.log(process.env.NEXT_PUBLIC_STRAPI_API_KEY);
      const headers = {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
      };

      try {
        const res = await axios.get(url, { headers });
        setLanding(res.data.data);
      } catch (error) {
        console.error("Error fetching landing data:", error);
      }
    };

    fetchLanding();
  }, []);

  if (!landing) {
    return <div>Loading...</div>; // Or any loading indicator
  }

  const images = ["/giphy1.webp", "/giphy2.webp", "/giphy3.webp", "/giphy4.webp"];

  return (
    <>
      <div className="flex flex-col center justify-center overflow-hidden relative ">
        <div className="absolute inset-0 bg-black opacity-50 z-10"></div>
        {/* 1. Adjust the container */}
        <div className="w-full h-[50vh] overflow-hidden relative">
          {/* 2. Create the animating container */}
          <div className="flex items-center h-full absolute left-0 animate-slide whitespace-nowrap">
            {/* 3. Map through images twice */}
            {[...images, ...images].map((src, index) => (
              <div key={index} className="inline-block h-full">
                <Image
                  src={src}
                  alt={`Hero ${index + 1}`}
                  width={300}
                  height={300}
                  className="w-[25vw] h-full object-cover"
                />
              </div>
            ))}
          </div>
        </div>
      </div>
      <div className="absolute flex flex-col justify-center items-center top-[15vh] w-[100vw]">
        <Image
          src="/cpl.svg"
          alt="Logo"
          width={350}
          height={350}
          className="z-20 invert"
        />
        <h1 className="text-white text-4xl font-bold z-20">Cyber Physical Lab</h1>
        <p className="text-white text-2xl z-20">{landing.tagline}</p>
      </div>
    </>
  );
}
