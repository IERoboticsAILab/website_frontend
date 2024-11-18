import Image from "next/image";
import { Landing } from "@/types/landing";

interface CustomSectionProps {
  customarea: Landing['data']['customarea'];
}

function CustomSection({ customarea }: CustomSectionProps) {
return (
    <div className="w-full bg-[#241f21] py-16">
      <div className="container mx-4">
        <div className="flex flex-col md:flex-row items-center mb-16">
          <div className="w-full md:w-1/2 p-8">
            <p className="text-xl mb-4 text-gray-700 leading-relaxed text-white">
            {customarea?.[0]?.text?.map((textItem, i) => (
                textItem.children?.map((child, j) => (
                  textItem.type === "paragraph" ? (
                    <p key={`${i}-${j}`}>{child.text}</p>
                  ) : textItem.type === "heading" ? (
                    <h2 key={`${i}-${j}`} className="text-2xl font-semibold mb-4">{child.text}</h2>
                  ) : null
                ))
              ))}
            </p>
          </div>
          <div className="w-full md:w-1/2 p-4">
            <div className="rounded-lg overflow-hidden">
              <Image
                src={customarea?.[1]?.file?.url
                  ? `${process.env.NEXT_PUBLIC_STRAPI_API_URL_IMG}${customarea[1].file.url}`
                  : '/walle.jpg'}
                alt="Innovative Research"
                layout="responsive"
                width={300}
                height={500}
                objectFit="cover"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
)
}

export default CustomSection;
