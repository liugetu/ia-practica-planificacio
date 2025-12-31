(define (problem reserves-hotel-ext1-auto-9)
  (:domain reserves-hotel-ext1)

  (:objects
    h1 h2 h3 h4 h5 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 1)
    (= (capacitat h3) 4)
    (= (capacitat h4) 3)
    (= (capacitat h5) 2)

    (= (persones r1) 4)
    (= (persones r2) 3)
    (= (persones r3) 1)
    (= (persones r4) 4)
    (= (persones r5) 1)
    (= (persones r6) 3)
    (= (persones r7) 1)
    (= (persones r8) 4)
    (= (persones r9) 1)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d2)
    (dia-reserva r1 d3)
    (dia-reserva r1 d4)
    (dia-reserva r1 d5)
    (dia-reserva r2 d5)
    (dia-reserva r2 d6)
    (dia-reserva r2 d7)
    (dia-reserva r2 d8)
    (dia-reserva r3 d2)
    (dia-reserva r3 d3)
    (dia-reserva r4 d8)
    (dia-reserva r5 d24)
    (dia-reserva r5 d25)
    (dia-reserva r6 d12)
    (dia-reserva r7 d9)
    (dia-reserva r7 d10)
    (dia-reserva r7 d11)
    (dia-reserva r8 d29)
    (dia-reserva r9 d9)
    (dia-reserva r9 d10)
    (dia-reserva r9 d11)
    (dia-reserva r9 d12)
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
