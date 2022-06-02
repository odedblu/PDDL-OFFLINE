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
 b2 - box
 a1 - agent
 a2 - agent
 a3 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(same-agent ?a1 - agent ?a2 - agent)
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
 :parameters (?start - pos ?end - pos ?b - box ?a1 - agent ?a2 - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a1 ?start) (agent-at ?a2 ?start) (Kbox-at ?b ?start) (heavy ?b) (not (same-agent ?a1 ?a2)))
 :effect 
(and (KNbox-at ?b ?start) (Kbox-at ?b ?end))
)
(:action observe-box-a1T
 :parameters (?i - pos ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at a1 ?i) (box-at ?b ?i))
 :effect 
(and (Kbox-at ?b ?i))
)
(:action observe-box-a1F
 :parameters (?i - pos ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at a1 ?i) (not (box-at ?b ?i)))
 :effect 
(and (KNbox-at ?b ?i))
)
(:action observe-box-a3T
 :parameters (?i - pos ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at a3 ?i) (box-at ?b ?i))
 :effect 
(and (Kbox-at ?b ?i))
)
(:action observe-box-a3F
 :parameters (?i - pos ?b - box )
 :precondition 
(and (not (Kbox-at ?b ?i)) (not (KNbox-at ?b ?i)) (agent-at a3 ?i) (not (box-at ?b ?i)))
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
:precondition (and(Kbox-at b1 p2-1)(box-at b1 p2-1)(not (box-at b1 p2-2)))
:effect (and(KNbox-at b1 p2-2))
)
(:action R5
:precondition (and(not (box-at b1 p2-2))(KNbox-at b1 p2-2)(box-at b1 p2-1))
:effect (and(Kbox-at b1 p2-1))
)
(:action R6
:precondition (and(Kbox-at b1 p2-2)(box-at b1 p2-2)(not (box-at b1 p2-1)))
:effect (and(KNbox-at b1 p2-1))
)
(:action R7
:precondition (and(not (box-at b1 p2-1))(KNbox-at b1 p2-1)(box-at b1 p2-2))
:effect (and(Kbox-at b1 p2-2))
)
(:action R8
:precondition (and(Kbox-at b2 p3-1)(box-at b2 p3-1)(not (box-at b2 p3-2)))
:effect (and(KNbox-at b2 p3-2))
)
(:action R9
:precondition (and(not (box-at b2 p3-2))(KNbox-at b2 p3-2)(box-at b2 p3-1))
:effect (and(Kbox-at b2 p3-1))
)
(:action R10
:precondition (and(Kbox-at b2 p3-2)(box-at b2 p3-2)(not (box-at b2 p3-1)))
:effect (and(KNbox-at b2 p3-1))
)
(:action R11
:precondition (and(not (box-at b2 p3-1))(KNbox-at b2 p3-1)(box-at b2 p3-2))
:effect (and(Kbox-at b2 p3-2))
)
)
