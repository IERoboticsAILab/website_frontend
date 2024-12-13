import Image from "next/image";
import { Landing } from "@/types/landing";

interface CustomSectionProps {
  customarea: Landing['data']['customarea'];
}

export const dynamic = 'force-dynamic';

function CustomSection({ customarea }: CustomSectionProps) {
  return (
    <div className="w-full bg-[#241f21]">
      <div className="mx-10 py-8">
        <div className="flex flex-col md:flex-row items-center">
          <div className="w-full md:w-1/2">
            <div className="text-xl mb-4 text-white leading-relaxed text-justify">
              <h1 className="text-3xl font-bold mb-8 text-white">Mission</h1>
              {customarea?.[0]?.text?.map((textItem, i) => (
                <div key={i}>

                  {textItem.children?.map((child, j) => (
                    <div key={`${i}-${j}`}>

                      {textItem.type === "paragraph" ? (
                        <p className="text-md md:text-[1.2rem] mt-2 mb-5 text-justify">{child.text}</p>
                      ) : textItem.type === "heading" ? (
                        <h2 className="text-2xl font-semibold mb-4">{child.text}</h2>
                      ) : (
                        <span className="text-md md:text-[1.2rem] mt-6 mb-4 text-justify">{child.text}</span>
                      )}
                    </div>
                  ))}
                </div>
              ))}
            </div>
          </div>
          <div className="w-full md:w-1/2 p-4 flex justify-center items-center">
            <div className="rounded-lg overflow-hidden w-3/4">
              <Image
                src={customarea?.[1]?.file?.url
                  ? `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${customarea[1].file.url}`
                  : '/walle.jpg'}
                alt="Innovative Research"
                layout="responsive"
                width={300}
                height={300}
                objectFit="cover"
                className="h-auto"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CustomSection;
