(define (domain wumpus)
(:requirements :strips :typing)
(:types pos)
(:constants
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p1-5 - pos
 p1-6 - pos
 p1-7 - pos
 p1-8 - pos
 p1-9 - pos
 p1-10 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p2-5 - pos
 p2-6 - pos
 p2-7 - pos
 p2-8 - pos
 p2-9 - pos
 p2-10 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p3-5 - pos
 p3-6 - pos
 p3-7 - pos
 p3-8 - pos
 p3-9 - pos
 p3-10 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 p4-5 - pos
 p4-6 - pos
 p4-7 - pos
 p4-8 - pos
 p4-9 - pos
 p4-10 - pos
 p5-1 - pos
 p5-2 - pos
 p5-3 - pos
 p5-4 - pos
 p5-5 - pos
 p5-6 - pos
 p5-7 - pos
 p5-8 - pos
 p5-9 - pos
 p5-10 - pos
 p6-1 - pos
 p6-2 - pos
 p6-3 - pos
 p6-4 - pos
 p6-5 - pos
 p6-6 - pos
 p6-7 - pos
 p6-8 - pos
 p6-9 - pos
 p6-10 - pos
 p7-1 - pos
 p7-2 - pos
 p7-3 - pos
 p7-4 - pos
 p7-5 - pos
 p7-6 - pos
 p7-7 - pos
 p7-8 - pos
 p7-9 - pos
 p7-10 - pos
 p8-1 - pos
 p8-2 - pos
 p8-3 - pos
 p8-4 - pos
 p8-5 - pos
 p8-6 - pos
 p8-7 - pos
 p8-8 - pos
 p8-9 - pos
 p8-10 - pos
 p9-1 - pos
 p9-2 - pos
 p9-3 - pos
 p9-4 - pos
 p9-5 - pos
 p9-6 - pos
 p9-7 - pos
 p9-8 - pos
 p9-9 - pos
 p9-10 - pos
 p10-1 - pos
 p10-2 - pos
 p10-3 - pos
 p10-4 - pos
 p10-5 - pos
 p10-6 - pos
 p10-7 - pos
 p10-8 - pos
 p10-9 - pos
 p10-10 - pos
)

(:predicates
(adj ?i - pos ?j - pos)
(at ?i - pos)
(safe ?i - pos)
(wumpus-at ?x - pos)
(alive)
(stench ?i - pos)
(gold-at ?i - pos)
(got-the-treasure)
(breeze ?i - pos)
(pit-at ?p - pos)
)

(:action move
:parameters ( ?i - pos ?j - pos)
:precondition (and (adj ?i ?j) (at ?i) (alive ) (safe ?j))
:effect (and (not (at ?i)) (at ?j))
)

(:sensor smell_wumpus
:parameters ( ?pos - pos)
:condition (and (alive ) (at ?pos))
:sensed (stench ?pos)
)

(:sensor feel-breeze
:parameters ( ?pos - pos)
:condition (and (alive ) (at ?pos))
:sensed (breeze ?pos)
)

(:action grab
:parameters ( ?i - pos)
:precondition (and (at ?i) (gold-at ?i) (alive ))
:effect (and (got-the-treasure ) (not (gold-at ?i)))
)

)
