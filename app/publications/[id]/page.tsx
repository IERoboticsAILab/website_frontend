import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import { notFound } from "next/navigation";
import Image from "next/image";

async function getPublications() {
  // Simulating an API call
  return [
    { id: '1', title: 'Publication 1', description: 'Description 1', imageUrl: '/walle.jpg' },
    { id: '2', title: 'Publication 2', description: 'Description 2', imageUrl: '/walle.jpg' },
    { id: '3', title: 'Publication 3', description: 'Description 3', imageUrl: '/walle.jpg' },
    { id: '4', title: 'Publication 4', description: 'Description 4', imageUrl: '/walle.jpg' },
    { id: '5', title: 'Publication 5', description: 'Description 5', imageUrl: '/walle.jpg' },
    { id: '6', title: 'Publication 6', description: 'Description 6', imageUrl: '/walle.jpg' },
    { id: '7', title: 'Publication 7', description: 'Description 7', imageUrl: '/walle.jpg' },
    { id: '8', title: 'Publication 8', description: 'Description 8', imageUrl: '/walle.jpg' },
    { id: '9', title: 'Publication 9', description: 'Description 9', imageUrl: '/walle.jpg' },
    { id: '10', title: 'Publication 10', description: 'Description 10', imageUrl: '/walle.jpg' },
    // Add more projects as needed
  ];
}

export default async function PublicationPage({ params }: { params: { id: string } }) {
  const publications = await getPublications();
  const publication = publications.find(pub => pub.id === params.id);

  if (!publication) {
    notFound();
  }

  return (
    <div>
      <Navbar />
      <main className="container mx-auto px-4 py-8">
        <h1 className="text-4xl font-bold mb-8">{publication.title}</h1>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          <div>
            <Image
              src={publication.imageUrl}
              alt={publication.title}
              width={600}
              height={400}
              className="rounded-lg shadow-lg"
            />
          </div>
          <div>
            <p className="text-xl mb-4">{publication.description}</p>
            {/* Add more details about the publication here */}
          </div>
        </div>
      </main>
      <Footer />
    </div>
  );
}
