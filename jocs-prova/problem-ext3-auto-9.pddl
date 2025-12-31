(define (problem reserves-hotel-ext3-auto-9)
  (:domain reserves-hotel-ext3)

  (:objects
    h1 h2 h3 h4 h5 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 1)
    (= (capacitat h3) 3)
    (= (capacitat h4) 1)
    (= (capacitat h5) 2)

    (= (persones r1) 2)
    (= (persones r2) 4)
    (= (persones r3) 1)
    (= (persones r4) 3)
    (= (persones r5) 1)
    (= (persones r6) 3)
    (= (persones r7) 2)
    (= (persones r8) 1)
    (= (persones r9) 1)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d27)
    (dia-reserva r1 d28)
    (dia-reserva r1 d29)
    (dia-reserva r1 d30)
    (dia-reserva r2 d28)
    (dia-reserva r2 d29)
    (dia-reserva r2 d30)
    (dia-reserva r3 d2)
    (dia-reserva r3 d3)
    (dia-reserva r3 d4)
    (dia-reserva r3 d5)
    (dia-reserva r4 d9)
    (dia-reserva r4 d10)
    (dia-reserva r4 d11)
    (dia-reserva r5 d30)
    (dia-reserva r6 d29)
    (dia-reserva r6 d30)
    (dia-reserva r7 d23)
    (dia-reserva r7 d24)
    (dia-reserva r7 d25)
    (dia-reserva r8 d16)
    (dia-reserva r8 d17)
    (dia-reserva r8 d18)
    (dia-reserva r9 d3)
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
      (or (servida r8) (rebutjada r8))
      (or (servida r9) (rebutjada r9))
    )
  )

  (:metric minimize (total-cost))
)
