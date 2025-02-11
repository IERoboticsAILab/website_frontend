export type JobPost = {
  id: number;
  documentId: string;
  position: string;
  description: string;
  requirements: string;
  contactemail: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  date: string;
  note: string;
  instructions: string;
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
