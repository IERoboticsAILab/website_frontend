export default function Intro() {
  return (
    <div className="flex flex-row justify-center m-10">
      <div className="flex flex-col mx-5 max-w-[40%]">
      <h1 className="text-4xl font-bold">Welcome to CyPhyLab</h1>
      <p className="text-lg mt-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

      </div>
      <div>
      <iframe width="500" height="315" src="https://www.youtube.com/embed/Jjql2hBR7Dw" title="Dogs playing outside. GUARANTEED to make you smile. Most watched video. top. let your dog listen" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"></iframe>
      <p className="text-center italic text-sm text-gray-600 mt-2">This is a caption for the video</p>
      </div>
    </div>
  );
};

