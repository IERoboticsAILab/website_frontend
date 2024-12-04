'use client';
import Link from 'next/link';
import Image from 'next/image';
import { FaGithub, FaYoutube } from 'react-icons/fa';
import { useState } from 'react';

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <div className="relative">
      <nav className="flex items-center justify-between px-6 py-4 bg-white shadow-md relative z-50">
        <div className="flex items-center mx-4">
          <Link href="/">
            <Image src="/cpl.svg" alt="Logo" width={70} height={70} />
          </Link>
        </div>
        <div className="hidden md:flex space-x-6 items-center">
          <Link href="/" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">About</Link>
          <Link href="/people" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">People</Link>
          <Link href="/projects" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Projects</Link>
          <Link href="/publications" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Publications</Link>
          <Link href="/contact" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Contact</Link>
          <a href="https://github.com/IERoboticsAILab" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-gray-900 transition-colors duration-200">
            <FaGithub className="w-6 h-6" />
          </a>
          <a href="https://www.youtube.com/channel/UCp0CmorXY4D5l0jWREqBfJQ" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-red-600 transition-colors duration-200">
            <FaYoutube className="w-6 h-6" />
          </a>
        </div>
        <div className="md:hidden">
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="text-gray-500 hover:text-gray-600 focus:outline-none focus:text-gray-600"
          >
            <svg className="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
        </div>
      </nav>

      {/* Mobile menu */}
      <div
        className={`
          absolute top-full left-0 right-0
          bg-white shadow-md md:hidden
          transform transition-transform duration-200 ease-in-out z-40
          ${isMenuOpen ? 'translate-y-0' : '-translate-y-full'}
        `}
      >
        <div className="flex flex-col space-y-4 px-6 py-4">
          <Link href="/" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">About</Link>
          <Link href="/people" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">People</Link>
          <Link href="/projects" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Projects</Link>
          <Link href="/publications" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Publications</Link>
          <Link href="/contact" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Contact</Link>
          <div className="flex space-x-4">
            <a href="https://github.com/your-github" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-gray-900 transition-colors duration-200">
              <FaGithub className="w-6 h-6" />
            </a>
            <a href="https://youtube.com/your-channel" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-red-600 transition-colors duration-200">
              <FaYoutube className="w-6 h-6" />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Navbar;
