(define (problem reserves-hotel-ext3-test)
  (:domain reserves-hotel-ext3)

  (:objects
    h1 h2 h3 h4 - habitacio
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 - dia
  )

  (:init
    (= (total-cost) 0)

    ;; TEST domini ext3 (desperdici):
    ;; Volem comprovar que, si no cal rebutjar cap reserva, el planificador
    ;; tria assignacions amb desperdici minim (capacitat - persones).
    ;;
    ;; Disseny: capacitats 2/2/3/4 i reserves que poden encaixar exactament
    ;; en dies amb solapaments, de manera que hi ha una solucio amb cost 0.

    ;; Habitacions (capacitats)
    (= (capacitat h1) 2)
    (= (capacitat h2) 2)
    (= (capacitat h3) 3)
    (= (capacitat h4) 4)

    ;; Reserves (persones)
    (= (persones r1) 2)
    (= (persones r2) 3)
    (= (persones r3) 4)
    (= (persones r4) 2)
    (= (persones r5) 2)

    ;; Dies de reserva
    ;; d1-d2: r1(2) + r2(3) + r3(4) se solapen => han d'ocupar 3 habitacions alhora.
    ;; La solucio de cost 0 es: r1->cap2, r2->cap3, r3->cap4.
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)

    (dia-reserva r2 d1)
    (dia-reserva r2 d2)

    (dia-reserva r3 d1)
    (dia-reserva r3 d2)

    ;; d3-d4: dues reserves petites (2) se solapen i encaixen exactament a les dues cap2.
    (dia-reserva r4 d3)
    (dia-reserva r4 d4)

    (dia-reserva r5 d3)
    (dia-reserva r5 d4)
  )

  (:goal
    (and
      ;; Ahora minimizamos desperdicio además de rechazos
      (or (servida r1) (rebutjada r1))
      (or (servida r2) (rebutjada r2))
      (or (servida r3) (rebutjada r3))
      (or (servida r4) (rebutjada r4))
      (or (servida r5) (rebutjada r5))
    )
  )

  (:metric minimize (total-cost))
)
