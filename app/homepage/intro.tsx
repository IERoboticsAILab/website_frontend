'use client'
import React from 'react';
import { BlocksRenderer } from '@strapi/blocks-react-renderer';

interface IntroProps {
  videolink: string;
  videocaption: string;
  intro: any[];
}

function Intro({ videolink, videocaption, intro }: IntroProps) {
  return (
    <div className="flex flex-col md:flex-row justify-between m-8">
      <div className="flex flex-col mx-2 w-full md:w-[49.9%] mb-6 md:mb-0">
        <BlocksRenderer
          content={intro}
          blocks={{
            paragraph: ({ children }) => (
              <p className="text-md md:text-[1.2rem] mt-2 mb-4 text-gray-600 text-justify">
                {children}
              </p>
            ),
            heading: ({ children, level }) => {
              const headingClasses = {
                1: "text-2xl md:text-3xl font-bold text-gray-900",
                2: "text-xl md:text-2xl font-bold text-gray-900 mt-4",
                3: "text-lg md:text-xl font-bold text-gray-900 mt-3",
                4: "text-base md:text-lg font-bold text-gray-900 mt-2",
                5: "text-sm md:text-base font-bold text-gray-900 mt-2",
                6: "text-xs md:text-sm font-bold text-gray-900 mt-2"
              }[level];

              return React.createElement(`h${level}`, { className: headingClasses }, children);
            },
            list: ({ children, format }) => {
              const ListComponent = format === 'ordered' ? 'ol' : 'ul';
              const listStyle = format === 'ordered' ? 'list-decimal' : 'list-disc';
              return React.createElement(ListComponent, {
                className: `${listStyle} ml-6 mt-2 mb-4 text-gray-600`
              }, children);
            },
            'list-item': ({ children }) => (
              <li className="text-md md:text-[1.02rem] mb-1">{children}</li>
            ),
            link: ({ children, url }) => (
              <a href={url} className="text-blue-600 hover:underline">{children}</a>
            ),
          }}
          modifiers={{
            bold: ({ children }) => <strong>{children}</strong>,
            italic: ({ children }) => <em>{children}</em>,
            underline: ({ children }) => <u>{children}</u>,
            strikethrough: ({ children }) => <del>{children}</del>,
          }}
        />
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
