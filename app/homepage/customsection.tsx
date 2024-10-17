import Image from "next/image";

export default function CustomSection() {
  return (
    <div className="w-full bg-gray-100 py-16">
      <div className="container mx-auto">
        <div className="flex flex-col md:flex-row items-center mb-16">
          <div className="w-full md:w-1/2 p-8">
            <h2 className="text-4xl font-bold mb-6 text-blue-600">Innovative Research</h2>
            <p className="text-xl mb-4 text-gray-700 leading-relaxed">
              At CyPhyLab, we're pushing the boundaries of cyber-physical systems. Our cutting-edge research combines advanced robotics, artificial intelligence, and sensor networks to create intelligent systems that interact seamlessly with the physical world.
            </p>
            <p className="text-xl text-gray-700 leading-relaxed">
              From smart cities to autonomous vehicles, our work is shaping the future of technology and improving lives across the globe.
            </p>
          </div>
          <div className="w-full md:w-1/2 p-4">
            <div className="rounded-lg overflow-hidden shadow-xl">
              <Image src="/labimage1.png" alt="Innovative Research" layout="responsive" width={600} height={400} objectFit="cover" />
            </div>
          </div>
        </div>
        <div className="flex flex-col md:flex-row-reverse items-center">
          <div className="w-full md:w-1/2 p-8">
            <h2 className="text-4xl font-bold mb-6 text-green-600">Collaborative Environment</h2>
            <p className="text-xl mb-4 text-gray-700 leading-relaxed">
              Our lab thrives on collaboration. We bring together brilliant minds from diverse backgrounds - computer scientists, electrical engineers, mechanical engineers, and more - to tackle complex challenges in cyber-physical systems.
            </p>
            <p className="text-xl text-gray-700 leading-relaxed">
              Through interdisciplinary teamwork and state-of-the-art facilities, we're fostering innovation and making breakthroughs that were once thought impossible.
            </p>
          </div>
          <div className="w-full md:w-1/2 p-4">
            <div className="rounded-lg overflow-hidden shadow-xl">
              <Image src="/labimage2.png" alt="Collaborative Environment" layout="responsive" width={600} height={400} objectFit="cover" />
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}