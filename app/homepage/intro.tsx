import ReactMarkdown from 'react-markdown';

interface IntroProps {
  videolink: string;
  videocaption: string;
  intro2: string;
}

export const dynamic = 'force-dynamic';

function Intro({ videolink, videocaption, intro2 }: IntroProps) {
  return (
    <div className="flex flex-col md:flex-row justify-between m-8">
      <div className="flex flex-col mx-2 w-full md:w-[49.9%] mb-6 md:mb-0">

        <ReactMarkdown
          components={{
            h1: ({ ...props }) => <h1 className="text-2xl md:text-3xl font-bold text-gray-900" {...props} />,
            h2: ({ ...props }) => <h2 className="text-xl md:text-2xl font-bold text-gray-900 mt-4" {...props} />,
            h3: ({ ...props }) => <h3 className="text-lg md:text-xl font-bold text-gray-900 mt-3" {...props} />,
            h4: ({ ...props }) => <h4 className="text-base md:text-lg font-bold text-gray-900 mt-2" {...props} />,
            a: ({ ...props}) => <a className="text-blue-600 hover:underline" {...props} />,
            p: ({ ...props }) => <p className="text-md md:text-[1.2rem] mt-2 mb-4 text-gray-600 text-justify" {...props} />,
            ul: ({ ...props }) => <ul className="list-disc ml-6 mt-2 text-gray-600" {...props} />,
            ol: ({ ...props }) => <ol className="list-decimal ml-6 mt-2 text-gray-600" {...props} />,
            li: ({ ...props }) => <li className="mb-2 text-md md:text-[1.2rem] " {...props} />,
            blockquote: ({ ...props }) => <blockquote className="border-l-4 border-border pl-4 italic my-4 text-foreground" {...props} />,
            code: ({ ...props }) => <code className="bg-muted rounded px-1 py-0.5 font-mono text-sm text-foreground" {...props} />
            }}
        >
          {intro2}
        </ReactMarkdown>
      </div>
      <div className="w-full md:w-[40%] flex justify-center flex-col items-center my-auto">
        <div className="relative w-full aspect-video border border-gray-300 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
          <iframe
            className="w-full h-full"
            src={videolink}
            title={videocaption}
            allow="fullscreen"
          ></iframe>
        </div>
        <p className="text-center italic text-sm text-gray-700 mt-2">{videocaption}</p>
      </div>
    </div>
  );
}

export default Intro;
