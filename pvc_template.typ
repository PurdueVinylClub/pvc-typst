#import "@preview/touying:0.8.0": *

#let maroon = rgb("#2D0A0E")
#let tan = rgb("#DFB75F")
#let orange = rgb("#E36E21")
#let offwhite = rgb("#F5F0EA")

// Background band proportions, from the source images.
#let text-header-height = 135 / 540 * 100%
#let title-dark-left = 400 / 960 * 100%
#let title-dark-bottom = 355 / 540 * 100%

// Hi-res logo drawn over the background's copy.
// Slightly oversized to cover the original's blurred edge.
#let logo = context {
  let d = 384 / 960 * page.width
  place(
    top + left,
    dx: 217 / 960 * page.width - d / 2,
    dy: 246.5 / 540 * page.height - d / 2,
    image("pvc_logo.png", width: d),
  )
}

/// Default text slide: tan title band above maroon body.
#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let header(self) = block(
    width: 100%,
    height: 100%,
    inset: (x: 2.5em),
    align(horizon, text(
      fill: self.colors.primary,
      size: 2em,
      weight: "bold",
      utils.display-current-heading(level: 2),
    )),
  )
  let self = utils.merge-dicts(
    self,
    config-page(
      background: image("text_slide_bg.png"),
      header: header,
      margin: (top: text-header-height + 1.5em, left: 2.5em, right: 1.5em, bottom: 1.5em),
      header-ascent: 1em,
    ),
  )
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: setting,
    composer: composer,
    ..bodies,
  )
})

/// Orange-bordered panel,
/// usually for text content on the side of the slide.
#let boxed(body) = block(
  width: 100%,
  stroke: 2pt + orange,
  inset: (x: 0.6em, y: 0.8em),
  {
    set text(size: 0.8em)
    set par(spacing: 1.3em)
    body
  },
)

/// Full-maroon slide with a tan border and big centered bold tan text.
///
/// Example: `#emphasis-slide[Don't do this.]`
#let emphasis-slide(config: (:), body) = touying-slide-wrapper(self => {
  let border = context {
    let w = 6 / 960 * page.width
    place(top + left, dx: w / 2, dy: w / 2, rect(
      width: 100% - w,
      height: 100% - w,
      stroke: w + tan,
    ))
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: self.colors.primary, background: border, margin: 2em),
    config,
  )
  touying-slide(self: self, align(center + horizon, text(
    size: 2.4em,
    weight: "bold",
    fill: tan,
    body,
  )))
})

#let list-depth = state("list-depth", 0)

/// Title slide. An optional body (e.g. a photo)
/// is scaled to fit the maroon area right of the logo
/// and outlined in orange.
///
/// Example: `#title-slide(subtitle: [Something else])[#image("photo.jpg")]`
#let title-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      background: image("title_slide_bg.png"),
      margin: 0em,
    ),
    config,
  )
  let info = self.info + args.named()
  let extra = args.pos().sum(default: none)
  let label(size, body) = box(
    fill: self.colors.neutral-lightest,
    outset: (x: 0.25em, y: 0.22em),
    text(size: size, fill: self.colors.primary, body),
  )
  // Title block centered on the tan bottom shape.
  let body = (
    logo
      + place(
        top + left,
        dx: title-dark-left,
        block(
          width: 100% - title-dark-left,
          height: title-dark-bottom,
          inset: (x: 2em, y: 1.5em),
          align(center + horizon, if extra != none {
            layout(size => {
              let n = measure(extra)
              let r = calc.min(size.width / n.width, size.height / n.height)
              box(stroke: 5pt + orange, scale(r * 100%, reflow: true, extra))
            })
          }),
        ),
      )
      + place(
        top + left,
        dx: title-dark-left,
        dy: title-dark-bottom,
        block(
          width: 100% - title-dark-left,
          height: 100% - title-dark-bottom,
          align(center + horizon, {
            set par(spacing: 1em)
            label(2.4em, info.title)
            let date = if info.date != none { utils.display-info-date(self) }
            let byline = (info.author, date).filter(x => x != none)
            for line in (info.subtitle, byline.join[ · ]) {
              if line != none {
                parbreak()
                label(1.2em, line)
              }
            }
          }),
        ),
      )
  )
  touying-slide(self: self, body)
})

#let vinyl-theme(
  aspect-ratio: "16-9",
  ..args,
  body,
) = {
  show: touying-slides.with(
    config-page(..utils.page-args-from-aspect-ratio(aspect-ratio)),
    config-common(slide-fn: slide, show-strong-with-alert: false),
    config-colors(
      primary: maroon,
      secondary: tan,
      tertiary: orange,
      neutral-lightest: offwhite,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(font: ("Merriweather", "Zapf Dingbats"), size: 20pt, fill: self.colors.neutral-lightest)
        show link: set text(fill: self.colors.secondary)
        show link: underline
        set par(spacing: 1em)
        set underline(offset: 0.15em, stroke: 0.06em)
        set list(
          marker: ([❖], [➢], [➢]),
          indent: 0em,
          body-indent: 0.7em,
          spacing: 1.2em,
        )
        set enum(
          numbering: n => text(number-width: "tabular")[#n.],
          indent: 0em,
          body-indent: 0.7em,
          spacing: 1.2em,
        )
        let lists = selector.or(list, enum)
        // Top-level items act as section headings
        show lists: it => {
          list-depth.update(d => d + 1)
          context {
            let depth = list-depth.get()
            if depth == 1 {
              set text(size: 1.3em)
              set list(spacing: 0.9em)
              set enum(spacing: 0.9em)
              it
            } else if depth == 2 {
              set text(size: 1em / 1.3)
              it
            } else if depth == 3 {
              set text(size: 0.9em)
              it
            } else { it }
          }
          list-depth.update(d => d - 1)
        }
        body
      },
      // for `#alert`s
      alert: utils.alert-with-primary-color,
    ),
    ..args,
  )

  body
}
