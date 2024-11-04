/** @type {import('next').NextConfig} */

const nextConfig = {
  images: {
    domains: ['localhost'],
    remotePatterns: [
      {
        protocol: 'http',
        hostname: '**',
      },
    ],
  },
  // ... other configurations
}

module.exports = nextConfig
