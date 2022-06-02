(define (domain Kbox-4-a2)
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
 a2 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(init-n3s_observe-box_p5-1_a2_b2)
(immediate-dummy-n3s_observe-box_p5-1_a2_b2)
(dummy-left-n3s_observe-box_p5-1_a2_b2)
(done-goal)
(dummy-right-n3s_observe-box_p5-1_a2_b2)
(pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-n3s_observe-box_p5-1_a2_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (init-n3s_observe-box_p5-1_a2_b2 ) (immediate-dummy-n3s_observe-box_p5-1_a2_b2 ) (agent-at a2 p5-1) (box-at b2 p5-1))
 :effect 
(and (Kbox-at b2 p5-1))
)
(:action act-n3s_observe-box_p5-1_a2_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (init-n3s_observe-box_p5-1_a2_b2 ) (immediate-dummy-n3s_observe-box_p5-1_a2_b2 ) (agent-at a2 p5-1) (not (box-at b2 p5-1)))
 :effect 
(and (KNbox-at b2 p5-1))
)
(:action act-dummy-n3s_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition (init-n3s_observe-box_p5-1_a2_b2 )
 :effect (immediate-dummy-n3s_observe-box_p5-1_a2_b2 )
)
(:action dummy-left-n3s_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (init-n3s_observe-box_p5-1_a2_b2 ) (immediate-dummy-n3s_observe-box_p5-1_a2_b2 ) (agent-at a2 p5-1) (KNbox-at b2 p5-1))
 :effect 
(and (not (init-n3s_observe-box_p5-1_a2_b2 )) (not (immediate-dummy-n3s_observe-box_p5-1_a2_b2 )) (dummy-left-n3s_observe-box_p5-1_a2_b2 ))
)
(:action dummy-right-n3s_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (init-n3s_observe-box_p5-1_a2_b2 ) (immediate-dummy-n3s_observe-box_p5-1_a2_b2 ) (agent-at a2 p5-1) (Kbox-at b2 p5-1))
 :effect 
(and (not (init-n3s_observe-box_p5-1_a2_b2 )) (not (immediate-dummy-n3s_observe-box_p5-1_a2_b2 )) (dummy-right-n3s_observe-box_p5-1_a2_b2 ))
)
(:action goal-achieve-left-n3s_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-n3s_observe-box_p5-1_a2_b2 ) (KNbox-at b2 p5-1))
 :effect (done-goal )
)
(:action act-xw6_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-n3s_observe-box_p5-1_a2_b2 ) (Kbox-at b2 p5-1) (agent-at a2 p5-1))
 :effect 
(and (pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3 ) (KNbox-at b2 p5-1) (Kbox-at b2 p5-2))
)
(:action goal-achieve-xw6_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition (pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3 )
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
