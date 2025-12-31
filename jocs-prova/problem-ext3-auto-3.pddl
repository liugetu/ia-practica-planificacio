(define (problem reserves-hotel-ext3-auto-3)
  (:domain reserves-hotel-ext3)

  (:objects
    h1 h2 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 4)

    (= (persones r1) 2)
    (= (persones r2) 1)
    (= (persones r3) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d15)
    (dia-reserva r1 d16)
    (dia-reserva r1 d17)
    (dia-reserva r2 d13)
    (dia-reserva r2 d14)
    (dia-reserva r2 d15)
    (dia-reserva r2 d16)
    (dia-reserva r2 d17)
    (dia-reserva r3 d4)
  )

  (:goal
    (and
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
    )
  )

  (:metric minimize (total-cost))
)
