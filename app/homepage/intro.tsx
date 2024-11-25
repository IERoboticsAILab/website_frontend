import React from 'react';

interface IntroChild {
  text: string;
  type: "text";
  bold?: boolean;
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
    return child.bold ? (
      <strong key={child.text}>{child.text}</strong>
    ) : (
      child.text
    );
  };

  const renderContent = (content: IntroContent) => {
    if (content.type === 'list') {
      const ListComponent = content.format === 'ordered' ? 'ol' : 'ul';
      return (
        <ListComponent className="list-disc ml-6 mt-2 text-gray-600">
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
      return (
        <h1 className="text-2xl md:text-3xl font-bold text-gray-900">
          {children}
        </h1>
      );
    }

    return (
      <p className="text-md mt-2 text-gray-600">
        {children}
      </p>
    );
  };

  return (
    <div className="flex flex-col md:flex-row justify-between m-8">
      <div className="flex flex-col mx-2 w-full md:w-[45%] mb-6 md:mb-0">
        {intro.map((content, index) => (
          <React.Fragment key={index}>
            {renderContent(content)}
          </React.Fragment>
        ))}
      </div>
      <div className="w-full md:w-[45%]">
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
