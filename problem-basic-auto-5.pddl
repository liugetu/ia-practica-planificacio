(define (problem reserves-hotel-basic-auto-5)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacitat h1) 4)
    (= (capacitat h2) 2)
    (= (capacitat h3) 1)

    (= (persones r1) 1)
    (= (persones r2) 1)
    (= (persones r3) 3)
    (= (persones r4) 4)
    (= (persones r5) 1)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d12)
    (dia-reserva r2 d16)
    (dia-reserva r2 d17)
    (dia-reserva r3 d22)
    (dia-reserva r3 d23)
    (dia-reserva r3 d24)
    (dia-reserva r4 d16)
    (dia-reserva r5 d22)
    (dia-reserva r5 d23)
    (dia-reserva r5 d24)
    (dia-reserva r5 d25)
  )

  (:goal
    (and
      (servida r1)
      (servida r2)
      (servida r3)
      (servida r4)
      (servida r5)
    )
  )
)
