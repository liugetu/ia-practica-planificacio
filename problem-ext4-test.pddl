(define (problem reserves-hotel-ext4-test)
  (:domain reserves-hotel-ext4)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 - dia
  )

  (:init
    (= (total-cost) 0)

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
      ;; Ahora minimizamos habitaciones abiertas, desperdicio y rechazos
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
      (or (servida r4) (rebutjada r4))
      (or (servida r5) (rebutjada r5))
    )
  )

  (:metric minimize (total-cost))
)
