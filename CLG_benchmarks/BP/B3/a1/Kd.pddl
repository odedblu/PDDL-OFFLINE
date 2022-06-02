(define (domain Kbox-3-a1)
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
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(init-ht2_observe-box_p1-1_a1_b0)
(immediate-dummy-ht2_observe-box_p1-1_a1_b0)
(dummy-left-ht2_observe-box_p1-1_a1_b0)
(done-goal)
(dummy-right-ht2_observe-box_p1-1_a1_b0)
(pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-ht2_observe-box_p1-1_a1_b0T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-ht2_observe-box_p1-1_a1_b0 ) (immediate-dummy-ht2_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (box-at b0 p1-1))
 :effect 
(and (Kbox-at b0 p1-1))
)
(:action act-ht2_observe-box_p1-1_a1_b0F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-ht2_observe-box_p1-1_a1_b0 ) (immediate-dummy-ht2_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (not (box-at b0 p1-1)))
 :effect 
(and (KNbox-at b0 p1-1))
)
(:action act-dummy-ht2_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition (init-ht2_observe-box_p1-1_a1_b0 )
 :effect (immediate-dummy-ht2_observe-box_p1-1_a1_b0 )
)
(:action dummy-left-ht2_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-ht2_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (KNbox-at b0 p1-1) (immediate-dummy-ht2_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-ht2_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-ht2_observe-box_p1-1_a1_b0 )) (dummy-left-ht2_observe-box_p1-1_a1_b0 ))
)
(:action dummy-right-ht2_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-ht2_observe-box_p1-1_a1_b0 ) (agent-at a1 p1-1) (Kbox-at b0 p1-1) (immediate-dummy-ht2_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-ht2_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-ht2_observe-box_p1-1_a1_b0 )) (dummy-right-ht2_observe-box_p1-1_a1_b0 ))
)
(:action goal-achieve-left-ht2_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-ht2_observe-box_p1-1_a1_b0 ) (KNbox-at b0 p1-1))
 :effect (done-goal )
)
(:action act-c8e_joint-push_p1-1_p1-2_b0_a1_a2
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-ht2_observe-box_p1-1_a1_b0 ) (Kbox-at b0 p1-1) (agent-at a1 p1-1))
 :effect 
(and (pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2 ) (KNbox-at b0 p1-1) (Kbox-at b0 p1-2))
)
(:action goal-achieve-c8e_joint-push_p1-1_p1-2_b0_a1_a2
 :parameters (?a - agent )
 :precondition (pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2 )
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
