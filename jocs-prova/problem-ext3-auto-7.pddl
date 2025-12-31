(define (problem reserves-hotel-ext3-auto-7)
  (:domain reserves-hotel-ext3)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 r6 r7 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 4)
    (= (capacitat h3) 3)
    (= (capacitat h4) 1)

    (= (persones r1) 4)
    (= (persones r2) 3)
    (= (persones r3) 3)
    (= (persones r4) 4)
    (= (persones r5) 4)
    (= (persones r6) 1)
    (= (persones r7) 3)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d10)
    (dia-reserva r1 d11)
    (dia-reserva r1 d12)
    (dia-reserva r1 d13)
    (dia-reserva r2 d10)
    (dia-reserva r2 d11)
    (dia-reserva r3 d30)
    (dia-reserva r4 d12)
    (dia-reserva r4 d13)
    (dia-reserva r4 d14)
    (dia-reserva r5 d7)
    (dia-reserva r5 d8)
    (dia-reserva r5 d9)
    (dia-reserva r5 d10)
    (dia-reserva r5 d11)
    (dia-reserva r6 d11)
    (dia-reserva r6 d12)
    (dia-reserva r6 d13)
    (dia-reserva r7 d9)
    (dia-reserva r7 d10)
    (dia-reserva r7 d11)
    (dia-reserva r7 d12)
  )

  (:goal
    (and
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
      (or (servida r4) (rebutjada r4))
      (or (servida r5) (rebutjada r5))
      (or (servida r6) (rebutjada r6))
      (or (servida r7) (rebutjada r7))
    )
  )

  (:metric minimize (total-cost))
)
