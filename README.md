# Purdue Vinyl Club slides typst theme

A template using [typst](https://typst.app) and [Touying](https://touying-typ.github.io/), for the [Purdue Vinyl Club](https://discord.gg/8qp5fX4hsv).

## Example
```typst
#import "@preview/touying:0.8.0": *
#import "pvc_template.typ": *
#show: vinyl-theme.with(
  config-info(
    title: [Your Title],
    date: [[Current Date]],
  ),
)

#title-slide()

== Example Slide Header
Example text content.

#pause

More example text content on click. 

#emphasis-slide[Emphasis goes here.]
```

Other examples can be found in [gallery/](gallery/).

## Exports

### Slide Types
| Name | Use |
|---|---|
| `#slide()` | Normal text content. |
| `#emphasis-slide()` | Slide to emphasize content, or use as a larger section heading. |
| `#title-slide()` | Title slide: slideshow title, date, and the PVC logo. |
| `#releases-slide()` | Shows new releases for the week in PVC format. 3 Main albums (with genre info and covers), and a large list of other releases. |


### Others
`#boxed()` - Panel for side content in a normal/text slide.
