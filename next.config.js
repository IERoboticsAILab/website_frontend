/** @type {import('next').NextConfig} */
/** @type {import('./envConfig.ts')} */
const apiUrl = new URL(process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG);
const nextConfig = {
  images: {
    domains: ['localhost', apiUrl.hostname], // Add other domains if needed
  },
  // ... other configurations
}

module.exports = nextConfig
