"use client"
import { useState, useMemo } from "react";
import { Publication } from "@/types/publication";
import Image from "next/image";
import Link from "next/link";

interface PublicationsSearchProps {
  publications: Publication[];
}

export default function PublicationsSearch({ publications }: PublicationsSearchProps) {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedYear, setSelectedYear] = useState<string>("all");

  // Extract all available years from publication dates
  const availableYears = useMemo(() => {
    const years = publications
      .filter(pub => pub.date)
      .map(pub => new Date(pub.date).getFullYear().toString())
      .filter((year, index, self) => self.indexOf(year) === index)
      .sort((a, b) => b.localeCompare(a)); // Sort years in descending order
    
    return ["all", ...years];
  }, [publications]);

  // Filter publications based on search term and selected year
  const filteredPublications = useMemo(() => {
    return publications.filter((pub) => {
      const matchesSearchTerm = searchTerm === "" || (
        (pub.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        (Array.isArray(pub.authors) && pub.authors.join(" ").toLowerCase().includes(searchTerm.toLowerCase())) ||
        pub.abstract?.toLowerCase().includes(searchTerm.toLowerCase()))
      );
      
      const matchesYear = selectedYear === "all" || 
        (pub.date && new Date(pub.date).getFullYear().toString() === selectedYear);
      
      return matchesSearchTerm && matchesYear;
    });
  }, [publications, searchTerm, selectedYear]);

  return (
    <div>
      <div className="mb-6">
        <div className="flex flex-col md:flex-row gap-4 mb-4">
          <div className="relative flex-grow">
            <input
              type="text"
              placeholder="Search publications by title or content..."
              className="w-full p-3 pl-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
            <div className="absolute left-3 top-3.5 text-gray-400">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
            {searchTerm && (
              <button
                className="absolute right-3 top-3.5 text-gray-400 hover:text-gray-600"
                onClick={() => setSearchTerm("")}
              >
                <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            )}
          </div>
          
          <div className="md:w-48">
            <select
              className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              value={selectedYear}
              onChange={(e) => setSelectedYear(e.target.value)}
            >
              {availableYears.map((year) => (
                <option key={year} value={year}>
                  {year === "all" ? "All Years" : year}
                </option>
              ))}
            </select>
          </div>
        </div>
        
        <div className="flex justify-between items-center">
          <p className="text-sm text-gray-600">
            Found {filteredPublications.length} publication{filteredPublications.length !== 1 ? 's' : ''}
            {selectedYear !== "all" && ` from ${selectedYear}`}
            {searchTerm && ` matching "${searchTerm}"`}
          </p>
          
          {(searchTerm || selectedYear !== "all") && (
            <button
              className="text-sm text-blue-600 hover:underline"
              onClick={() => {
                setSearchTerm("");
                setSelectedYear("all");
              }}
            >
              Clear filters
            </button>
          )}
        </div>
      </div>

      <div className="space-y-8">
        {filteredPublications.length > 0 ? (
          filteredPublications.map((pub) => (
            <div key={pub.id} className="flex flex-col md:flex-row gap-4 border-b pb-8">
              <div className="md:w-1/3">
                <Image
                  src={pub.image?.url
                    ? `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${pub.image.url}`
                    : pub.projects?.[0]?.banner?.url
                      ? `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${pub.projects[0].banner.url}`
                      : '/wall-e.jpg'
                  }
                  alt={pub.name || "Publication image"}
                  width={300}
                  height={200}
                  className="w-full object-cover"
                />
              </div>
              <div className="md:w-2/3">
                <p className="text-sm text-gray-600 mb-2">{`${pub.date?.split('-').slice(0,2).reverse().join('-')}`}</p>
                <Link href={`/projects/${pub.projects?.[0]?.name?.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '')}`}>
                  <h2 className="text-xl font-semibold mb-2 hover:text-blue-600 hover:underline">{pub.name}</h2>
                </Link>
                <p className="text-sm text-gray-700 mb-4">{pub.authors}</p>
                <div className="flex gap-2 mb-4">
                  {pub.pdflink && (
                  <a href={pub.pdflink} className="flex items-center gap-1 text-blue-600 hover:underline " target="_blank">
                    <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                      <path fillRule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clipRule="evenodd" />
                    </svg>
                    Pre-Print
                  </a>
                  )}
                  {pub.paperlink && (
                    <a href={pub.paperlink} className="flex items-center gap-1 text-blue-600 hover:underline" target="_blank" rel="noopener noreferrer">
                      <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                        <path fillRule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clipRule="evenodd" />
                      </svg>
                      Publication
                    </a>
                  )}
                </div>
                <p><strong>Abstract:</strong></p>
                <p className="text-justify pr-6">{pub.abstract}</p>
              </div>
            </div>
          ))
        ) : (
          <div className="text-center py-10">
            <p className="text-gray-600">No publications found matching your criteria.</p>
            <button
              className="mt-4 text-blue-600 hover:underline"
              onClick={() => {
                setSearchTerm("");
                setSelectedYear("all");
              }}
            >
              View all publications
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
