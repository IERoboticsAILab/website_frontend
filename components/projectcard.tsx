'use client'
import Link from 'next/link';
import Image from 'next/image';
import { useState } from 'react';

interface ProjectCardProps {
  id: string;
  title: string;
  description: string;
  imageUrl: string;
}

const ProjectCard: React.FC<ProjectCardProps> = ({ id, title, description, imageUrl }) => {
  const [imgSrc, setImgSrc] = useState(imageUrl);

  const handleImageError = () => {
    setImgSrc('/path/to/fallback-image.jpg'); // Replace with your fallback image path
  };

  return (
    <Link href={`/projects/${id}`} className="block">
      <div className="border rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow duration-300 relative">
        <Image
          src={imgSrc}
          alt={title}
          width={300}
          height={200}
          className="w-full h-48 object-cover"
          onError={handleImageError}
        />
        <div className="absolute inset-0 bg-white bg-opacity-50"></div>
        <div className="absolute inset-0 p-4 flex flex-col justify-center">
          <h3 className="text-xl font-semibold mb-2">{title}</h3>
          <p className="text-gray-600">{description}</p>
        </div>
      </div>
    </Link>
  );
};

export default ProjectCard;
