/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
    STRAPI_API_URL: process.env.STRAPI_API_URL,
    STRAPI_API_KEY: process.env.STRAPI_API_KEY,
    STRAPI_API_URL_IMG: process.env.STRAPI_API_URL_IMG,
  },
};

export default nextConfig;
