import Navbar from "@/components/navbar";
import Footer from "@/components/footer";
import Image from "next/image";

export default function People() {
  return (
    <div>
      <Navbar />
      {/* Principal Investigator Card */}
      <div className="max-w-3xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
        <div className="flex justify-between">
          <div>
            <h2 className="text-3xl font-bold mb-2">Principal investigator</h2>
            <h1 className="text-4xl font-bold mb-2">Eduardo Castelló Ferrer</h1>
            <p className="text-xl mb-4">Assistant Professor - School of Science & Technology</p>
            <p className="mb-4">Bio text that is customizable by Eduardo on demand</p>
            <div className="mt-4">
              {/* Placeholder for icon-links */}
              <p className="text-sm text-gray-600">At the bottom: row of customizable icon-links to external sites</p>
            </div>
          </div>
          <div className="w-48 h-48 bg-gray-300 rounded-full flex items-center justify-center">
            <span className="text-gray-600">Headshot</span>
          </div>
        </div>
      </div>

      {/* Lab Members Section */}
      <div className="max-w-6xl mx-auto my-8 p-6 bg-white shadow-lg rounded-lg">
        <h2 className="text-3xl font-bold mb-6">Lab members</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {[1, 2, 3, 4, 5, 6, 7, 8].map((member, index) => (
            <div key={index} className="flex flex-col items-center">
              <div className="w-32 h-32 bg-gray-300 rounded-full flex items-center justify-center mb-4">
                <span className="text-gray-600">Headshot</span>
              </div>
              <h3 className="font-semibold text-lg">Name Name</h3>
              <p className="text-sm text-gray-600">Title title (Program)</p>
              <p className="text-sm text-blue-600 cursor-pointer">[LINKS]</p>
            </div>
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
}
