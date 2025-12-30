(define (problem reserves-hotel-basic-test)
  (:domain reserves-hotel-basic)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 - dia
  )

  (:init
    ;; Habitaciones con diferentes capacidades
    (= (capacitat h1) 2)
    (= (capacitat h2) 3)
    (= (capacitat h3) 4)
    (= (capacitat h4) 2)

    ;; Reservas con diferentes necesidades de personas
    (= (persones r1) 2)
    (= (persones r2) 3)
    (= (persones r3) 2)
    (= (persones r4) 4)
    (= (persones r5) 2)

    ;; Configuración de días de reserva
    ;; r1: días 1-2 (2 personas)
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    ;; r2: días 2-3 (3 personas)
    (dia-reserva r2 d2)
    (dia-reserva r2 d3)

    ;; r3: días 1-3 (2 personas) - solapa con r1 y r2
    (dia-reserva r3 d1)
    (dia-reserva r3 d2)
    (dia-reserva r3 d3)

    ;; r4: días 3-5 (4 personas)
    (dia-reserva r4 d3)
    (dia-reserva r4 d4)
    (dia-reserva r4 d5)

    ;; r5: días 1-2 (2 personas) - solapa con r1 y r3
    (dia-reserva r5 d1)
    (dia-reserva r5 d2)
  )

  (:goal
    (and
      (servida r1)
      (servida r2)
      (servida r3)
      (servida r4)
      (servida r5)
    )
  )
)
