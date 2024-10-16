import Link from 'next/link';
import Image from 'next/image';

const Navbar = () => {
  return (
    <nav className="flex items-center justify-between px-4 py-3 bg-white shadow-md">
      <div className="flex items-center">
        <Link href="/">
          <Image src="/cpl.svg" alt="Logo" width={40} height={40} />
        </Link>
      </div>
      <div className="hidden md:flex space-x-4">
        <Link href="/" className="text-gray-700 hover:text-gray-900">Home</Link>
        <Link href="/about" className="text-gray-700 hover:text-gray-900">About</Link>
        <Link href="/services" className="text-gray-700 hover:text-gray-900">Services</Link>
        <Link href="/contact" className="text-gray-700 hover:text-gray-900">Contact</Link>
      </div>
      <div className="md:hidden">
        {/* Mobile menu button */}
        <button className="text-gray-500 hover:text-gray-600 focus:outline-none focus:text-gray-600">
          <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </button>
      </div>
    </nav>
  );
};

export default Navbar;
