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
    ;; Nota: evitem una habitacio de capacitat 3 perque pot crear una solucio
    ;; "greedy" (desperdici 0 immediat) que despres obliga a obrir una segona
    ;; habitacio per a reserves grans. Això faria que Metric-FF retorni un pla
    ;; suboptim (Metric-FF no garanteix optimalitat global).
    (= (capacitat h1) 5)
    (= (capacitat h2) 4)
    (= (capacitat h3) 2)
    (= (capacitat h4) 2)

    ;; Reserves (persones)
    ;; Totes les reserves son de 3 o 4 persones, de manera que NOMES h1/h2
    ;; poden servir-les (h3/h4 son massa petites). L'optima ha de:
    ;; - usar 1 sola habitacio (per no pagar 2 cops el cost d'obrir), i
    ;; - triar h2 (cap 4) abans que h1 (cap 5) per minimitzar desperdici.
    (= (persones r1) 3)
    (= (persones r2) 3)
    (= (persones r3) 4)
    (= (persones r4) 3)
    (= (persones r5) 4)

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
