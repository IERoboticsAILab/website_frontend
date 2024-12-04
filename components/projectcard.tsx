'use client'
import Link from 'next/link';
import Image from 'next/image';
import { useState } from 'react';

interface ProjectCardProps {
  id: string;
  title: string;
  description: string;
  imageUrl?: string;
  layout?: 'overlay' | 'stacked';
}

const ProjectCard: React.FC<ProjectCardProps> = ({ id, title, description, imageUrl, layout = 'overlay' }) => {
  const [imgSrc, setImgSrc] = useState(imageUrl || '/walle.jpg');

  const handleImageError = () => {
    setImgSrc('/walle.jpg');
  };

  return (
    <Link href={`/projects/${id}`} className="block h-full">
      <div className="bg-white border border-gray-100 rounded-xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 relative group h-full">
        <div className={layout === 'stacked' ? 'h-48' : 'h-full'}>
          <Image
            src={imgSrc}
            alt={title}
            width={600}
            height={400}
            quality={100}
            priority
            className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
            onError={handleImageError}
          />
        </div>

        {layout === 'overlay' ? (
          <>
            <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-black/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            <div className="absolute inset-0 p-4 flex flex-col justify-end">
              <h3 className="text-xl font-bold text-white mb-1" style={{ textShadow: '0 2px 4px rgba(0,0,0,0.5)' }}>{title}</h3>
              <p className="text-gray-200 text-sm text-shadow">{description}</p>
            </div>
          </>
        ) : (
          <div className="p-4">
            <h3 className="text-xl font-bold text-gray-900 mb-2">{title}</h3>
            <p className="text-gray-600 text-sm">{description}</p>
          </div>
        )}
      </div>
    </Link>
  );
};

export default ProjectCard;
