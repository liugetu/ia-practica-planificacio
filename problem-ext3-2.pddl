(define (problem reserves-hotel-ext3-2)
  (:domain reserves-hotel-ext3)

  (:objects
    h2 h3 h4 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 d4 d5 d6 d7 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h2) 2)
    (= (capacitat h3) 3)
    (= (capacitat h4) 4)

    (= (persones r1) 1)
    (= (persones r2) 2)
    (= (persones r3) 3)

    ;; Tres reserves consecutives (no se solapen) per provar el minimitzat de desperdici.
    ;; r1: [d1,d3)
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)
    ;; r2: [d3,d5)
    (dia-reserva r2 d3)
    (dia-reserva r2 d4)
    ;; r3: [d5,d7)
    (dia-reserva r3 d5)
    (dia-reserva r3 d6)
  )

  (:goal
    (and
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
    )
  )

  (:metric minimize (total-cost))
)
