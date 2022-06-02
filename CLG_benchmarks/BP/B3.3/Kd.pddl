(define (domain Kbox-3)
(:requirements :strips :typing)
;;SingleStateK
(:types pos agent box push)
(:constants
 p1-1 - pos
 p1-2 - pos
 p2-1 - pos
 p2-2 - pos
 p3-1 - pos
 p3-2 - pos
 b0 - box
 b1 - box
 a1 - agent
 a2 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action push
 :parameters (?start - pos ?end - pos ?b - box ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start) (Kbox-at ?b ?start) (not (heavy ?b)))
 :effect 
(and (KNbox-at ?b ?start) (Kbox-at ?b ?end))
)
(:action joint-push
 :parameters (?start - pos ?end - pos ?b - box )
 :precondition 
(and (adj ?start ?end) (agent-at a1 ?start) (agent-at a2 ?start) (Kbox-at ?b ?start) (heavy ?b))
 :effect 
(and (KNbox-at ?b ?start) (Kbox-at ?b ?end))
)
(:action observe-boxT
 :parameters (?i - pos ?a - agent ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at ?a ?i) (box-at ?b ?i))
 :effect 
(and (Kbox-at ?b ?i))
)
(:action observe-boxF
 :parameters (?i - pos ?a - agent ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at ?a ?i) (not (box-at ?b ?i)))
 :effect 
(and (KNbox-at ?b ?i))
)
(:action R0
:precondition (and(Kbox-at b0 p1-1)(box-at b0 p1-1)(not (box-at b0 p1-2)))
:effect (and(KNbox-at b0 p1-2))
)
(:action R1
:precondition (and(not (box-at b0 p1-2))(KNbox-at b0 p1-2)(box-at b0 p1-1))
:effect (and(Kbox-at b0 p1-1))
)
(:action R2
:precondition (and(Kbox-at b0 p1-2)(box-at b0 p1-2)(not (box-at b0 p1-1)))
:effect (and(KNbox-at b0 p1-1))
)
(:action R3
:precondition (and(not (box-at b0 p1-1))(KNbox-at b0 p1-1)(box-at b0 p1-2))
:effect (and(Kbox-at b0 p1-2))
)
(:action R4
:precondition (and(Kbox-at b1 p3-1)(box-at b1 p3-1)(not (box-at b1 p3-2)))
:effect (and(KNbox-at b1 p3-2))
)
(:action R5
:precondition (and(not (box-at b1 p3-2))(KNbox-at b1 p3-2)(box-at b1 p3-1))
:effect (and(Kbox-at b1 p3-1))
)
(:action R6
:precondition (and(Kbox-at b1 p3-2)(box-at b1 p3-2)(not (box-at b1 p3-1)))
:effect (and(KNbox-at b1 p3-1))
)
(:action R7
:precondition (and(not (box-at b1 p3-1))(KNbox-at b1 p3-1)(box-at b1 p3-2))
:effect (and(Kbox-at b1 p3-2))
)
)
