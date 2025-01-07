export type Landing = {
  data: {
    id: number;
    documentId: string;
    tagline: string;
    videolink: string;
    videocaption: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
    Intro2: string;
    customarea: Array<{
      __component: "shared.json-rich-text" | "shared.media";
      id: number;
      text?: Array<{
        type: "heading" | "paragraph";
        children: Array<{
          type: "text";
          text: string;
        }>;
        level?: number;
      }>;
      file?: {
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
          medium: ImageFormat;
          large: ImageFormat;
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
    }>;
    banner: Array<{
      id: number;
      documentId: string;
      name: string;
      alternativeText: string | null;
      caption: string | null;
      width: number;
      height: number;
      formats: {
        thumbnail: ImageFormat;
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
  };
  meta: Record<string, unknown>;
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
