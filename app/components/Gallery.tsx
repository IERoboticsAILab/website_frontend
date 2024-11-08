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
  const [selectedImage, setSelectedImage] = useState<string | null>(null);

  return (
    <div className="mt-12">
      <h2 className="text-3xl font-bold mb-4">Gallery</h2>
      <div className="grid grid-cols-3 md:grid-cols-6 gap-4">
        {images?.map((image) => (
          <div
            key={image.id}
            className="aspect-square bg-gray-200 rounded-lg overflow-hidden cursor-pointer hover:opacity-90 transition-opacity"
            onClick={() => setSelectedImage(`${baseUrl}${image.url}`)}
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
      {selectedImage && (
        <dialog
          className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-75 z-50"
          open
          onClick={() => setSelectedImage(null)}
        >
          <div className="max-w-[90vw] max-h-[90vh] relative">
            <Image
              src={selectedImage}
              alt="Full size image"
              width={1200}
              height={1200}
              className="object-contain max-h-[90vh]"
            />
            <button
              onClick={() => setSelectedImage(null)}
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
