(define (domain reserves-hotel-basic)
  (:requirements :adl :typing :fluents)

  (:types habitacio reserva dia)

  (:predicates
    (servida ?r - reserva)
    (assignada ?r - reserva ?h - habitacio)
    (ocupada ?h - habitacio ?d - dia)
    (dia-reserva ?r - reserva ?d - dia)
  )

  (:functions
    (capacitat ?h - habitacio)
    (persones ?r - reserva)
  )

  (:action assignar
    :parameters (?r - reserva ?h - habitacio)
    :precondition
      (and
        (not (servida ?r))
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
      )
  )
)
