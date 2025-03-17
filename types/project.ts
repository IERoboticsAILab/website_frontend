import { ImageFormat } from "./members";
import { Member } from "./members";
import { Publication } from "./publication";
type RichTextNode = {
  type: string;
  children: Array<{
    bold?: boolean;
    type: string;
    text?: string;
  }>;
  level?: number;
};

export interface Project {
  id: number;
  documentId: string;
  name: string;
  about: RichTextNode[];
  tagline: string;
  videolink: string;
  date: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  researchLine: boolean;
  hidden: boolean;
  projects: Project[];
  InfoCard?: string;
  banner: {
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
      thumbnail: ImageFormat;
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
  members: Member[];
  publications: Publication[];
}

export type Projects = {
  data: Project[];
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
};
