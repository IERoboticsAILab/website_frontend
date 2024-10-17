import Link from 'next/link';
import Image from 'next/image';
import { FaGithub, FaYoutube } from 'react-icons/fa';

const Navbar = () => {
  return (
    <nav className="flex items-center justify-between px-6 py-4 bg-white shadow-md font-mono">
      <div className="flex items-center">
        <Link href="/">
          <Image src="/cpl.svg" alt="Logo" width={50} height={50} />
        </Link>
      </div>
      <div className="hidden md:flex space-x-6 items-center">
        <Link href="/" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">About</Link>
        <Link href="/people" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">People</Link>
        <Link href="/projects" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Projects</Link>
        <Link href="/publications" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Publications</Link>
        <Link href="/contact" className="text-lg text-gray-700 hover:text-blue-600 transition-colors duration-200">Contact</Link>
        <a href="https://github.com/your-github" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-gray-900 transition-colors duration-200">
          <FaGithub className="w-6 h-6" />
        </a>
        <a href="https://youtube.com/your-channel" target="_blank" rel="noopener noreferrer" className="text-gray-700 hover:text-red-600 transition-colors duration-200">
          <FaYoutube className="w-6 h-6" />
        </a>
      </div>
      <div className="md:hidden">
        {/* Mobile menu button */}
        <button className="text-gray-500 hover:text-gray-600 focus:outline-none focus:text-gray-600">
          <svg className="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </button>
      </div>
    </nav>
  );
};

export default Navbar;
