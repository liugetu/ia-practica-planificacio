(define (problem reserves-hotel-basic-2-impossible)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 - habitacio
    r1 r2 r3 - reserva
    d1 d2 d3 - dia
  )

  (:init
    (= (capacitat h1) 2)
    (= (capacitat h2) 2)

    (= (persones r1) 2)
    (= (persones r2) 2)
    (= (persones r3) 2)

    ;; Totes tres reserves se solapen (mateixos dies)
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
