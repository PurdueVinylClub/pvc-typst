#import "@preview/touying:0.8.0": config-info
#import "/pvc_template.typ": boxed, emphasis-slide, title-slide, vinyl-theme
#show: vinyl-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Calculus HW],
    date: [[Sunday 10/04]],
  ),
)

#title-slide()

#emphasis-slide[#underline[Problem 1]: \ Which of the following functions $f: RR->RR$ have a critical point at $x = 1$?]

== (a) $f(x) = x^3 - 3x + 1$
By the power rule,
$
  f'(x) & = 3x^2 - 3
$

So
$
  f'(1) = 3(1)^2 - 3 = 0
$

$f'(1) = 0$, so $x = 1$ is a critical point.

== (b) $f(x) = x e^x$

By the product rule,
$
  f'(x) & = (x)' e^x + x (e^x)' \
        & = e^x + x e^x \
        & = (1 + x) e^x
$

So
$
  f'(1) = (1 + 1) e^1 = 2e
$

$f'(1) != 0$, so $x = 1$ is not a critical point.

== (c) $f(x) = (x^2 - 2x)^3$

By the chain rule,
$
  f'(x) & = 3(x^2 - 2x)^2 dot (x^2 - 2x)' \
        & = 3(x^2 - 2x)^2 (2x - 2)
$

So
$
  f'(1) = 3(1 - 2)^2 (2 - 2) = 3 dot 1 dot 0 = 0
$

$f'(1) = 0$, so $x = 1$ is a critical point.

#emphasis-slide[Only (a) and (c) have a critical point at $x = 1$]
