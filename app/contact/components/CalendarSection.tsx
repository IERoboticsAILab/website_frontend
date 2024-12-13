'use client';

import Cal from "@calcom/embed-react";

export default function CalendarSection() {
  return (
    <section className="mt-12 bg-white mb-12">
      <h2 className="text-3xl font-bold mb-20">Lab Tours</h2>
      <Cal
        calLink="team/ie-robotics-lab-tour-guides/lab-tour"
        config={{ theme: "light" }}
        style={{ transform: "scale(1.2)", marginTop: "2rem" }}
      />
    </section>
  );
}
