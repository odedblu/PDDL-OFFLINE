(define (problem Kunix-2)
(:domain Kunix)
;;Conformant
(:init
(at d1)
(Kopen d3)
(not (at-home ))
(near d1 d2)
(near d2 d3)
(not (at d2))
(not (at d3))
(not (at d4))
(NotKopen d1)
(NotKopen d2)
(NotKopen d4)
(MishapCount m0)
)
(:goal (at-home ))
)
