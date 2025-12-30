
(define (problem reserves-hotel-ext4-1)
	(:domain reserves-hotel-ext4)

	(:objects
		h3 h4 - habitacio
		r1 r2 - reserva
		d1 d2 d3 d4 d5 - dia
	)

	(:init
		(= (total-cost) 0)

		(= (capacitat h3) 3)
		(= (capacitat h4) 4)

		(= (persones r1) 1)
		(= (persones r2) 3)

		;; r1 ocupa [d1,d3) i r2 ocupa [d3,d5): NO se solapen.
		;; Extensio 4: penalitza obrir habitacions noves i, a igualtat, minimitza desperdici.
		(dia-reserva r1 d1)
		(dia-reserva r1 d2)

		(dia-reserva r2 d3)
		(dia-reserva r2 d4)
	)

	(:goal
		(and
			;; Cal decidir per a cada reserva: servida o rebutjada
			(or (servida r1) (rebutjada r1))
			(or (servida r2) (rebutjada r2))
		)
	)

	(:metric minimize (total-cost))
)