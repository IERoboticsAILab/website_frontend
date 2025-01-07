export type ImageFormat = {
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

export type ProfilePicture = {
  id: number;
  documentId: string;
  name: string;
  alternativeText: string | null;
  caption: string | null;
  width: number;
  height: number;
  formats: {
    thumbnail: ImageFormat;
    small: ImageFormat;
    medium?: ImageFormat;
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

export type Member = {
  id: number;
  documentId: string;
  firstname: string;
  lastnames: string;
  github: string;
  linkedin: string;
  bio: string;
  email: string;
  website: string;
  position: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  profilepic: ProfilePicture | null;
  alum: boolean;
};

export type Members = {
  data: Member[];
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
};
