(define (problem reserves-hotel-ext4-test)
  (:domain reserves-hotel-ext4)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 - dia
  )

  (:init
    (= (total-cost) 0)

    ;; TEST domini ext4 (prioritats):
    ;; 1) rebutjar (molt car)  2) obrir habitacions  3) desperdici
    ;;
    ;; Disseny del test:
    ;; - NO hi ha solapaments entre reserves -> totes es poden servir.
    ;; - Hi ha una solucio amb desperdici 0 pero usa mes habitacions.
    ;; - L'optima ha de preferir usar el MINIM nombre d'habitacions encara que
    ;;   augmenti el desperdici.
    ;; - A igual nombre d'habitacions, ha d'escollir la que minimitzi desperdici.

    ;; Habitacions (capacitats)
    (= (capacitat h1) 5)
    (= (capacitat h2) 4)
    (= (capacitat h3) 3)
    (= (capacitat h4) 2)

    ;; Reserves (persones)
    (= (persones r1) 2)
    (= (persones r2) 3)
    (= (persones r3) 4)
    (= (persones r4) 2)
    (= (persones r5) 3)

    ;; Dies de reserva (cap solapament)
    (dia-reserva r1 d1)
    (dia-reserva r2 d2)
    (dia-reserva r3 d3)
    (dia-reserva r4 d4)
    (dia-reserva r5 d5)
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
