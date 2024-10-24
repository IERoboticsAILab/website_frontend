"use client";

import Image from "next/image";

interface HeroSectionProps {
  tagline: string;
  bannerUrls: string[];
}

function HeroSection({ tagline, bannerUrls }: HeroSectionProps) {

  const images = bannerUrls;
  console.log(images);

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
        <h1 className="text-white text-4xl font-bold z-20">Cyber Physical Life</h1>
        <p className="text-white text-2xl z-20">{tagline}</p>
      </div>
    </>
  );
}

export default HeroSection;
