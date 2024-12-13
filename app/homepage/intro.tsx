import React from 'react';

interface IntroChild {
  text: string;
  type: "text" | "link";
  bold?: boolean;
  italic?: boolean;
  underline?: boolean;
  strikethrough?: boolean;
  url?: string;
  children?: IntroChild[];
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

export const dynamic = 'force-dynamic';

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
          {content.children.map((item: IntroChild | { type: "list-item", children: IntroChild[] }, index) => (
            <li key={index} className="text-md md:text-[1.2rem]">
              {item.children && item.children.map((child: IntroChild, childIndex: number) => (
                <React.Fragment key={childIndex}>
                  {renderText(child)}
                </React.Fragment>
              ))}
            </li>
          ))}
        </ListComponent>
      );
    }

    const children = content.children.map((child: IntroChild | { type: "list-item", children: IntroChild[] }, index) => {
      if ('type' in child && child.type === 'list-item') {
        return (
          <React.Fragment key={index}>
            {child.children.map((subChild) => renderText(subChild))}
          </React.Fragment>
        );
      }
      return <React.Fragment key={index}>{renderText(child as IntroChild)}</React.Fragment>;
    });

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
      <p className="text-md md:text-[1.2rem] mt-2 text-gray-600 text-justify">
        {children}
      </p>
    );
  };

  return (
    <div className="flex flex-col md:flex-row justify-between m-8">
      <div className="flex flex-col mx-2 w-full md:w-[49.5%] mb-6 md:mb-0">
        {intro.map((content, index) => (
          <React.Fragment key={index}>
            {renderContent(content)}
          </React.Fragment>
        ))}
      </div>
      <div className="w-full md:w-[40%] flex justify-center flex-col items-center my-auto">
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
