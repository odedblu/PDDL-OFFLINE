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
(init-ti9_observe-box_p1-1_a1_b0)
(immediate-dummy-ti9_observe-box_p1-1_a1_b0)
(dummy-left-ti9_observe-box_p1-1_a1_b0)
(immediate-dummy-9md_observe-box_p2-2_a3_b1)
(dummy-left-9md_observe-box_p2-2_a3_b1)
(pre-6q6_joint-push_p2-1_p2-2_b1_a2_a3)
(done-goal)
(dummy-right-9md_observe-box_p2-2_a3_b1)
(dummy-right-ti9_observe-box_p1-1_a1_b0)
(immediate-dummy-5bj_observe-box_p2-1_a2_b1)
(dummy-left-5bj_observe-box_p2-1_a2_b1)
(pre-hca_joint-push_p1-1_p1-2_b0_a1_a3)
(dummy-right-5bj_observe-box_p2-1_a2_b1)
(pre-4cx_joint-push_p2-1_p2-2_b1_a2_a3)
(pre-68k_joint-push_p1-1_p1-2_b0_a1_a3)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-ti9_observe-box_p1-1_a1_b0T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-ti9_observe-box_p1-1_a1_b0 ) (agent-at a3 p1-1) (box-at b0 p1-1))
 :effect 
(and (Kbox-at b0 p1-1))
)
(:action act-ti9_observe-box_p1-1_a1_b0F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-ti9_observe-box_p1-1_a1_b0 ) (agent-at a3 p1-1) (not (box-at b0 p1-1)))
 :effect 
(and (KNbox-at b0 p1-1))
)
(:action act-dummy-ti9_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition (init-ti9_observe-box_p1-1_a1_b0 )
 :effect (immediate-dummy-ti9_observe-box_p1-1_a1_b0 )
)
(:action dummy-left-ti9_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-ti9_observe-box_p1-1_a1_b0 ) (agent-at a3 p1-1) (KNbox-at b0 p1-1) (immediate-dummy-ti9_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-ti9_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-ti9_observe-box_p1-1_a1_b0 )) (dummy-left-ti9_observe-box_p1-1_a1_b0 ))
)
(:action dummy-right-ti9_observe-box_p1-1_a1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-ti9_observe-box_p1-1_a1_b0 ) (agent-at a3 p1-1) (Kbox-at b0 p1-1) (immediate-dummy-ti9_observe-box_p1-1_a1_b0 ))
 :effect 
(and (not (init-ti9_observe-box_p1-1_a1_b0 )) (not (immediate-dummy-ti9_observe-box_p1-1_a1_b0 )) (dummy-right-ti9_observe-box_p1-1_a1_b0 ))
)
(:action act-9md_observe-box_p2-2_a3_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-9md_observe-box_p2-2_a3_b1 ) (KNbox-at b0 p1-1) (agent-at a3 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-9md_observe-box_p2-2_a3_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-9md_observe-box_p2-2_a3_b1 ) (KNbox-at b0 p1-1) (agent-at a3 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-9md_observe-box_p2-2_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-ti9_observe-box_p1-1_a1_b0 ) (KNbox-at b0 p1-1) (agent-at a3 p2-2))
 :effect (immediate-dummy-9md_observe-box_p2-2_a3_b1 )
)
(:action dummy-left-9md_observe-box_p2-2_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-ti9_observe-box_p1-1_a1_b0 ) (KNbox-at b0 p1-1) (agent-at a3 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-9md_observe-box_p2-2_a3_b1 ))
 :effect 
(and (not (immediate-dummy-9md_observe-box_p2-2_a3_b1 )) (dummy-left-9md_observe-box_p2-2_a3_b1 ))
)
(:action dummy-right-9md_observe-box_p2-2_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-ti9_observe-box_p1-1_a1_b0 ) (KNbox-at b0 p1-1) (agent-at a3 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-9md_observe-box_p2-2_a3_b1 ))
 :effect 
(and (not (immediate-dummy-9md_observe-box_p2-2_a3_b1 )) (dummy-right-9md_observe-box_p2-2_a3_b1 ))
)
(:action act-6q6_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-9md_observe-box_p2-2_a3_b1 ) (KNbox-at b1 p2-2) (KNbox-at b0 p1-1) (agent-at a3 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-6q6_joint-push_p2-1_p2-2_b1_a2_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action goal-achieve-6q6_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition (pre-6q6_joint-push_p2-1_p2-2_b1_a2_a3 )
 :effect (done-goal )
)
(:action goal-achieve-right-9md_observe-box_p2-2_a3_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-9md_observe-box_p2-2_a3_b1 ) (Kbox-at b1 p2-2) (KNbox-at b0 p1-1))
 :effect (done-goal )
)
(:action act-5bj_observe-box_p2-1_a2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-1)) (not (KNbox-at b1 p2-1)) (dummy-right-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-5bj_observe-box_p2-1_a2_b1 ) (Kbox-at b0 p1-1) (agent-at a3 p2-1) (box-at b1 p2-1))
 :effect 
(and (Kbox-at b1 p2-1))
)
(:action act-5bj_observe-box_p2-1_a2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-1)) (not (KNbox-at b1 p2-1)) (dummy-right-ti9_observe-box_p1-1_a1_b0 ) (immediate-dummy-5bj_observe-box_p2-1_a2_b1 ) (Kbox-at b0 p1-1) (agent-at a3 p2-1) (not (box-at b1 p2-1)))
 :effect 
(and (KNbox-at b1 p2-1))
)
(:action act-dummy-5bj_observe-box_p2-1_a2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-ti9_observe-box_p1-1_a1_b0 ) (Kbox-at b0 p1-1) (agent-at a3 p2-1))
 :effect (immediate-dummy-5bj_observe-box_p2-1_a2_b1 )
)
(:action dummy-left-5bj_observe-box_p2-1_a2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-ti9_observe-box_p1-1_a1_b0 ) (Kbox-at b0 p1-1) (agent-at a3 p2-1) (KNbox-at b1 p2-1) (immediate-dummy-5bj_observe-box_p2-1_a2_b1 ))
 :effect 
(and (not (immediate-dummy-5bj_observe-box_p2-1_a2_b1 )) (dummy-left-5bj_observe-box_p2-1_a2_b1 ))
)
(:action dummy-right-5bj_observe-box_p2-1_a2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-ti9_observe-box_p1-1_a1_b0 ) (Kbox-at b0 p1-1) (agent-at a3 p2-1) (Kbox-at b1 p2-1) (immediate-dummy-5bj_observe-box_p2-1_a2_b1 ))
 :effect 
(and (not (immediate-dummy-5bj_observe-box_p2-1_a2_b1 )) (dummy-right-5bj_observe-box_p2-1_a2_b1 ))
)
(:action act-hca_joint-push_p1-1_p1-2_b0_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-5bj_observe-box_p2-1_a2_b1 ) (KNbox-at b1 p2-1) (Kbox-at b0 p1-1) (agent-at a3 p1-1))
 :effect 
(and (pre-hca_joint-push_p1-1_p1-2_b0_a1_a3 ) (KNbox-at b0 p1-1) (Kbox-at b0 p1-2))
)
(:action goal-achieve-hca_joint-push_p1-1_p1-2_b0_a1_a3
 :parameters (?a - agent )
 :precondition (pre-hca_joint-push_p1-1_p1-2_b0_a1_a3 )
 :effect (done-goal )
)
(:action act-4cx_joint-push_p2-1_p2-2_b1_a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-5bj_observe-box_p2-1_a2_b1 ) (Kbox-at b1 p2-1) (Kbox-at b0 p1-1) (agent-at a3 p2-1))
 :effect 
(and (pre-4cx_joint-push_p2-1_p2-2_b1_a2_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action act-68k_joint-push_p1-1_p1-2_b0_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (pre-4cx_joint-push_p2-1_p2-2_b1_a2_a3 ) (agent-at a3 p1-1) (Kbox-at b0 p1-1))
 :effect 
(and (pre-68k_joint-push_p1-1_p1-2_b0_a1_a3 ) (KNbox-at b0 p1-1) (Kbox-at b0 p1-2))
)
(:action goal-achieve-68k_joint-push_p1-1_p1-2_b0_a1_a3
 :parameters (?a - agent )
 :precondition (pre-68k_joint-push_p1-1_p1-2_b0_a1_a3 )
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
