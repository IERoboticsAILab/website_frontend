export interface Project {
  id: string;
  name: string;
  about: string;
  tagline: string;
  videolink: string;
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
  members: Array<{
    firstname: string;
    lastnames: string;
    position: string;
  }>;
}
