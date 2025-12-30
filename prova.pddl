(define (domain ReservesHotel)
	(:requirements :adl :typing :fluents)

	(:types habitacio reserva peticio - object)
	
    (:predicates
        (servida ?p - peticio)
        (disponible ?h - habitacio)
    )

    (:functions
        (diaMes)
        (numPersones)
    )

    (:action assignarReserva
        :parameters (?h - habitacio ?r - reserva ?p - peticio)
        :precondition (and (not(servida ?p)) (disponible ?h) 
                            ()
                        )
        :effect (and 
                        )
    )
)
