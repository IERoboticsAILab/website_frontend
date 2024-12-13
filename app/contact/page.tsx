import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import { JobPosts } from "@/types/jobpost";
import axios from "axios";
import { notFound } from "next/navigation";
import ReactMarkdown from 'react-markdown';
import CalendarSection from "./components/CalendarSection";

// Add this line to enable dynamic rendering
export const dynamic = 'force-dynamic';

export default async function Contact() {

  const url = `${process.env.NEXT_PUBLIC_STRAPI_API_URL}/jobposts?populate=*`;
  const headers = {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_API_KEY}`,
  };

  let jobposts: JobPosts;
  try {
    const res = await axios.get(url, { headers });
    jobposts = res.data;
  } catch (error) {
    console.error("Error fetching data:", error);
    notFound();
  }

  return (

    <div>
      <Navbar />
      <main className="container mx-auto px-4 py-8">
        <h1 className="text-4xl font-bold mb-8">Contact Information & Applications</h1>

        <div className="flex flex-col md:flex-row gap-8">
          <div className="md:w-1/2 bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-2xl font-semibold mb-6 text-gray-800">Physical Location</h2>
            <div className="space-y-2 mb-8">
              <div className="flex items-center text-gray-600">
                <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
                </svg>
                <div>
                  <p>P.º de la Castellana, 259</p>
                  <p>Fuencarral-El Pardo, 28046 Madrid</p>
                  <p>Floor 5</p>
                </div>
              </div>
            </div>

            <h3 className="text-xl font-semibold mb-4 text-gray-800">Mailing Address</h3>
            <div className="flex items-center text-gray-600">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
              </svg>
              <div>
                <p>P.º de la Castellana, 259</p>
                <p>Fuencarral-El Pardo, 28046 Madrid</p>
              </div>
            </div>
          </div>
          <div className="md:w-1/2 rounded-lg overflow-hidden shadow-md">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d97116.19538809614!2d-3.7714923655639856!3d40.47789524178492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4228c1e451ac01%3A0xa59dc956c1ed626a!2sIE%20University%20-%20IE%20Tower!5e0!3m2!1sen!2ses!4v1729895960458!5m2!1sen!2ses"
              width="600"
              height="450"
              loading="lazy"
              className="w-full h-[20rem]"
              title="IE University Location Map"
            />
          </div>
        </div>

        <section className="mt-12">
          <h2 className="text-3xl font-bold mb-6">Open positions and more</h2>
          <p className="text-lg mb-8">
            We are always looking for new talents to join our team. If you are interested in any of the positions listed below, please contact us.
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {jobposts.data.map((job) => (
              <div key={job.id} className="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow">
                <h3 className="text-2xl font-semibold mb-3 text-gray-800">{job.position}</h3>
                <div className="space-y-4">
                  <div>
                    <h4 className="text-sm font-medium text-gray-500 uppercase tracking-wider">Description</h4>
                    <div className="mt-1 text-gray-700 prose prose-sm">
                      <ReactMarkdown>{job.description}</ReactMarkdown>
                    </div>
                  </div>

                  <div>
                    <h4 className="text-sm font-medium text-gray-500 uppercase tracking-wider">Requirements</h4>
                    <div className="mt-1 text-gray-700 prose prose-sm">
                      <ReactMarkdown>{job.requirements}</ReactMarkdown>
                    </div>
                  </div>

                  <div className="pt-4 border-t border-gray-200">
                    <div className="flex items-center mb-2">
                      <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 text-gray-400 mr-2" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                      </svg>
                      <a href={`mailto:${job.contactemail}`} className="text-blue-600 hover:underline">{job.contactemail}</a>
                    </div>

                    <div className="flex items-center mb-2">
                      <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 text-gray-400 mr-2" viewBox="0 0 20 20" fill="currentColor">
                        <path fillRule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clipRule="evenodd" />
                      </svg>
                      <span className="text-gray-600">Deadline: {job.date}</span>
                    </div>

                    {job.note && (
                      <div className="mt-3 p-3 bg-gray-50 rounded-md">
                        <p className="text-sm text-gray-600 italic">{job.note}</p>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        <CalendarSection />
      </main>
      <Footer />
    </div>
  );
}
