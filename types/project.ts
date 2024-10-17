export interface Project {
  id: string;
  name: string;
  about: string;
  tagline: string;
  banner?: {
    formats?: {
      thumbnail?: {
        url: string;
      };
    };
  };
  gallery?: Array<{
    formats?: {
      thumbnail?: {
        url: string;
      };
    };
  }>;
}
