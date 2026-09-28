#import "@preview/touying:0.8.0": *

#let vinyl-theme(
  aspect-ratio: "16-9",
  body,
) = {
  show: touying-slides.with(
    aspect-ratio: aspect-ratio,
    // Custom slide layouts can be declared here
  )

  // 2. Define custom styling rules
  // set text(font: "Liberation Sans", size: 20pt)

  body
}

