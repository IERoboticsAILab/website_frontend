import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import { Publication } from "@/types/publication";
import { notFound } from "next/navigation";
import PublicationsSearch from "@/components/PublicationsSearch";

export const dynamic = 'force-dynamic';


export default async function PublicationsPage() {
  let publications: Publication[] = [];

  try {
    const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:8081';
    const response = await fetch(`${baseUrl}/api/publications`, {
      cache: 'no-store',
      next: { revalidate: 0 }
    });

    if (!response.ok) {
      throw new Error('Failed to fetch publications data');
    }

    publications = await response.json();
  } catch (error) {
    console.error("Error fetching publications data:", error);
    notFound();
  }

  return (
    <div>
      <Navbar />
      <main className="container mx-auto px-4 py-8 min-h-screen">
        <h1 className="text-4xl font-bold mb-8">Publications</h1>
        <PublicationsSearch publications={publications} />
      </main>
      <Footer />
    </div>
  );
}
