import Navbar from "@/components/navbar";
import Footer from "@/components/footer";

export default function Contact() {
  return (
    <div>
      <Navbar />
      <main className="container mx-auto px-4 py-8">
        <h1 className="text-4xl font-bold mb-8">Contact Information & Applications</h1>

        <section className="mb-8">
          <h2 className="text-2xl font-semibold mb-4">Connect with us [ICON-LINKS]</h2>
          <p className="text-lg mb-4">
            Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable
            text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text
            Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable
            text Customizable text Customizable text Customizable text Customizable text
          </p>
        </section>

        <div className="flex flex-col md:flex-row gap-8">
          <div className="md:w-1/2">
            <h2 className="text-2xl font-semibold mb-4">Physical location</h2>
            <p>address</p>
            <p>address</p>
            <p className="mb-4">information information</p>
            <h3 className="text-xl font-semibold">Mailing address</h3>
          </div>
          <div className="md:w-1/2 bg-gray-200 p-4">
            <p className="text-center">Google maps insert</p>
          </div>
        </div>

        <section className="mt-12">
          <h2 className="text-3xl font-bold mb-6">Open positions and more</h2>
          <p className="text-lg mb-8">
            Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable
            text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text
            Customizable text Customizable text Customizable text Customizable text Customizable text Customizable text Customizable
            text Customizable text Customizable text Customizable text Customizable text
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {['Name of open position', 'Lab assistant', 'Bachelor capstone project', 'Visiting PhD researcher'].map((position, index) => (
              <div key={index} className="bg-gray-200 p-6 rounded-lg">
                <h3 className="text-xl font-semibold mb-4">{position}</h3>
                <p className="mb-4">
                  Customizable text Customizable text Customizable text Customizable text
                  Customizable text Customizable text
                </p>
                <div>
                  <a href="#" className="text-blue-600 hover:underline block">
                    [potential link to download pdf]
                  </a>
                  <a href="#" className="text-blue-600 hover:underline block">
                    [potential email]
                  </a>
                </div>
              </div>
            ))}
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
}
