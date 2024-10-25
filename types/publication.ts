import { Member } from "./members";

export interface Publication {
  id: number;
  documentId: string;
  name: string;
  pdflink: string;
  paperlink: string;
  authors: null | string[];
  updatedAt: string;
  publishedAt: string;
  date: string;
  members: Member[];
}

interface Pagination {
  page: number;
  pageSize: number;
  pageCount: number;
  total: number;
}

export interface Publications {
  data: Publication[];
  meta: {
    pagination: Pagination;
  };
}

