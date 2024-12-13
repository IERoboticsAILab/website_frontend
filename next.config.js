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
  eslint: {
    ignoreDuringBuilds: true,
  },
}

module.exports = nextConfig
