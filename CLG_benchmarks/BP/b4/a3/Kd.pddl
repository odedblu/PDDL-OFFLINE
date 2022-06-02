(define (domain Kbox-4-a3)
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
 a3 - agent
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos)
(KNbox-at ?b - box ?i - pos)
(heavy ?b - box)
(init-0lh_observe-box_p3-1_a3_b1)
(immediate-dummy-0lh_observe-box_p3-1_a3_b1)
(dummy-left-0lh_observe-box_p3-1_a3_b1)
(immediate-dummy-nxt_observe-box_p5-1_a2_b2)
(dummy-left-nxt_observe-box_p5-1_a2_b2)
(done-goal)
(dummy-right-nxt_observe-box_p5-1_a2_b2)
(pre-u7p_joint-push_p5-1_p5-2_b2_a2_a3)
(dummy-right-0lh_observe-box_p3-1_a3_b1)
(immediate-dummy-z58_observe-box_p5-1_a2_b2)
(dummy-left-z58_observe-box_p5-1_a2_b2)
(pre-tng_joint-push_p3-1_p3-2_b1_a2_a3)
(dummy-right-z58_observe-box_p5-1_a2_b2)
(pre-d3d_joint-push_p3-1_p3-2_b1_a2_a3)
(pre-wm2_joint-push_p5-1_p5-2_b2_a2_a3)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-0lh_observe-box_p3-1_a3_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p3-1)) (not (KNbox-at b1 p3-1)) (init-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-0lh_observe-box_p3-1_a3_b1 ) (agent-at a3 p3-1) (box-at b1 p3-1))
 :effect 
(and (Kbox-at b1 p3-1))
)
(:action act-0lh_observe-box_p3-1_a3_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p3-1)) (not (KNbox-at b1 p3-1)) (init-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-0lh_observe-box_p3-1_a3_b1 ) (agent-at a3 p3-1) (not (box-at b1 p3-1)))
 :effect 
(and (KNbox-at b1 p3-1))
)
(:action act-dummy-0lh_observe-box_p3-1_a3_b1
 :parameters (?a - agent )
 :precondition (init-0lh_observe-box_p3-1_a3_b1 )
 :effect (immediate-dummy-0lh_observe-box_p3-1_a3_b1 )
)
(:action dummy-left-0lh_observe-box_p3-1_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (init-0lh_observe-box_p3-1_a3_b1 ) (agent-at a3 p3-1) (KNbox-at b1 p3-1) (immediate-dummy-0lh_observe-box_p3-1_a3_b1 ))
 :effect 
(and (not (init-0lh_observe-box_p3-1_a3_b1 )) (not (immediate-dummy-0lh_observe-box_p3-1_a3_b1 )) (dummy-left-0lh_observe-box_p3-1_a3_b1 ))
)
(:action dummy-right-0lh_observe-box_p3-1_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (init-0lh_observe-box_p3-1_a3_b1 ) (agent-at a3 p3-1) (Kbox-at b1 p3-1) (immediate-dummy-0lh_observe-box_p3-1_a3_b1 ))
 :effect 
(and (not (init-0lh_observe-box_p3-1_a3_b1 )) (not (immediate-dummy-0lh_observe-box_p3-1_a3_b1 )) (dummy-right-0lh_observe-box_p3-1_a3_b1 ))
)
(:action act-nxt_observe-box_p5-1_a2_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (dummy-left-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-nxt_observe-box_p5-1_a2_b2 ) (KNbox-at b1 p3-1) (agent-at a3 p5-1) (box-at b2 p5-1))
 :effect 
(and (Kbox-at b2 p5-1))
)
(:action act-nxt_observe-box_p5-1_a2_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (dummy-left-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-nxt_observe-box_p5-1_a2_b2 ) (KNbox-at b1 p3-1) (agent-at a3 p5-1) (not (box-at b2 p5-1)))
 :effect 
(and (KNbox-at b2 p5-1))
)
(:action act-dummy-nxt_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-0lh_observe-box_p3-1_a3_b1 ) (KNbox-at b1 p3-1) (agent-at a3 p5-1))
 :effect (immediate-dummy-nxt_observe-box_p5-1_a2_b2 )
)
(:action dummy-left-nxt_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-0lh_observe-box_p3-1_a3_b1 ) (KNbox-at b1 p3-1) (agent-at a3 p5-1) (KNbox-at b2 p5-1) (immediate-dummy-nxt_observe-box_p5-1_a2_b2 ))
 :effect 
(and (not (immediate-dummy-nxt_observe-box_p5-1_a2_b2 )) (dummy-left-nxt_observe-box_p5-1_a2_b2 ))
)
(:action dummy-right-nxt_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-0lh_observe-box_p3-1_a3_b1 ) (KNbox-at b1 p3-1) (agent-at a3 p5-1) (Kbox-at b2 p5-1) (immediate-dummy-nxt_observe-box_p5-1_a2_b2 ))
 :effect 
(and (not (immediate-dummy-nxt_observe-box_p5-1_a2_b2 )) (dummy-right-nxt_observe-box_p5-1_a2_b2 ))
)
(:action goal-achieve-left-nxt_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-nxt_observe-box_p5-1_a2_b2 ) (KNbox-at b2 p5-1) (KNbox-at b1 p3-1))
 :effect (done-goal )
)
(:action act-u7p_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-nxt_observe-box_p5-1_a2_b2 ) (Kbox-at b2 p5-1) (KNbox-at b1 p3-1) (agent-at a3 p5-1))
 :effect 
(and (pre-u7p_joint-push_p5-1_p5-2_b2_a2_a3 ) (KNbox-at b2 p5-1) (Kbox-at b2 p5-2))
)
(:action goal-achieve-u7p_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition (pre-u7p_joint-push_p5-1_p5-2_b2_a2_a3 )
 :effect (done-goal )
)
(:action act-z58_observe-box_p5-1_a2_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (dummy-right-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-z58_observe-box_p5-1_a2_b2 ) (Kbox-at b1 p3-1) (agent-at a3 p5-1) (box-at b2 p5-1))
 :effect 
(and (Kbox-at b2 p5-1))
)
(:action act-z58_observe-box_p5-1_a2_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p5-1)) (not (KNbox-at b2 p5-1)) (dummy-right-0lh_observe-box_p3-1_a3_b1 ) (immediate-dummy-z58_observe-box_p5-1_a2_b2 ) (Kbox-at b1 p3-1) (agent-at a3 p5-1) (not (box-at b2 p5-1)))
 :effect 
(and (KNbox-at b2 p5-1))
)
(:action act-dummy-z58_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-0lh_observe-box_p3-1_a3_b1 ) (Kbox-at b1 p3-1) (agent-at a3 p5-1))
 :effect (immediate-dummy-z58_observe-box_p5-1_a2_b2 )
)
(:action dummy-left-z58_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-0lh_observe-box_p3-1_a3_b1 ) (Kbox-at b1 p3-1) (agent-at a3 p5-1) (KNbox-at b2 p5-1) (immediate-dummy-z58_observe-box_p5-1_a2_b2 ))
 :effect 
(and (not (immediate-dummy-z58_observe-box_p5-1_a2_b2 )) (dummy-left-z58_observe-box_p5-1_a2_b2 ))
)
(:action dummy-right-z58_observe-box_p5-1_a2_b2
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-0lh_observe-box_p3-1_a3_b1 ) (Kbox-at b1 p3-1) (agent-at a3 p5-1) (Kbox-at b2 p5-1) (immediate-dummy-z58_observe-box_p5-1_a2_b2 ))
 :effect 
(and (not (immediate-dummy-z58_observe-box_p5-1_a2_b2 )) (dummy-right-z58_observe-box_p5-1_a2_b2 ))
)
(:action act-tng_joint-push_p3-1_p3-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-z58_observe-box_p5-1_a2_b2 ) (KNbox-at b2 p5-1) (Kbox-at b1 p3-1) (agent-at a3 p3-1))
 :effect 
(and (pre-tng_joint-push_p3-1_p3-2_b1_a2_a3 ) (KNbox-at b1 p3-1) (Kbox-at b1 p3-2))
)
(:action goal-achieve-tng_joint-push_p3-1_p3-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition (pre-tng_joint-push_p3-1_p3-2_b1_a2_a3 )
 :effect (done-goal )
)
(:action act-d3d_joint-push_p3-1_p3-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-z58_observe-box_p5-1_a2_b2 ) (Kbox-at b2 p5-1) (Kbox-at b1 p3-1) (agent-at a3 p3-1))
 :effect 
(and (pre-d3d_joint-push_p3-1_p3-2_b1_a2_a3 ) (KNbox-at b1 p3-1) (Kbox-at b1 p3-2))
)
(:action act-wm2_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (pre-d3d_joint-push_p3-1_p3-2_b1_a2_a3 ) (agent-at a3 p5-1) (Kbox-at b2 p5-1))
 :effect 
(and (pre-wm2_joint-push_p5-1_p5-2_b2_a2_a3 ) (KNbox-at b2 p5-1) (Kbox-at b2 p5-2))
)
(:action goal-achieve-wm2_joint-push_p5-1_p5-2_b2_a2_a3
 :parameters (?a - agent )
 :precondition (pre-wm2_joint-push_p5-1_p5-2_b2_a2_a3 )
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
