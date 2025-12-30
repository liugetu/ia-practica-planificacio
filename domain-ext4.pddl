(define (domain reserves-hotel-ext4)
  (:requirements :adl :typing :fluents :action-costs)

  (:types habitacio reserva dia - object)

  (:predicates
    (servida ?r - reserva)
    (rebutjada ?r - reserva)
    (assignada ?r - reserva ?h - habitacio)
    (ocupada ?h - habitacio ?d - dia)
    (dia-reserva ?r - reserva ?d - dia)
    (ja-ocupada ?h)
  )

  (:functions
    (capacitat ?h - habitacio)
    (persones ?r - reserva)
    (total-cost)
  )

  ;; Prioritats (cost total a minimitzar):
  ;; 1) No rebutjar reserves
  ;; 2) Minimitzar nombre d'habitacions utilitzades
  ;; 3) Minimitzar desperdici (capacitat - persones)

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
        ;; Penalitza obrir una habitacio nova (la primera vegada que s'usa).
        (when (not (ja-ocupada ?h)) (and (ja-ocupada ?h) (increase (total-cost) 1000)))
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
        ;; Pes molt gran per assegurar prioritat sobre la resta de costos.
        (increase (total-cost) 1000000)
      )
  )
)
