(define (problem reserves-hotel-basic-auto-7)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 r6 r7 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacitat h1) 4)
    (= (capacitat h2) 3)
    (= (capacitat h3) 2)
    (= (capacitat h4) 4)

    (= (persones r1) 4)
    (= (persones r2) 2)
    (= (persones r3) 1)
    (= (persones r4) 1)
    (= (persones r5) 4)
    (= (persones r6) 4)
    (= (persones r7) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d11)
    (dia-reserva r1 d12)
    (dia-reserva r1 d13)
    (dia-reserva r2 d20)
    (dia-reserva r2 d21)
    (dia-reserva r2 d22)
    (dia-reserva r3 d26)
    (dia-reserva r4 d19)
    (dia-reserva r4 d20)
    (dia-reserva r5 d24)
    (dia-reserva r5 d25)
    (dia-reserva r5 d26)
    (dia-reserva r6 d24)
    (dia-reserva r6 d25)
    (dia-reserva r6 d26)
    (dia-reserva r6 d27)
    (dia-reserva r6 d28)
    (dia-reserva r7 d29)
  )

  (:goal
    (and
      (servida r1)
      (servida r2)
      (servida r3)
      (servida r4)
      (servida r5)
      (servida r6)
      (servida r7)
    )
  )
)
