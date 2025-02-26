"use client";

import { useState } from "react";
import { Publication } from "@/types/publication";
import Image from "next/image";
import Link from "next/link";

interface PublicationsSearchProps {
  publications: Publication[];
}

export default function PublicationsSearch({ publications }: PublicationsSearchProps) {
  const [searchTerm, setSearchTerm] = useState("");

  const filteredPublications = publications.filter((pub) => {
    const searchTermLower = searchTerm.toLowerCase();
    return (
      pub.name?.toLowerCase().includes(searchTermLower) ||
      pub.authors?.toLowerCase().includes(searchTermLower) ||
      pub.abstract?.toLowerCase().includes(searchTermLower)
    );
  });

  return (
    <div>
      <div className="mb-6">
        <div className="relative">
          <input
            type="text"
            placeholder="Search publications by title, authors, or content..."
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
        {searchTerm && (
          <p className="mt-2 text-sm text-gray-600">
            Found {filteredPublications.length} publication{filteredPublications.length !== 1 ? 's' : ''}
          </p>
        )}
      </div>

      <div className="space-y-8">
        {filteredPublications.map((pub) => (
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
        ))}
      </div>
    </div>
  );
}

