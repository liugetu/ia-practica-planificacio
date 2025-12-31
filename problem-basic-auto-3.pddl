(define (problem reserves-hotel-basic-auto-3)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacitat h1) 4)
    (= (capacitat h2) 1)

    (= (persones r1) 3)
    (= (persones r2) 3)
    (= (persones r3) 1)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d5)
    (dia-reserva r1 d6)
    (dia-reserva r1 d7)
    (dia-reserva r1 d8)
    (dia-reserva r2 d1)
    (dia-reserva r3 d14)
  )

  (:goal
    (and
      (servida r1)
      (servida r2)
      (servida r3)
    )
  )
)
