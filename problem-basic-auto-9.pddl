(define (problem reserves-hotel-basic-auto-9)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 h4 h5 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacitat h1) 4)
    (= (capacitat h2) 1)
    (= (capacitat h3) 2)
    (= (capacitat h4) 2)
    (= (capacitat h5) 3)

    (= (persones r1) 2)
    (= (persones r2) 3)
    (= (persones r3) 3)
    (= (persones r4) 1)
    (= (persones r5) 1)
    (= (persones r6) 2)
    (= (persones r7) 2)
    (= (persones r8) 3)
    (= (persones r9) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d11)
    (dia-reserva r1 d12)
    (dia-reserva r1 d13)
    (dia-reserva r1 d14)
    (dia-reserva r1 d15)
    (dia-reserva r2 d28)
    (dia-reserva r2 d29)
    (dia-reserva r2 d30)
    (dia-reserva r3 d8)
    (dia-reserva r3 d9)
    (dia-reserva r3 d10)
    (dia-reserva r3 d11)
    (dia-reserva r3 d12)
    (dia-reserva r4 d20)
    (dia-reserva r4 d21)
    (dia-reserva r4 d22)
    (dia-reserva r5 d6)
    (dia-reserva r6 d27)
    (dia-reserva r6 d28)
    (dia-reserva r6 d29)
    (dia-reserva r6 d30)
    (dia-reserva r7 d7)
    (dia-reserva r7 d8)
    (dia-reserva r8 d9)
    (dia-reserva r8 d10)
    (dia-reserva r9 d24)
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
    )
  )
)
