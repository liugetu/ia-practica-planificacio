(define (domain reserves-hotel-ext3)
  (:requirements :adl :typing :fluents :action-costs)

  (:types habitacio reserva dia - object)

  (:predicates
    (servida ?r - reserva)
    (rebutjada ?r - reserva)
    (assignada ?r - reserva ?h - habitacio)
    (ocupada ?h - habitacio ?d - dia)
    (dia-reserva ?r - reserva ?d - dia)
  )

  (:functions
    (capacitat ?h - habitacio)
    (persones ?r - reserva)
    (total-cost)
  )

  (:action assignar
    :parameters (?r - reserva ?h - habitacio)
    :precondition
      (and
        (not (servida ?r))
        (not (rebutjada ?r))
        (>= (capacitat ?h) (persones ?r))
        (forall (?d - dia)
          (imply (dia-reserva ?r ?d) (not (ocupada ?h ?d))))
      )
    :effect
      (and
        (servida ?r)
        (assignada ?r ?h)
        (forall (?d - dia)
          (when (dia-reserva ?r ?d) (ocupada ?h ?d)))
        ;; Extensio 3: minimitzar el desperdici de capacitat quan s'assigna.
        ;; (>= (capacitat ?h) (persones ?r)) garanteix que el terme es no-negatiu.
        (increase (total-cost) (- (capacitat ?h) (persones ?r)))
      )
  )

  (:action rebutjar
    :parameters (?r - reserva)
    :precondition
      (and
        (not (servida ?r))
        (not (rebutjada ?r))
      )
    :effect
      (and
        (rebutjada ?r)
        ;; Extensio 1: maximitzar reserves assignades (equivalent a minimitzar rebutjades)
        (increase (total-cost) 1000)
      )
  )
)
