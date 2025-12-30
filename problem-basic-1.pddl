(define (problem reserves-hotel-basic-1)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 - dia
  )

  (:init
    (= (capacitat h1) 1)
    (= (capacitat h2) 2)
    (= (capacitat h3) 4)

    (= (persones r1) 1)
    (= (persones r2) 2)
    (= (persones r3) 4)

    ;; Cada reserva ocupa els dies indicats.
    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    (dia-reserva r2 d1)
    (dia-reserva r2 d2)

    (dia-reserva r3 d1)
    (dia-reserva r3 d2)
  )

  (:goal
    (and
      (servida r1)
      (servida r2)
      (servida r3)
    )
  )
)
