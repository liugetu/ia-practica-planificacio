(define (problem reserves-hotel-basic-auto-11)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 h4 h5 h6 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacitat h1) 4)
    (= (capacitat h2) 2)
    (= (capacitat h3) 4)
    (= (capacitat h4) 1)
    (= (capacitat h5) 4)
    (= (capacitat h6) 1)

    (= (persones r1) 4)
    (= (persones r2) 4)
    (= (persones r3) 4)
    (= (persones r4) 1)
    (= (persones r5) 1)
    (= (persones r6) 1)
    (= (persones r7) 1)
    (= (persones r8) 2)
    (= (persones r9) 1)
    (= (persones r10) 2)
    (= (persones r11) 2)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d28)
    (dia-reserva r2 d23)
    (dia-reserva r2 d24)
    (dia-reserva r2 d25)
    (dia-reserva r3 d17)
    (dia-reserva r3 d18)
    (dia-reserva r4 d27)
    (dia-reserva r4 d28)
    (dia-reserva r5 d9)
    (dia-reserva r5 d10)
    (dia-reserva r5 d11)
    (dia-reserva r5 d12)
    (dia-reserva r6 d19)
    (dia-reserva r6 d20)
    (dia-reserva r6 d21)
    (dia-reserva r7 d18)
    (dia-reserva r7 d19)
    (dia-reserva r7 d20)
    (dia-reserva r7 d21)
    (dia-reserva r8 d3)
    (dia-reserva r9 d3)
    (dia-reserva r10 d18)
    (dia-reserva r10 d19)
    (dia-reserva r10 d20)
    (dia-reserva r11 d23)
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
      (servida r8)
      (servida r9)
      (servida r10)
      (servida r11)
    )
  )
)
