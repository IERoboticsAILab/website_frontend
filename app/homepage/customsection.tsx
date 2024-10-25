import Image from "next/image";


interface CustomSectionProps {
  customarea: Array<{
    __component: "shared.json-rich-text" | "shared.media";
    id: number;
    text?: Array<{
      type: "heading" | "paragraph";
      children: Array<{
        type: "text";
        text: string;
      }>;
      level?: number;
    }>;
  }>;
}

function CustomSection({ customarea }: CustomSectionProps) {
  return (
    <div className="w-full bg-gray-100 py-16">
      <div className="container mx-auto">
        <div className="flex flex-col md:flex-row items-center mb-16">
          <div className="w-full md:w-1/2 p-8">
            <p className="text-xl mb-4 text-gray-700 leading-relaxed">
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
            <div className="rounded-lg overflow-hidden shadow-xl">
              <Image src="/labimage1.png" alt="Innovative Research" layout="responsive" width={600} height={400} objectFit="cover" />
            </div>
          </div>
        </div>
        <div className="flex flex-col md:flex-row-reverse items-center">
          <div className="w-full md:w-1/2 p-8">
            <p className="text-xl mb-4 text-gray-700 leading-relaxed">
            {customarea?.[2]?.text?.map((textItem, i) => (
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
            <div className="rounded-lg overflow-hidden shadow-xl">
              <Image src="/labimage2.png" alt="Collaborative Environment" layout="responsive" width={600} height={400} objectFit="cover" />
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default CustomSection;