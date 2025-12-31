(define (problem reserves-hotel-ext3-auto-5)
  (:domain reserves-hotel-ext3)

  (:objects
    h1 h2 h3 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 4)
    (= (capacitat h3) 1)

    (= (persones r1) 1)
    (= (persones r2) 4)
    (= (persones r3) 4)
    (= (persones r4) 3)
    (= (persones r5) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d10)
    (dia-reserva r1 d11)
    (dia-reserva r1 d12)
    (dia-reserva r1 d13)
    (dia-reserva r1 d14)
    (dia-reserva r2 d2)
    (dia-reserva r2 d3)
    (dia-reserva r2 d4)
    (dia-reserva r3 d13)
    (dia-reserva r3 d14)
    (dia-reserva r3 d15)
    (dia-reserva r3 d16)
    (dia-reserva r4 d2)
    (dia-reserva r4 d3)
    (dia-reserva r4 d4)
    (dia-reserva r4 d5)
    (dia-reserva r4 d6)
    (dia-reserva r5 d19)
    (dia-reserva r5 d20)
    (dia-reserva r5 d21)
    (dia-reserva r5 d22)
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
