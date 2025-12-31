(define (problem reserves-hotel-ext1-test)
  (:domain reserves-hotel-ext1)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 - dia
  )

  (:init
    (= (total-cost) 0)

    ;; Habitaciones con diferentes capacidades
    (= (capacitat h1) 2)
    (= (capacitat h2) 3)
    (= (capacitat h3) 4)
    (= (capacitat h4) 2)

    ;; Reservas con diferentes necesidades de personas
    (= (persones r1) 2)
    (= (persones r2) 3)
    (= (persones r3) 2)
    ;; r4 es IMPOSIBLE: no hi ha cap habitacio amb capacitat >= 5.
    ;; En un plan òptim (minimitzant total-cost) r4 s'ha de rebutjar.
    (= (persones r4) 5)
    (= (persones r5) 2)

    ;; Configuración de días de reserva
    ;; Disseny del test:
    ;; - r1, r3, r5 se solapen (força a respectar ocupacions), però hi ha prou habitacions.
    ;; - r2 NO se solapa amb les altres (evitem bloquejos heurístics per eleccions dolentes).
    ;; - r4 és impossible per capacitat i s'ha de rebutjar.

    ;; r1: dies 1-2 (2 persones)
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    ;; r2: dies 4-5 (3 persones) - no se solapa amb r1/r3/r5
    (dia-reserva r2 d4)
    (dia-reserva r2 d5)

    ;; r3: dies 1-3 (2 persones) - se solapa amb r1 i r5
    (dia-reserva r3 d1)
    (dia-reserva r3 d2)
    (dia-reserva r3 d3)

    ;; r4: dies 2-4 (5 persones) - impossible per capacitat
    (dia-reserva r4 d2)
    (dia-reserva r4 d3)
    (dia-reserva r4 d4)

    ;; r5: dies 1-2 (2 persones) - se solapa amb r1 i r3
    (dia-reserva r5 d1)
    (dia-reserva r5 d2)
  )

  (:goal
    (and
      ;; Ahora permitimos rechazar reservas
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
      (or (servida r4) (rebutjada r4))
      (or (servida r5) (rebutjada r5))
    )
  )

  (:metric minimize (total-cost))
)
