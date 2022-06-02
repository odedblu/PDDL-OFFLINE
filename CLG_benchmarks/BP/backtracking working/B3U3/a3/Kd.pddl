(define (domain Kbox-3-a3)
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
 a3 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(init-mx3_observe-box-a3_p3-1_b2)
(immediate-dummy-mx3_observe-box-a3_p3-1_b2)
(dummy-left-mx3_observe-box-a3_p3-1_b2)
(immediate-dummy-jc9_observe-box-a3_p2-2_b1)
(dummy-left-jc9_observe-box-a3_p2-2_b1)
(pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3)
(done-goal)
(dummy-right-jc9_observe-box-a3_p2-2_b1)
(dummy-right-mx3_observe-box-a3_p3-1_b2)
(pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)
(immediate-dummy-hxs_observe-box-a3_p2-2_b1)
(dummy-left-hxs_observe-box-a3_p2-2_b1)
(pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3)
(dummy-right-hxs_observe-box-a3_p2-2_b1)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-mx3_observe-box-a3_p3-1_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (init-mx3_observe-box-a3_p3-1_b2 ) (immediate-dummy-mx3_observe-box-a3_p3-1_b2 ) (agent-at a3 p3-1) (box-at b2 p3-1))
 :effect 
(and (Kbox-at b2 p3-1))
)
(:action act-mx3_observe-box-a3_p3-1_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (init-mx3_observe-box-a3_p3-1_b2 ) (immediate-dummy-mx3_observe-box-a3_p3-1_b2 ) (agent-at a3 p3-1) (not (box-at b2 p3-1)))
 :effect 
(and (KNbox-at b2 p3-1))
)
(:action act-dummy-mx3_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition (init-mx3_observe-box-a3_p3-1_b2 )
 :effect (immediate-dummy-mx3_observe-box-a3_p3-1_b2 )
)
(:action dummy-left-mx3_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (init-mx3_observe-box-a3_p3-1_b2 ) (agent-at a3 p3-1) (KNbox-at b2 p3-1) (immediate-dummy-mx3_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (init-mx3_observe-box-a3_p3-1_b2 )) (not (immediate-dummy-mx3_observe-box-a3_p3-1_b2 )) (dummy-left-mx3_observe-box-a3_p3-1_b2 ))
)
(:action dummy-right-mx3_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (init-mx3_observe-box-a3_p3-1_b2 ) (agent-at a3 p3-1) (Kbox-at b2 p3-1) (immediate-dummy-mx3_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (init-mx3_observe-box-a3_p3-1_b2 )) (not (immediate-dummy-mx3_observe-box-a3_p3-1_b2 )) (dummy-right-mx3_observe-box-a3_p3-1_b2 ))
)
(:action act-jc9_observe-box-a3_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-mx3_observe-box-a3_p3-1_b2 ) (immediate-dummy-jc9_observe-box-a3_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a3 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-jc9_observe-box-a3_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-mx3_observe-box-a3_p3-1_b2 ) (immediate-dummy-jc9_observe-box-a3_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a3 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-jc9_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-mx3_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a3 p2-2))
 :effect (immediate-dummy-jc9_observe-box-a3_p2-2_b1 )
)
(:action dummy-left-jc9_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-mx3_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a3 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-jc9_observe-box-a3_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-jc9_observe-box-a3_p2-2_b1 )) (dummy-left-jc9_observe-box-a3_p2-2_b1 ))
)
(:action dummy-right-jc9_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-mx3_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a3 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-jc9_observe-box-a3_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-jc9_observe-box-a3_p2-2_b1 )) (dummy-right-jc9_observe-box-a3_p2-2_b1 ))
)
(:action act-8lh_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-jc9_observe-box-a3_p2-2_b1 ) (KNbox-at b1 p2-2) (KNbox-at b2 p3-1) (agent-at a3 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action goal-achieve-8lh_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition (pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3 )
 :effect (done-goal )
)
(:action goal-achieve-right-jc9_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-jc9_observe-box-a3_p2-2_b1 ) (Kbox-at b1 p2-2) (KNbox-at b2 p3-1))
 :effect (done-goal )
)
(:action act-09n_joint-push_p3-1_p3-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-mx3_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a3 p3-1))
 :effect 
(and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (KNbox-at b2 p3-1) (Kbox-at b2 p3-2))
)
(:action act-hxs_observe-box-a3_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (immediate-dummy-hxs_observe-box-a3_p2-2_b1 ) (agent-at a3 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-hxs_observe-box-a3_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (immediate-dummy-hxs_observe-box-a3_p2-2_b1 ) (agent-at a3 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-hxs_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (agent-at a3 p2-2))
 :effect (immediate-dummy-hxs_observe-box-a3_p2-2_b1 )
)
(:action dummy-left-hxs_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (agent-at a3 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-hxs_observe-box-a3_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-hxs_observe-box-a3_p2-2_b1 )) (dummy-left-hxs_observe-box-a3_p2-2_b1 ))
)
(:action dummy-right-hxs_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ) (agent-at a3 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-hxs_observe-box-a3_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-hxs_observe-box-a3_p2-2_b1 )) (dummy-right-hxs_observe-box-a3_p2-2_b1 ))
)
(:action act-p3o_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-hxs_observe-box-a3_p2-2_b1 ) (KNbox-at b1 p2-2) (agent-at a3 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action goal-achieve-p3o_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition (pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3 )
 :effect (done-goal )
)
(:action goal-achieve-right-hxs_observe-box-a3_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-hxs_observe-box-a3_p2-2_b1 ) (Kbox-at b1 p2-2))
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
