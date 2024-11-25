import React from 'react';

interface IntroChild {
  text: string;
  type: "text" | "link";
  bold?: boolean;
  italic?: boolean;
  underline?: boolean;
  strikethrough?: boolean;
  url?: string;
}

interface IntroContent {
  type: "heading" | "paragraph" | "list";
  level?: number;
  format?: "unordered" | "ordered";
  children: (IntroChild | { type: "list-item", children: IntroChild[] })[];
}

interface IntroProps {
  videolink: string;
  videocaption: string;
  intro: IntroContent[];
}

function Intro({ videolink, videocaption, intro }: IntroProps) {
  const renderText = (child: IntroChild) => {
    let content: React.ReactNode = child.text;

    // Wrap content in appropriate styling elements
    if (child.bold) {
      content = <strong>{content}</strong>;
    }
    if (child.italic) {
      content = <em>{content}</em>;
    }
    if (child.underline) {
      content = <u>{content}</u>;
    }
    if (child.strikethrough) {
      content = <del>{content}</del>;
    }
    if (child.type === "link" && child.url) {
      content = <a href={child.url} className="text-blue-600 hover:underline">{content}</a>;
    }

    return content;
  };

  const renderContent = (content: IntroContent) => {
    if (content.type === 'list') {
      const ListComponent = content.format === 'ordered' ? 'ol' : 'ul';
      const listStyle = content.format === 'ordered' ? 'list-decimal' : 'list-disc';

      return (
        <ListComponent className={`${listStyle} ml-6 mt-2 text-gray-600`}>
          {content.children.map((item: any, index) => (
            <li key={index}>
              {item.children.map((child: IntroChild, childIndex: number) => (
                <React.Fragment key={childIndex}>
                  {renderText(child)}
                </React.Fragment>
              ))}
            </li>
          ))}
        </ListComponent>
      );
    }

    const children = content.children.map((child: any, index) => (
      <React.Fragment key={index}>{renderText(child)}</React.Fragment>
    ));

    if (content.type === 'heading') {
      // Handle different heading levels
      const headingClasses = {
        1: "text-2xl md:text-3xl font-bold text-gray-900",
        2: "text-xl md:text-2xl font-bold text-gray-900 mt-4",
        3: "text-lg md:text-xl font-bold text-gray-900 mt-3",
        4: "text-base md:text-lg font-bold text-gray-900 mt-2",
        5: "text-sm md:text-base font-bold text-gray-900 mt-2",
        6: "text-xs md:text-sm font-bold text-gray-900 mt-2"
      }[content.level || 1];

      const HeadingTag = `h${content.level || 1}` as keyof JSX.IntrinsicElements;
      return (
        <HeadingTag className={headingClasses}>
          {children}
        </HeadingTag>
      );
    }

    return (
      <p className="text-md mt-2 text-gray-600">
        {children}
      </p>
    );
  };

  return (
    <div className="flex flex-col md:flex-row justify-between items-center m-8">
      <div className="flex flex-col mx-2 w-full md:w-[45%] mb-6 md:mb-0 self-start">
        {intro.map((content, index) => (
          <React.Fragment key={index}>
            {renderContent(content)}
          </React.Fragment>
        ))}
      </div>
      <div className="w-full md:w-[45%] flex justify-center flex-col items-center sticky top-1/2 md:translate-y-[-10%]">
        <div className="relative w-full aspect-video border border-gray-300 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
          <iframe
            className="w-full h-full"
            src={videolink}
            title={videocaption}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
          ></iframe>
        </div>
        <p className="text-center italic text-sm text-gray-700 mt-2">{videocaption}</p>
      </div>
    </div>
  );
}

export default Intro;
