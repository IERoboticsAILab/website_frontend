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
  console.log('Full intro prop:', JSON.stringify(intro, null, 2));

  const renderText = (child: IntroChild) => {
    console.log('renderText called with:', child);
    let content: React.ReactNode = child.text;

    const wrappedContent = <span>{content}</span>;
    console.log('Initial wrapped content created');

    if (child.bold) {
      console.log('Applying bold to:', child.text);
      content = <strong>{wrappedContent}</strong>;
    }
    if (child.italic) {
      console.log('Applying italic to:', child.text);
      content = <em>{wrappedContent}</em>;
    }
    if (child.underline) {
      console.log('Applying underline to:', child.text);
      content = <u>{wrappedContent}</u>;
    }
    if (child.strikethrough) {
      console.log('Applying strikethrough to:', child.text);
      content = <del>{wrappedContent}</del>;
    }
    if (child.type === "link" && child.url) {
      console.log('Applying link to:', child.text, 'with URL:', child.url);
      content = <a href={child.url} className="text-blue-600 hover:underline">{wrappedContent}</a>;
    }

    return content;
  };

  const renderContent = (content: IntroContent) => {
    console.log('renderContent called with type:', content.type);
    console.log('Content full object:', content);

    if (content.type === 'list') {
      console.log('Rendering list with format:', content.format);
      const ListComponent = content.format === 'ordered' ? 'ol' : 'ul';
      const listStyle = content.format === 'ordered' ? 'list-decimal' : 'list-disc';

      return (
        <ListComponent className={`${listStyle} ml-6 mt-2 mb-4 text-gray-600`}>
          {content.children.map((item: IntroChild | { type: "list-item", children: IntroChild[] }, index) => {
            console.log('List item:', item);
            return (
              <li key={index} className="text-md md:text-[1.02rem] mb-1">
                {('type' in item && item.type === 'list-item') ? (
                  item.children.map((child: IntroChild, childIndex: number) => {
                    console.log('List item child:', child);
                    return (
                      <React.Fragment key={childIndex}>
                        {renderText(child)}
                      </React.Fragment>
                    );
                  })
                ) : (
                  renderText(item as IntroChild)
                )}
              </li>
            );
          })}
        </ListComponent>
      );
    }

    console.log('Processing non-list content children:', content.children);
    const children = content.children.map((child: IntroChild | { type: "list-item", children: IntroChild[] }, index) => {
      if ('type' in child && child.type === 'list-item') {
        console.log('Processing list-item type child:', child);
        return child.children.map((subChild, subIndex) => {
          console.log('Processing list-item subchild:', subChild);
          return (
            <React.Fragment key={`${index}-${subIndex}`}>
              {renderText(subChild)}
            </React.Fragment>
          );
        });
      }
      console.log('Processing regular child:', child);
      return <React.Fragment key={index}>{renderText(child as IntroChild)}</React.Fragment>;
    });

    if (content.type === 'heading') {
      console.log('Rendering heading level:', content.level);
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

    console.log('Rendering paragraph with children:', children);
    return (
      <p className="text-md md:text-[1.2rem] mt-2 mb-4 text-gray-600 text-justify">
        {children}
      </p>
    );
  };

  console.log('Rendering full component with intro length:', intro.length);
  return (
    <div className="flex flex-col md:flex-row justify-between m-8">
      <div className="flex flex-col mx-2 w-full md:w-[49.9%] mb-6 md:mb-0">
        {intro.slice(0, -1).map((content, index) => {
          console.log('Rendering content index:', index);
          return (
            <React.Fragment key={index}>
              {renderContent(content)}
            </React.Fragment>
          );
        })}
        <p className="text-md md:text-[1.2rem] mt-2 mb-4 text-gray-600 text-justify">
          <strong>CyPhy Life</strong> is an independent research initiative of the <a href="https://ixlabs.ie.edu/" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Impact Xcelerator Labs</a> at the <a href="https://www.ie.edu/school-science-technology/" target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">School of Science and Technology</a>.
        </p>
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
