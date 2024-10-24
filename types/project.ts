export type Projects= {
  data: Array<{
    id: number;
    documentId: string;
    name: string;
    about: Array<{
      type: 'heading' | 'paragraph';
      level?: number;
      children: Array<{
        type: 'text';
        text: string;
      }>;
    }>;
    videolink?: string;
    date?: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
    tagline: string;
    banner?: {
      id: number;
      documentId: string;
      name: string;
      alternativeText: string | null;
      caption: string | null;
      width: number;
      height: number;
      formats: {
        thumbnail?: ImageFormat;
        small?: ImageFormat;
        medium?: ImageFormat;
        large?: ImageFormat;
      };
      hash: string;
      ext: string;
      mime: string;
      size: number;
      url: string;
      previewUrl: string | null;
      provider: string;
      provider_metadata: null | Record<string, unknown>;
      createdAt: string;
      updatedAt: string;
      publishedAt: string;
    };
    gallery?: Array<{
      id: number;
      documentId: string;
      name: string;
      alternativeText: string | null;
      caption: string | null;
      width: number;
      height: number;
      formats: {
        thumbnail?: ImageFormat;
        small?: ImageFormat;
        medium?: ImageFormat;
        large?: ImageFormat;
      };
      hash: string;
      ext: string;
      mime: string;
      size: number;
      url: string;
      previewUrl: string | null;
      provider: string;
      provider_metadata: null | Record<string, unknown>;
      createdAt: string;
      updatedAt: string;
      publishedAt: string;
    }>;
    members: Array<{
      id: number;
      documentId: string;
      firstname: string;
      lastnames: string;
      github: string;
      linkedin: string;
      bio: string;
      email: string;
      position: string;
      createdAt: string;
      updatedAt: string;
      publishedAt: string;
    }>;
  }>;
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
};

type ImageFormat = {
  name: string;
  hash: string;
  ext: string;
  mime: string;
  path: string | null;
  width: number;
  height: number;
  size: number;
  sizeInBytes: number;
  url: string;
};
