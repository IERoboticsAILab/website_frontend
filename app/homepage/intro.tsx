import React from 'react';

interface IntroProps {
  videolink: string;
  videocaption: string;
  introtitle: string;
  introdescription: string;
}

const Intro: React.FC<IntroProps> = ({ videolink, videocaption, introtitle, introdescription }) => {
  return (
    <div className="flex flex-row justify-center m-10">
      <div className="flex flex-col mx-5 max-w-[40%]">
      <h1 className="text-4xl font-bold">{introtitle}</h1>
      <p className="text-lg mt-4">{introdescription}</p>

      </div>
      <div>
      <iframe width="500" height="315" src={videolink} title={videocaption} allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"></iframe>
      <p className="text-center italic text-sm text-gray-600 mt-2">{videocaption}</p>
      </div>
    </div>
  );
};

export default Intro;
