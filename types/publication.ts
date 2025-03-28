import { Member } from "./members";
import { Project } from "./project";

export interface Publication {
  id: number;
  documentId: string;
  abstract: string;
  name: string;
  pdflink: string;
  paperlink: string;
  authors: null | string[];
  updatedAt: string;
  publishedAt: string;
  date: string;
  members: Member[];
  projects: Project[];
  image: {
    url: string;
  } | null;
}

interface Pagination {
  page: number;
  pageSize: number;
  pageCount: number;
  total: number;
}

export type Publications = {
  data: Publication[];
  meta: {
    pagination: Pagination;
  };
}
