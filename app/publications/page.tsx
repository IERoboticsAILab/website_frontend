
import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import axios from "axios";
import { Publications } from "@/types/publication";
import { notFound } from "next/navigation";
import PublicationsSearch from "@/components/PublicationsSearch";

export const dynamic = 'force-dynamic';

export default async function PublicationsPage(searchParams: any) {
  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/publications?populate[members][populate]=*&populate[projects][populate][0]=banner&populate[image][populate]=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };
  let publications: Publications;
  try {
    const res = await axios.get(url, { headers });
    publications = res.data;
  // Sort publications by date in descending order (newest first)
  publications.data.sort((a, b) => {
    if (!a.date) return 1;  // If a has no date, put it at the end
    if (!b.date) return -1; // If b has no date, put it at the end
    return new Date(b.date).getTime() - new Date(a.date).getTime();
  });
  } catch (error) {
    console.error(error);
    notFound();
  }

  return (
    <div>
      <Navbar />
      <main className="container mx-auto px-4 py-8 min-h-screen">
        <h1 className="text-4xl font-bold mb-8">Publications</h1>
        <PublicationsSearch publications={publications.data} />
      </main>
      <Footer />
    </div>
  );
}
