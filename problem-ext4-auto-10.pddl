(define (problem reserves-hotel-ext4-auto-10)
  (:domain reserves-hotel-ext4)

  (:objects
    h1 h2 h3 h4 h5 - habitacio
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 1)
    (= (capacitat h3) 2)
    (= (capacitat h4) 1)
    (= (capacitat h5) 2)

    (= (persones r1) 3)
    (= (persones r2) 4)
    (= (persones r3) 2)
    (= (persones r4) 1)
    (= (persones r5) 1)
    (= (persones r6) 3)
    (= (persones r7) 3)
    (= (persones r8) 4)
    (= (persones r9) 1)
    (= (persones r10) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d22)
    (dia-reserva r1 d23)
    (dia-reserva r1 d24)
    (dia-reserva r1 d25)
    (dia-reserva r2 d24)
    (dia-reserva r2 d25)
    (dia-reserva r2 d26)
    (dia-reserva r3 d14)
    (dia-reserva r4 d3)
    (dia-reserva r5 d27)
    (dia-reserva r5 d28)
    (dia-reserva r5 d29)
    (dia-reserva r5 d30)
    (dia-reserva r6 d28)
    (dia-reserva r6 d29)
    (dia-reserva r7 d25)
    (dia-reserva r7 d26)
    (dia-reserva r7 d27)
    (dia-reserva r7 d28)
    (dia-reserva r7 d29)
    (dia-reserva r8 d4)
    (dia-reserva r8 d5)
    (dia-reserva r8 d6)
    (dia-reserva r9 d29)
    (dia-reserva r9 d30)
    (dia-reserva r10 d27)
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
    )
  )

  (:metric minimize (total-cost))
)
