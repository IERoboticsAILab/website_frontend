/** @type {import('next').NextConfig} */

const nextConfig = {
  images: {
    domains: ['localhost'],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
    ],
  },
  env: {
    STRAPI_API_URL: process.env.STRAPI_API_URL,
    STRAPI_API_KEY: process.env.STRAPI_API_KEY,
    STRAPI_API_URL_IMG: process.env.STRAPI_API_URL_IMG,
  },
  // ... other configurations
}

module.exports = nextConfig