export type JobPost = {
  id: number;
  documentId: string;
  position: string;
  recommendation: string;
  requirements: string;
  contactemail: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  date: string;
  note: string;
};

export type JobPosts = {
  data: JobPost[];
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
};
