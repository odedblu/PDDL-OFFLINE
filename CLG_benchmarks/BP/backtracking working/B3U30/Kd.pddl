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
(c-p-joint-push-go1)
(observe-joint-push-go1)
(init-dat_observe-box-a1_p1-1_b0)
(immediate-dummy-dat_observe-box-a1_p1-1_b0)
(dummy-left-dat_observe-box-a1_p1-1_b0)
(pre-9h4_obs-go1-a2_a3)
(immediate-dummy-67a_observe-box-a3_p3-1_b2)
(dummy-left-67a_observe-box-a3_p3-1_b2)
(immediate-dummy-ruz_observe-box-a1_p2-2_b1)
(dummy-left-ruz_observe-box-a1_p2-2_b1)
(pre-8d4_joint-push_p2-1_p2-2_b1_a1_a3)
(done-goal)
(dummy-right-ruz_observe-box-a1_p2-2_b1)
(dummy-right-67a_observe-box-a3_p3-1_b2)
(immediate-dummy-o7q_observe-box-a1_p2-2_b1)
(dummy-left-o7q_observe-box-a1_p2-2_b1)
(pre-9io_joint-push_p2-1_p2-2_b1_a1_a3)
(pre-se3_joint-push_p3-1_p3-2_b2_a1_a3)
(dummy-right-o7q_observe-box-a1_p2-2_b1)
(pre-kmz_joint-push_p3-1_p3-2_b2_a1_a3)
(dummy-right-dat_observe-box-a1_p1-1_b0)
(pre-4uo_push_p1-1_p1-2_b0_a1)
(immediate-dummy-jnj_observe-box-a3_p3-1_b2)
(dummy-left-jnj_observe-box-a3_p3-1_b2)
(immediate-dummy-oj0_observe-box-a1_p2-2_b1)
(dummy-left-oj0_observe-box-a1_p2-2_b1)
(pre-6up_joint-push_p2-1_p2-2_b1_a1_a3)
(dummy-right-oj0_observe-box-a1_p2-2_b1)
(dummy-right-jnj_observe-box-a3_p3-1_b2)
(immediate-dummy-8bc_observe-box-a1_p2-2_b1)
(dummy-left-8bc_observe-box-a1_p2-2_b1)
(pre-pky_joint-push_p2-1_p2-2_b1_a1_a3)
(pre-55u_joint-push_p3-1_p3-2_b2_a1_a3)
(dummy-right-8bc_observe-box-a1_p2-2_b1)
(pre-c09_joint-push_p3-1_p3-2_b2_a1_a3)
)

(:action move
 :parameters (?start - pos ?end - pos ?a - agent )
 :precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
 :effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action act-dat_observe-box-a1_p1-1_b0T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-dat_observe-box-a1_p1-1_b0 ) (immediate-dummy-dat_observe-box-a1_p1-1_b0 ) (agent-at a1 p1-1) (box-at b0 p1-1))
 :effect 
(and (Kbox-at b0 p1-1))
)
(:action act-dat_observe-box-a1_p1-1_b0F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b0 p1-1)) (not (KNbox-at b0 p1-1)) (init-dat_observe-box-a1_p1-1_b0 ) (immediate-dummy-dat_observe-box-a1_p1-1_b0 ) (agent-at a1 p1-1) (not (box-at b0 p1-1)))
 :effect 
(and (KNbox-at b0 p1-1))
)
(:action act-dummy-dat_observe-box-a1_p1-1_b0
 :parameters (?a - agent )
 :precondition (init-dat_observe-box-a1_p1-1_b0 )
 :effect (immediate-dummy-dat_observe-box-a1_p1-1_b0 )
)
(:action dummy-left-dat_observe-box-a1_p1-1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-dat_observe-box-a1_p1-1_b0 ) (agent-at a1 p1-1) (KNbox-at b0 p1-1) (immediate-dummy-dat_observe-box-a1_p1-1_b0 ))
 :effect 
(and (not (init-dat_observe-box-a1_p1-1_b0 )) (not (immediate-dummy-dat_observe-box-a1_p1-1_b0 )) (dummy-left-dat_observe-box-a1_p1-1_b0 ))
)
(:action dummy-right-dat_observe-box-a1_p1-1_b0
 :parameters (?a - agent )
 :precondition 
(and (init-dat_observe-box-a1_p1-1_b0 ) (agent-at a1 p1-1) (Kbox-at b0 p1-1) (immediate-dummy-dat_observe-box-a1_p1-1_b0 ))
 :effect 
(and (not (init-dat_observe-box-a1_p1-1_b0 )) (not (immediate-dummy-dat_observe-box-a1_p1-1_b0 )) (dummy-right-dat_observe-box-a1_p1-1_b0 ))
)
(:action act-9h4_obs-go1-a2_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-dat_observe-box-a1_p1-1_b0 ) (KNbox-at b0 p1-1))
 :effect 
(and (pre-9h4_obs-go1-a2_a3 ) (observe-joint-push-go1 ))
)
(:action act-67a_observe-box-a3_p3-1_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (pre-9h4_obs-go1-a2_a3 ) (immediate-dummy-67a_observe-box-a3_p3-1_b2 ) (agent-at a1 p3-1) (box-at b2 p3-1))
 :effect 
(and (Kbox-at b2 p3-1))
)
(:action act-67a_observe-box-a3_p3-1_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (pre-9h4_obs-go1-a2_a3 ) (immediate-dummy-67a_observe-box-a3_p3-1_b2 ) (agent-at a1 p3-1) (not (box-at b2 p3-1)))
 :effect 
(and (KNbox-at b2 p3-1))
)
(:action act-dummy-67a_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-9h4_obs-go1-a2_a3 ) (observe-joint-push-go1 ) (agent-at a1 p3-1))
 :effect (immediate-dummy-67a_observe-box-a3_p3-1_b2 )
)
(:action dummy-left-67a_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-9h4_obs-go1-a2_a3 ) (observe-joint-push-go1 ) (agent-at a1 p3-1) (KNbox-at b2 p3-1) (immediate-dummy-67a_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (immediate-dummy-67a_observe-box-a3_p3-1_b2 )) (dummy-left-67a_observe-box-a3_p3-1_b2 ))
)
(:action dummy-right-67a_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-9h4_obs-go1-a2_a3 ) (observe-joint-push-go1 ) (agent-at a1 p3-1) (Kbox-at b2 p3-1) (immediate-dummy-67a_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (immediate-dummy-67a_observe-box-a3_p3-1_b2 )) (dummy-right-67a_observe-box-a3_p3-1_b2 ))
)
(:action act-ruz_observe-box-a1_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-67a_observe-box-a3_p3-1_b2 ) (immediate-dummy-ruz_observe-box-a1_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-ruz_observe-box-a1_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-67a_observe-box-a3_p3-1_b2 ) (immediate-dummy-ruz_observe-box-a1_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-ruz_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-67a_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2))
 :effect (immediate-dummy-ruz_observe-box-a1_p2-2_b1 )
)
(:action dummy-left-ruz_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-67a_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-ruz_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-ruz_observe-box-a1_p2-2_b1 )) (dummy-left-ruz_observe-box-a1_p2-2_b1 ))
)
(:action dummy-right-ruz_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-67a_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-ruz_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-ruz_observe-box-a1_p2-2_b1 )) (dummy-right-ruz_observe-box-a1_p2-2_b1 ))
)
(:action act-8d4_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-ruz_observe-box-a1_p2-2_b1 ) (KNbox-at b1 p2-2) (KNbox-at b2 p3-1) (agent-at a1 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-8d4_joint-push_p2-1_p2-2_b1_a1_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action goal-achieve-8d4_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition (pre-8d4_joint-push_p2-1_p2-2_b1_a1_a3 )
 :effect (done-goal )
)
(:action goal-achieve-right-ruz_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-ruz_observe-box-a1_p2-2_b1 ) (Kbox-at b1 p2-2) (KNbox-at b2 p3-1))
 :effect (done-goal )
)
(:action act-o7q_observe-box-a1_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-right-67a_observe-box-a3_p3-1_b2 ) (immediate-dummy-o7q_observe-box-a1_p2-2_b1 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-o7q_observe-box-a1_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-right-67a_observe-box-a3_p3-1_b2 ) (immediate-dummy-o7q_observe-box-a1_p2-2_b1 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-o7q_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-67a_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2))
 :effect (immediate-dummy-o7q_observe-box-a1_p2-2_b1 )
)
(:action dummy-left-o7q_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-67a_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-o7q_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-o7q_observe-box-a1_p2-2_b1 )) (dummy-left-o7q_observe-box-a1_p2-2_b1 ))
)
(:action dummy-right-o7q_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-67a_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-o7q_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-o7q_observe-box-a1_p2-2_b1 )) (dummy-right-o7q_observe-box-a1_p2-2_b1 ))
)
(:action act-9io_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-o7q_observe-box-a1_p2-2_b1 ) (KNbox-at b1 p2-2) (Kbox-at b2 p3-1) (agent-at a1 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-9io_joint-push_p2-1_p2-2_b1_a1_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action act-se3_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (pre-9io_joint-push_p2-1_p2-2_b1_a1_a3 ) (agent-at a1 p3-1) (Kbox-at b2 p3-1))
 :effect 
(and (pre-se3_joint-push_p3-1_p3-2_b2_a1_a3 ) (KNbox-at b2 p3-1) (Kbox-at b2 p3-2))
)
(:action goal-achieve-se3_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition (pre-se3_joint-push_p3-1_p3-2_b2_a1_a3 )
 :effect (done-goal )
)
(:action act-kmz_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-o7q_observe-box-a1_p2-2_b1 ) (Kbox-at b1 p2-2) (Kbox-at b2 p3-1) (agent-at a1 p3-1))
 :effect 
(and (pre-kmz_joint-push_p3-1_p3-2_b2_a1_a3 ) (KNbox-at b2 p3-1) (Kbox-at b2 p3-2))
)
(:action goal-achieve-kmz_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition (pre-kmz_joint-push_p3-1_p3-2_b2_a1_a3 )
 :effect (done-goal )
)
(:action act-4uo_push_p1-1_p1-2_b0_a1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-dat_observe-box-a1_p1-1_b0 ) (Kbox-at b0 p1-1) (agent-at a1 p1-1))
 :effect 
(and (pre-4uo_push_p1-1_p1-2_b0_a1 ) (KNbox-at b0 p1-1) (Kbox-at b0 p1-2))
)
(:action act-jnj_observe-box-a3_p3-1_b2T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (pre-4uo_push_p1-1_p1-2_b0_a1 ) (immediate-dummy-jnj_observe-box-a3_p3-1_b2 ) (agent-at a1 p3-1) (box-at b2 p3-1))
 :effect 
(and (Kbox-at b2 p3-1))
)
(:action act-jnj_observe-box-a3_p3-1_b2F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b2 p3-1)) (not (KNbox-at b2 p3-1)) (pre-4uo_push_p1-1_p1-2_b0_a1 ) (immediate-dummy-jnj_observe-box-a3_p3-1_b2 ) (agent-at a1 p3-1) (not (box-at b2 p3-1)))
 :effect 
(and (KNbox-at b2 p3-1))
)
(:action act-dummy-jnj_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-4uo_push_p1-1_p1-2_b0_a1 ) (observe-joint-push-go1 ) (agent-at a1 p3-1))
 :effect (immediate-dummy-jnj_observe-box-a3_p3-1_b2 )
)
(:action dummy-left-jnj_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-4uo_push_p1-1_p1-2_b0_a1 ) (observe-joint-push-go1 ) (agent-at a1 p3-1) (KNbox-at b2 p3-1) (immediate-dummy-jnj_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (immediate-dummy-jnj_observe-box-a3_p3-1_b2 )) (dummy-left-jnj_observe-box-a3_p3-1_b2 ))
)
(:action dummy-right-jnj_observe-box-a3_p3-1_b2
 :parameters (?a - agent )
 :precondition 
(and (pre-4uo_push_p1-1_p1-2_b0_a1 ) (observe-joint-push-go1 ) (agent-at a1 p3-1) (Kbox-at b2 p3-1) (immediate-dummy-jnj_observe-box-a3_p3-1_b2 ))
 :effect 
(and (not (immediate-dummy-jnj_observe-box-a3_p3-1_b2 )) (dummy-right-jnj_observe-box-a3_p3-1_b2 ))
)
(:action act-oj0_observe-box-a1_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-jnj_observe-box-a3_p3-1_b2 ) (immediate-dummy-oj0_observe-box-a1_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-oj0_observe-box-a1_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-left-jnj_observe-box-a3_p3-1_b2 ) (immediate-dummy-oj0_observe-box-a1_p2-2_b1 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-oj0_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-jnj_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2))
 :effect (immediate-dummy-oj0_observe-box-a1_p2-2_b1 )
)
(:action dummy-left-oj0_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-jnj_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-oj0_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-oj0_observe-box-a1_p2-2_b1 )) (dummy-left-oj0_observe-box-a1_p2-2_b1 ))
)
(:action dummy-right-oj0_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-jnj_observe-box-a3_p3-1_b2 ) (KNbox-at b2 p3-1) (agent-at a1 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-oj0_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-oj0_observe-box-a1_p2-2_b1 )) (dummy-right-oj0_observe-box-a1_p2-2_b1 ))
)
(:action act-6up_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-oj0_observe-box-a1_p2-2_b1 ) (KNbox-at b1 p2-2) (KNbox-at b2 p3-1) (agent-at a1 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-6up_joint-push_p2-1_p2-2_b1_a1_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action goal-achieve-6up_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition (pre-6up_joint-push_p2-1_p2-2_b1_a1_a3 )
 :effect (done-goal )
)
(:action goal-achieve-right-oj0_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-oj0_observe-box-a1_p2-2_b1 ) (Kbox-at b1 p2-2) (KNbox-at b2 p3-1))
 :effect (done-goal )
)
(:action act-8bc_observe-box-a1_p2-2_b1T
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-right-jnj_observe-box-a3_p3-1_b2 ) (immediate-dummy-8bc_observe-box-a1_p2-2_b1 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (box-at b1 p2-2))
 :effect 
(and (Kbox-at b1 p2-2))
)
(:action act-8bc_observe-box-a1_p2-2_b1F
 :parameters (?a - agent )
 :precondition 
(and (not (Kbox-at b1 p2-2)) (not (KNbox-at b1 p2-2)) (dummy-right-jnj_observe-box-a3_p3-1_b2 ) (immediate-dummy-8bc_observe-box-a1_p2-2_b1 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (not (box-at b1 p2-2)))
 :effect 
(and (KNbox-at b1 p2-2))
)
(:action act-dummy-8bc_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-jnj_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2))
 :effect (immediate-dummy-8bc_observe-box-a1_p2-2_b1 )
)
(:action dummy-left-8bc_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-jnj_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (KNbox-at b1 p2-2) (immediate-dummy-8bc_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-8bc_observe-box-a1_p2-2_b1 )) (dummy-left-8bc_observe-box-a1_p2-2_b1 ))
)
(:action dummy-right-8bc_observe-box-a1_p2-2_b1
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-jnj_observe-box-a3_p3-1_b2 ) (Kbox-at b2 p3-1) (agent-at a1 p2-2) (Kbox-at b1 p2-2) (immediate-dummy-8bc_observe-box-a1_p2-2_b1 ))
 :effect 
(and (not (immediate-dummy-8bc_observe-box-a1_p2-2_b1 )) (dummy-right-8bc_observe-box-a1_p2-2_b1 ))
)
(:action act-pky_joint-push_p2-1_p2-2_b1_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-left-8bc_observe-box-a1_p2-2_b1 ) (KNbox-at b1 p2-2) (Kbox-at b2 p3-1) (agent-at a1 p2-1) (Kbox-at b1 p2-1))
 :effect 
(and (pre-pky_joint-push_p2-1_p2-2_b1_a1_a3 ) (KNbox-at b1 p2-1) (Kbox-at b1 p2-2))
)
(:action act-55u_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (pre-pky_joint-push_p2-1_p2-2_b1_a1_a3 ) (agent-at a1 p3-1) (Kbox-at b2 p3-1))
 :effect 
(and (pre-55u_joint-push_p3-1_p3-2_b2_a1_a3 ) (KNbox-at b2 p3-1) (Kbox-at b2 p3-2))
)
(:action goal-achieve-55u_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition (pre-55u_joint-push_p3-1_p3-2_b2_a1_a3 )
 :effect (done-goal )
)
(:action act-c09_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition 
(and (dummy-right-8bc_observe-box-a1_p2-2_b1 ) (Kbox-at b1 p2-2) (Kbox-at b2 p3-1) (agent-at a1 p3-1))
 :effect 
(and (pre-c09_joint-push_p3-1_p3-2_b2_a1_a3 ) (KNbox-at b2 p3-1) (Kbox-at b2 p3-2))
)
(:action goal-achieve-c09_joint-push_p3-1_p3-2_b2_a1_a3
 :parameters (?a - agent )
 :precondition (pre-c09_joint-push_p3-1_p3-2_b2_a1_a3 )
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
