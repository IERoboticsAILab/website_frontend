import HeroSection from "./homepage/herosection";
import Navbar from "@/components/navbar";
import Intro from "./homepage/intro";
import ProjectsSection from "./homepage/projectsection";
import CustomSection from "./homepage/customsection";
import Footer from "@/components/footer";

export default function Home() {

  return (
    <div className="">
      <Navbar />
      <HeroSection />
      <Intro />
      <ProjectsSection />
      <CustomSection />
      <Footer />
    </div>
  );
}