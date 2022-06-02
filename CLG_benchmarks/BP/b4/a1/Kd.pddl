(define (domain Kbox-4-a1)
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
 p4-1 - pos
 p4-2 - pos
 p5-1 - pos
 p5-2 - pos
 b0 - box
 b1 - box
 b2 - box
 a1 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(init-snx_observe-box_p1-1_a1_b0)
(immediate-dummy-snx_observe-box_p1-1_a1_b0)
(dummy-left-snx_observe-box_p1-1_a1_b0)
(done-goal)
(dummy-right-snx_observe-box_p1-1_a1_b0)
(pre-bne_push_p1-1_p1-2_b0_a1)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-snx_observe-box_p1-1_a1_b0T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-snx_observe-box_p1-1_a1_b0 ) (immediate-dummy-snx_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (box-at b0 p1-1))
 :effect 
(and (Kbox-at b0 p1-1))
)
(:action act-snx_observe-box_p1-1_a1_b0F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-snx_observe-box_p1-1_a1_b0 ) (immediate-dummy-snx_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (not (box-at b0 p1-1)))
 :effect 
(and (KNbox-at b0 p1-1))
)
(:action act-dummy-snx_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition (init-snx_observe-box_p1-1_a1_b0 )
 :effect (immediate-dummy-snx_observe-box_p1-1_a1_b0 )
)
(:action dummy-left-snx_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-snx_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (KNbox-at b0 p1-1) (immediate-dummy-snx_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-snx_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-snx_observe-box_p1-1_a1_b0 )) (dummy-left-snx_observe-box_p1-1_a1_b0 ))
)
(:action dummy-right-snx_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-snx_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (Kbox-at b0 p1-1) (immediate-dummy-snx_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-snx_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-snx_observe-box_p1-1_a1_b0 )) (dummy-right-snx_observe-box_p1-1_a1_b0 ))
)
(:action goal-achieve-left-snx_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-snx_observe-box_p1-1_a1_b0 ) (KNbox-at b0 p1-1))
 :effect (done-goal )
)
(:action act-bne_push_p1-1_p1-2_b0_a1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-snx_observe-box_p1-1_a1_b0 ) (Kbox-at b0 p1-1) (agent-at a1 p1-1))
 :effect 
(and (pre-bne_push_p1-1_p1-2_b0_a1 ) (KNbox-at b0 p1-1) (Kbox-at b0 p1-2))
)
(:action goal-achieve-bne_push_p1-1_p1-2_b0_a1
 :parameters (?a - agent )
 :precondition (pre-bne_push_p1-1_p1-2_b0_a1 )
 :effect (done-goal )
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
(:action R8
:precondition (and(Kbox-at b2 p5-1)(box-at b2 p5-1)(not (box-at b2 p5-2)))
:effect (and(KNbox-at b2 p5-2))
)
(:action R9
:precondition (and(not (box-at b2 p5-2))(KNbox-at b2 p5-2)(box-at b2 p5-1))
:effect (and(Kbox-at b2 p5-1))
)
(:action R10
:precondition (and(Kbox-at b2 p5-2)(box-at b2 p5-2)(not (box-at b2 p5-1)))
:effect (and(KNbox-at b2 p5-1))
)
(:action R11
:precondition (and(not (box-at b2 p5-1))(KNbox-at b2 p5-1)(box-at b2 p5-2))
:effect (and(Kbox-at b2 p5-2))
)
)
