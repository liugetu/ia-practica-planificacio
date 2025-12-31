(define (problem reserves-hotel-ext4-auto-5)
  (:domain reserves-hotel-ext4)

  (:objects
    h1 h2 h3 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 3)
    (= (capacitat h3) 4)

    (= (persones r1) 3)
    (= (persones r2) 1)
    (= (persones r3) 2)
    (= (persones r4) 1)
    (= (persones r5) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d29)
    (dia-reserva r1 d30)
    (dia-reserva r2 d21)
    (dia-reserva r3 d3)
    (dia-reserva r3 d4)
    (dia-reserva r4 d15)
    (dia-reserva r5 d20)
    (dia-reserva r5 d21)
    (dia-reserva r5 d22)
    (dia-reserva r5 d23)
  )

  (:goal
    (and
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
      (or (servida r4) (rebutjada r4))
      (or (servida r5) (rebutjada r5))
    )
  )

  (:metric minimize (total-cost))
)
