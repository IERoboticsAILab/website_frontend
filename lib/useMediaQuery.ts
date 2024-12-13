import { useEffect, useState } from 'react';

// Define breakpoints (in pixels)
export const BREAKPOINTS = {
  laptop: 1024, // Typical laptop width
  desktop: 1440, // Typical desktop monitor width
} as const;

export function useMediaQuery() {
  const [isLaptop, setIsLaptop] = useState(false);
  const [isDesktop, setIsDesktop] = useState(false);

  useEffect(() => {
    // Create media query strings
    const laptopQuery = `(min-width: ${BREAKPOINTS.laptop}px) and (max-width: ${BREAKPOINTS.desktop - 1}px)`;
    const desktopQuery = `(min-width: ${BREAKPOINTS.desktop}px)`;

    // Create MediaQueryList objects
    const laptopMql = window.matchMedia(laptopQuery);
    const desktopMql = window.matchMedia(desktopQuery);

    // Update state based on current matches
    const updateMatches = () => {
      setIsLaptop(laptopMql.matches);
      setIsDesktop(desktopMql.matches);
    };

    // Initial check
    updateMatches();

    // Add listeners for changes
    laptopMql.addListener(updateMatches);
    desktopMql.addListener(updateMatches);

    // Cleanup listeners
    return () => {
      laptopMql.removeListener(updateMatches);
      desktopMql.removeListener(updateMatches);
    };
  }, []);

  return {
    isLaptop,
    isDesktop,
  };
}
