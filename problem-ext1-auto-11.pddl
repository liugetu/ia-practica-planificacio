(define (problem reserves-hotel-ext1-auto-11)
  (:domain reserves-hotel-ext1)

  (:objects
    h1 h2 h3 h4 h5 h6 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 3)
    (= (capacitat h3) 4)
    (= (capacitat h4) 4)
    (= (capacitat h5) 1)
    (= (capacitat h6) 4)

    (= (persones r1) 1)
    (= (persones r2) 3)
    (= (persones r3) 1)
    (= (persones r4) 2)
    (= (persones r5) 1)
    (= (persones r6) 2)
    (= (persones r7) 1)
    (= (persones r8) 1)
    (= (persones r9) 4)
    (= (persones r10) 1)
    (= (persones r11) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d5)
    (dia-reserva r2 d9)
    (dia-reserva r2 d10)
    (dia-reserva r3 d16)
    (dia-reserva r4 d20)
    (dia-reserva r5 d13)
    (dia-reserva r6 d19)
    (dia-reserva r6 d20)
    (dia-reserva r7 d16)
    (dia-reserva r7 d17)
    (dia-reserva r7 d18)
    (dia-reserva r7 d19)
    (dia-reserva r7 d20)
    (dia-reserva r8 d28)
    (dia-reserva r9 d30)
    (dia-reserva r10 d1)
    (dia-reserva r10 d2)
    (dia-reserva r10 d3)
    (dia-reserva r11 d17)
    (dia-reserva r11 d18)
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
      (or (servida r10) (rebutjada r10))
      (or (servida r11) (rebutjada r11))
    )
  )

  (:metric minimize (total-cost))
)
