(define (domain Kbts)
(:requirements :strips :typing)
(:types package bomb toilet)
(:constants
 b0 - bomb
 p0 - package
 p1 - package
 p2 - package
 p3 - package
 p4 - package
 p5 - package
 p6 - package
 p7 - package
 p8 - package
 p9 - package
 p10 - package
 p11 - package
 p12 - package
 p13 - package
 p14 - package
 p15 - package
 p16 - package
 p17 - package
 p18 - package
 p19 - package
 p20 - package
 p21 - package
 p22 - package
 p23 - package
 p24 - package
 p25 - package
 p26 - package
 p27 - package
 p28 - package
 p29 - package
 p30 - package
 p31 - package
 p32 - package
 p33 - package
 p34 - package
 p35 - package
 p36 - package
 p37 - package
 p38 - package
 p39 - package
 p40 - package
 p41 - package
 p42 - package
 p43 - package
 p44 - package
 p45 - package
 p46 - package
 p47 - package
 p48 - package
 p49 - package
 t0 - toilet
)

(:predicates
(in ?p - package ?b - bomb)
(defused ?b - bomb)
)

(:action dunk
:parameters ( ?p - package ?b - bomb ?t - toilet)
:precondition (in ?p ?b)
:effect 
(and (defused ?b))
)

)
