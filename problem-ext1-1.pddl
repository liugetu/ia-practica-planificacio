(define (problem reserves-hotel-ext1-1)
  (:domain reserves-hotel-ext1)

  (:objects
    h1 h2 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 2)
    (= (capacitat h2) 2)

    (= (persones r1) 2)
    (= (persones r2) 2)
    (= (persones r3) 2)

    ;; Totes tres reserves se solapen: nomes se'n podran servir 2.
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    (dia-reserva r2 d1)
    (dia-reserva r2 d2)

    (dia-reserva r3 d1)
    (dia-reserva r3 d2)
  )

  (:goal
    (and
      ;; Cal decidir per a cada reserva: servida o rebutjada
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
    )
  )

  (:metric minimize (total-cost))
)
