/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['localhost', process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG.replace(/^https?:\/\//, '')], // Remove protocol from URL
  },
  // ... other configurations
}

module.exports = nextConfig
