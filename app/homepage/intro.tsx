import React from 'react';

interface IntroProps {
  videolink: string;
  videocaption: string;
  introtitle: string;
  introdescription: string;
}

function Intro({ videolink, videocaption, introtitle, introdescription }: IntroProps) {
  return (
    <div className="flex flex-col md:flex-row justify-center m-4 md:m-10">
      <div className="flex flex-col mx-2 md:mx-5 max-w-full md:max-w-[40%] mb-6 md:mb-0">
        <h1 className="text-2xl md:text-3xl font-bold text-gray-900">{introtitle}</h1>
        <p className="text-md mt-2 text-gray-600">{introdescription}</p>
      </div>
      <div className="w-full md:w-auto">
        <div className="relative w-full aspect-video md:w-[500px] border border-gray-300 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
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
