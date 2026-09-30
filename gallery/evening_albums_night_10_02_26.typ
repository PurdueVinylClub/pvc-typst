#import "/pvc_template.typ": *
#show: vinyl-theme.with(
  config-info(
    title: [Evening Albums],
    date: [[Friday 10/02]],
  ),
)

#title-slide()

== Announcements
#v(1em)
- #underline[Music League!!!! (Round 1 due Sunday 11:30 PM)]

#v(3em)

- #underline[Soulseek 101, next meeting!]

#v(3em)

- #underline[Lafayette Crate Digging - THIS SUNDAY]

== Lafayette Crate Digging

#grid(columns: (1.3fr, 1fr))[
  - #underline[Sunday, October 4th]
    - 11 am - 5 pm
    - Meet at Stewart Center Lobby
  - #underline[Record Stores]
    - Von's Shops (Downtown WL)
    - Black Wax Records (Lafayette)
    - JL Records (Wabash Landing)
][
  #boxed[
    11:00 AM: #underline[Meet \@ Stewart Center]

    11:15 AM: #underline[Depart for Von’s]

    11:30 AM - 12:30 PM: #underline[Von’s]

    12:45 PM - 1:45 PM: #underline[Lunch]

    1:50 PM - 2:20 PM: #underline[Walk to Black Wax]

    2:20 PM - 3:20 PM: #underline[Black Wax]

    3:35 PM - 4:00 PM: #underline[Walk to JL Records]

    4:00 PM - 5:00 PM: #underline[JL Records]
  ]
]

== Meeting Spot - Steward Center

#grid(columns: (1fr, 1fr), gutter: 1em)[
  #box(stroke: orange + 8pt)[
    #image("evening_albums_night_10_02_26/evening_1.jpeg")
  ]
][
  #box(stroke: orange + 8pt)[
    #image("evening_albums_night_10_02_26/evening_2.jpeg")
  ]
]

#releases-slide(
  next-theme: [Chill 🥶 Meeting],
  featured: (
    (
      artist: [Swans],
      album: [Newly Sentient Being (Live)],
      genres: [Post-Rock, Noise Rock],
      cover: image("evening_albums_night_10_02_26/swans.webp"),
    ),
    (
      artist: [Quadeca],
      album: [Life 1],
      genres: [Indietronica, Art Pop],
      cover: image("evening_albums_night_10_02_26/quadeca.webp"),
    ),
    (
      artist: [Dev Lemons],
      album: [Hunting What We Already Killed],
      genres: [Indie Rock, Neo-Psychedelia],
      cover: image("evening_albums_night_10_02_26/devlemon.webp"),
      border: white,
    ),
  ),
  releases: (
    ("The Beatles", "Rubber Soul"),
    ("Greg Freeman", "All Set the Bone"),
    ("B0YG1RL", "B0YG1RL"),
    ("Quavo", "Qrömelife"),
    ("Current 93", "Hallucinate, Children"),
    ("Fat Dog", "Cancel Me (I'm Tired)"),
    ("jackzebra", "Zhuang Zhuang Mixtape"),
    ("Stevie Wonder", "Songs in the Key of Life: The EP"),
    ("ML Buch", "Suntub Extras", "EP"),
  ),
)
