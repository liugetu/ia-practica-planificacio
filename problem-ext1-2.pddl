(define (problem reserves-hotel-ext1-2)
  (:domain reserves-hotel-ext1)

  (:objects
    h1 h2 - habitacio
    r1 r2 - reserva
    d1 d2 d3 - dia
  )

  (:init
    (= (total-cost) 0)

    (= (capacitat h1) 4)
    (= (capacitat h2) 2)

    (= (persones r1) 3)
    (= (persones r2) 3)

    ;; Les dues reserves se solapen i nomes una habitacio te capacitat >= 3.
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    (dia-reserva r2 d1)
    (dia-reserva r2 d2)
  )

  (:goal
    (and
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
    )
  )

  (:metric minimize (total-cost))
)
