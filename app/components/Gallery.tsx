'use client';
import { useState } from 'react';
import Image from 'next/image';

interface GalleryProps {
  images: Array<{
    id: number;
    url: string;
    name: string;
  }>;
  baseUrl: string;
}

export default function Gallery({ images, baseUrl }: GalleryProps) {
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);

  const handlePrevious = (e: React.MouseEvent) => {
    e.stopPropagation();
    setSelectedIndex(prev => prev === 0 ? images.length - 1 : prev! - 1);
  };

  const handleNext = (e: React.MouseEvent) => {
    e.stopPropagation();
    setSelectedIndex(prev => prev === images.length - 1 ? 0 : prev! + 1);
  };

  return (
    <div className="mt-12">
      <h2 className="text-3xl font-bold mb-4">Gallery</h2>
      <div className="grid grid-cols-3 md:grid-cols-6 gap-4">
        {images?.map((image, index) => (
          <div
            key={image.id}
            className="aspect-square bg-gray-200 rounded-lg overflow-hidden cursor-pointer hover:opacity-90 transition-opacity"
            onClick={() => setSelectedIndex(index)}
          >
            <Image
              src={`${baseUrl}${image.url}`}
              alt={image.name}
              width={200}
              height={200}
              className="w-full h-full object-cover"
            />
          </div>
        ))}
      </div>

      {/* Modal/Dialog for full-size image */}
      {selectedIndex !== null && (
        <dialog
          className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-75 z-50"
          open
          onClick={() => setSelectedIndex(null)}
        >
          <div className="max-w-[90vw] max-h-[90vh] relative">
            <Image
              src={`${baseUrl}${images[selectedIndex].url}`}
              alt={images[selectedIndex].name}
              width={1200}
              height={1200}
              className="object-contain max-h-[90vh]"
            />

            {/* Navigation Arrows */}
            <button
              onClick={handlePrevious}
              className="absolute left-4 top-1/2 -translate-y-1/2 text-white bg-black bg-opacity-50 rounded-full p-2 hover:bg-opacity-75"
              aria-label="Previous image"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
              </svg>
            </button>

            <button
              onClick={handleNext}
              className="absolute right-4 top-1/2 -translate-y-1/2 text-white bg-black bg-opacity-50 rounded-full p-2 hover:bg-opacity-75"
              aria-label="Next image"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
              </svg>
            </button>

            {/* Close button */}
            <button
              onClick={(e) => {
                e.stopPropagation();
                setSelectedIndex(null);
              }}
              className="absolute top-4 right-4 text-white bg-black bg-opacity-50 rounded-full p-2 hover:bg-opacity-75"
            >
              Close
            </button>
          </div>
        </dialog>
      )}
    </div>
  );
}
