#import "pvc_template.typ": releases-slide, vinyl-theme
#show: vinyl-theme.with(aspect-ratio: "16-9")

== Slide Title
Custom styled presentation content.


#releases-slide(
  next-theme: [Themed Albums],
  featured: (
    (artist: [Artist Name], album: [Album Name], genres: [Genre, Genre]),
  )
    * 3,
  releases: (
    ("Artist", "Album"),
    ("Artist", "Album"),
    ("Artist", "Album"),
    ("Artist", "Album"),
    ("Artist", "EP", "EP"),
    ("Artist", "Song", "Single"),
    ("Artist", "Song", "Single"),
  ),
)
