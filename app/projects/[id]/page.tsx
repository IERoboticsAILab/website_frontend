import { notFound } from 'next/navigation';
import Navbar from '@/components/navbar';
import Footer from '@/components/footer';
import Image from 'next/image';

// This function would typically fetch data from an API or database
async function getProject(id: string) {

  // Simulating an API call
  const projects = [
    { id: '1', title: 'Project 1', description: 'Full description of Project 1', imageUrl: '/project1.jpg' },
    { id: '2', title: 'Project 2', description: 'Full description of Project 2', imageUrl: '/project2.jpg' },
    { id: '3', title: 'Project 3', description: 'Full description of Project 3', imageUrl: '/project3.jpg' },
    { id: '4', title: 'Project 4', description: 'Full description of Project 4', imageUrl: '/project4.jpg' },
    { id: '5', title: 'Project 5', description: 'Full description of Project 5', imageUrl: '/project5.jpg' },
    { id: '6', title: 'Project 6', description: 'Full description of Project 6', imageUrl: '/project6.jpg' },
    // Add more projects as needed
  ];
  return projects.find(p => p.id === id);
}

export default async function ProjectPage({ params }: { params: { id: string } }) {
  const project = await getProject(params.id);

  if (!project) {
    notFound();
  }

  const members = [
    { name: "Wall-E", image: "/walle.jpg" },
    { name: "Wall-E", image: "/walle.jpg" },
    { name: "Wall-E", image: "/walle.jpg" },
    { name: "Wall-E", image: "/walle.jpg" },
  ];

  return (
    <div>
      <Navbar />
      <div className="relative">
        <div className="h-96 bg-gray-700 relative">
          <img
            src={project.imageUrl}
            alt={project.title}
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
            <h1 className="text-4xl font-bold text-white">{project.title}</h1>
          </div>
        </div>
      </div>
      <div className="container mx-auto px-4 py-8">
        <div className="flex flex-col md:flex-row gap-8">
          <div className="md:w-1/2">
            <h2 className="text-2xl font-bold mb-4">About</h2>
            <p className="text-lg">{project.description}</p>
            <iframe width="500" height="200" src="https://www.youtube.com/embed/SoZiZE2Zcng" title="Hedgehog Boat" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" ></iframe>
          </div>
          <div className="md:w-1/2">
            <h2 className="text-2xl font-bold mb-4">Details</h2>
            <p className="text-lg">Additional project information can go here. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
          </div>
        </div>

        <div className="mt-12">
          <h2 className="text-3xl font-bold mb-4">Publication</h2>
          <div className="bg-gray-100 p-4 rounded-lg">
            <p className="text-sm text-gray-600">IEU 2024</p>
            <h3 className="text-xl font-semibold my-2">{project.title}</h3>
            <p className="text-gray-700">Author 1, Author 2, Author 3</p>
            <div className="mt-4 flex space-x-4">
              <a href="#" className="flex items-center text-blue-600 hover:underline">
                <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M9 2a2 2 0 00-2 2v8a2 2 0 002 2h6a2 2 0 002-2V6.414A2 2 0 0016.414 5L14 2.586A2 2 0 0012.586 2H9z"></path>
                  <path d="M3 8a2 2 0 012-2h2.93a.5.5 0 01.5.5v7a.5.5 0 01-.5.5H5a2 2 0 01-2-2V8z"></path>
                </svg>
                PDF
              </a>
              <a href="#" className="flex items-center text-blue-600 hover:underline">
                <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z"></path>
                </svg>
                Link
              </a>
            </div>
          </div>
        </div>

        <div className="mt-12">
          <h2 className="text-3xl font-bold mb-4">Gallery</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {/* Replace these with actual project images */}
            {[1, 2, 3, 4, 5, 6, 7, 8].map((i) => (
              <div key={i} className="aspect-square bg-gray-200 rounded-lg overflow-hidden">
                <Image
                  src={`/placeholder-image-${i}.jpg`}
                  alt={`Gallery image ${i}`}
                  width={300}
                  height={300}
                  className="w-full h-full object-cover"
                />
              </div>
            ))}
          </div>
        </div>

        <div className="mt-12">
          <h2 className="text-3xl font-bold mb-8">AxLab Members</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {members.map((member) => (
              <div key={member.name} className="flex flex-col items-center">
                <div className="w-32 h-32 rounded-full overflow-hidden mb-4">
                  <Image
                    src={member.image}
                    alt={member.name}
                    width={128}
                    height={128}
                    className="w-full h-full object-cover"
                  />
                </div>
                <p className="text-center font-semibold">{member.name}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
}