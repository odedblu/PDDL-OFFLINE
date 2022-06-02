(define (domain box-3-a1)
(:types pos agent box push )
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
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(c-p-joint-push-a0g )
	(observe-joint-push-a0g )
	(init-7q1_obs-a0g-a1-a2-a3_a3)
	(pre-7q1_obs-a0g-a1-a2-a3_a3)
	(immediate-dummy-9zs_observe-box-a1_p1-1_b0)
	(dummy-left-9zs_observe-box-a1_p1-1_b0)
	(immediate-dummy-5z7_observe-box-a3_p3-1_b2)
	(dummy-left-5z7_observe-box-a3_p3-1_b2)
	(immediate-dummy-imf_observe-box-a3_p2-2_b1)
	(dummy-left-imf_observe-box-a3_p2-2_b1)
	(pre-p2h_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-imf_observe-box-a3_p2-2_b1)
	(dummy-right-5z7_observe-box-a3_p3-1_b2)
	(immediate-dummy-hry_observe-box-a1_p2-1_b1)
	(dummy-left-hry_observe-box-a1_p2-1_b1)
	(pre-13u_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-hry_observe-box-a1_p2-1_b1)
	(pre-w3a_joint-push_p2-1_p2-2_b1_a1_a3)
	(pre-wj0_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-9zs_observe-box-a1_p1-1_b0)
	(pre-2rz_push_p1-1_p1-2_b0_a1)
	(immediate-dummy-hjd_observe-box-a1_p2-1_b1)
	(dummy-left-hjd_observe-box-a1_p2-1_b1)
	(immediate-dummy-4kb_observe-box-a1_p3-1_b2)
	(dummy-left-4kb_observe-box-a1_p3-1_b2)
	(dummy-right-4kb_observe-box-a1_p3-1_b2)
	(pre-wm8_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-hjd_observe-box-a1_p2-1_b1)
	(immediate-dummy-lnn_observe-box-a3_p3-1_b2)
	(dummy-left-lnn_observe-box-a3_p3-1_b2)
	(pre-b09_joint-push_p2-1_p2-2_b1_a1_a3)
	(dummy-right-lnn_observe-box-a3_p3-1_b2)
	(pre-clh_joint-push_p2-1_p2-2_b1_a1_a3)
	(pre-fag_joint-push_p3-1_p3-2_b2_a1_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-7q1_obs-a0g-a1-a2-a3_a3
	:parameters ( ?a - agent )
	:precondition (and (init-7q1_obs-a0g-a1-a2-a3_a3))
	:effect (and (pre-7q1_obs-a0g-a1-a2-a3_a3)(observe-joint-push-a0g ))
)
(:action act-9zs_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-7q1_obs-a0g-a1-a2-a3_a3)(immediate-dummy-9zs_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-9zs_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-7q1_obs-a0g-a1-a2-a3_a3)(pre-7q1_obs-a0g-a1-a2-a3_a3)(agent-at a1 p1-1))
	:effect (and (immediate-dummy-9zs_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-9zs_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-7q1_obs-a0g-a1-a2-a3_a3)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-9zs_observe-box-a1_p1-1_b0))
	:effect (and (not (immediate-dummy-9zs_observe-box-a1_p1-1_b0))(dummy-left-9zs_observe-box-a1_p1-1_b0))
)
(:action dummy-right-9zs_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-7q1_obs-a0g-a1-a2-a3_a3)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-9zs_observe-box-a1_p1-1_b0))
	:effect (and (not (immediate-dummy-9zs_observe-box-a1_p1-1_b0))(dummy-right-9zs_observe-box-a1_p1-1_b0))
)
(:action act-5z7_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9zs_observe-box-a1_p1-1_b0)(immediate-dummy-5z7_observe-box-a3_p3-1_b2)(not (box-at b0 p1-1))(agent-at a1 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-5z7_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9zs_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p3-1))
	:effect (and (immediate-dummy-5z7_observe-box-a3_p3-1_b2) )
)
(:action dummy-left-5z7_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9zs_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p3-1)(not (box-at b2 p3-1))(immediate-dummy-5z7_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-5z7_observe-box-a3_p3-1_b2))(dummy-left-5z7_observe-box-a3_p3-1_b2))
)
(:action dummy-right-5z7_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9zs_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p3-1)(box-at b2 p3-1)(immediate-dummy-5z7_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-5z7_observe-box-a3_p3-1_b2))(dummy-right-5z7_observe-box-a3_p3-1_b2))
)
(:action act-imf_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-5z7_observe-box-a3_p3-1_b2)(immediate-dummy-imf_observe-box-a3_p2-2_b1)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a1 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-imf_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-5z7_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p2-2))
	:effect (and (immediate-dummy-imf_observe-box-a3_p2-2_b1) )
)
(:action dummy-left-imf_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-5z7_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p2-2)(not (box-at b1 p2-2))(immediate-dummy-imf_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-imf_observe-box-a3_p2-2_b1))(dummy-left-imf_observe-box-a3_p2-2_b1))
)
(:action dummy-right-imf_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-5z7_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a1 p2-2)(box-at b1 p2-2)(immediate-dummy-imf_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-imf_observe-box-a3_p2-2_b1))(dummy-right-imf_observe-box-a3_p2-2_b1))
)
(:action act-p2h_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-imf_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-p2h_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-p2h_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-p2h_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-imf_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-imf_observe-box-a3_p2-2_b1)(box-at b1 p2-2)(not (box-at b2 p3-1))(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-hry_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-5z7_observe-box-a3_p3-1_b2)(immediate-dummy-hry_observe-box-a1_p2-1_b1)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a1 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-hry_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-5z7_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a1 p2-1))
	:effect (and (immediate-dummy-hry_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-hry_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-5z7_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a1 p2-1)(not (box-at b1 p2-1))(immediate-dummy-hry_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-hry_observe-box-a1_p2-1_b1))(dummy-left-hry_observe-box-a1_p2-1_b1))
)
(:action dummy-right-hry_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-5z7_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a1 p2-1)(box-at b1 p2-1)(immediate-dummy-hry_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-hry_observe-box-a1_p2-1_b1))(dummy-right-hry_observe-box-a1_p2-1_b1))
)
(:action act-13u_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hry_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p3-1 p3-2)(agent-at a1 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-13u_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-13u_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-13u_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-w3a_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hry_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-w3a_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-wj0_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-w3a_joint-push_p2-1_p2-2_b1_a1_a3)(adj p3-1 p3-2)(agent-at a1 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-wj0_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-wj0_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-wj0_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-2rz_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-9zs_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-2rz_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action act-hjd_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-2rz_push_p1-1_p1-2_b0_a1)(immediate-dummy-hjd_observe-box-a1_p2-1_b1)(agent-at a1 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-hjd_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-2rz_push_p1-1_p1-2_b0_a1)(pre-2rz_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1))
	:effect (and (immediate-dummy-hjd_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-hjd_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-2rz_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1)(not (box-at b1 p2-1))(immediate-dummy-hjd_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-hjd_observe-box-a1_p2-1_b1))(dummy-left-hjd_observe-box-a1_p2-1_b1))
)
(:action dummy-right-hjd_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-2rz_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1)(box-at b1 p2-1)(immediate-dummy-hjd_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-hjd_observe-box-a1_p2-1_b1))(dummy-right-hjd_observe-box-a1_p2-1_b1))
)
(:action act-4kb_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hjd_observe-box-a1_p2-1_b1)(immediate-dummy-4kb_observe-box-a1_p3-1_b2)(not (box-at b1 p2-1))(agent-at a1 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-4kb_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hjd_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(agent-at a1 p3-1))
	:effect (and (immediate-dummy-4kb_observe-box-a1_p3-1_b2) )
)
(:action dummy-left-4kb_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hjd_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(agent-at a1 p3-1)(not (box-at b2 p3-1))(immediate-dummy-4kb_observe-box-a1_p3-1_b2))
	:effect (and (not (immediate-dummy-4kb_observe-box-a1_p3-1_b2))(dummy-left-4kb_observe-box-a1_p3-1_b2))
)
(:action dummy-right-4kb_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hjd_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(agent-at a1 p3-1)(box-at b2 p3-1)(immediate-dummy-4kb_observe-box-a1_p3-1_b2))
	:effect (and (not (immediate-dummy-4kb_observe-box-a1_p3-1_b2))(dummy-right-4kb_observe-box-a1_p3-1_b2))
)
(:action goal-achieve-left-4kb_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4kb_observe-box-a1_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b1 p2-1)))
	:effect (and (done-goal))
)
(:action act-wm8_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-4kb_observe-box-a1_p3-1_b2)(box-at b2 p3-1)(not (box-at b1 p2-1))(adj p3-1 p3-2)(agent-at a1 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-wm8_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-wm8_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-wm8_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-lnn_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hjd_observe-box-a1_p2-1_b1)(immediate-dummy-lnn_observe-box-a3_p3-1_b2)(box-at b1 p2-1)(agent-at a1 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-lnn_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hjd_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(observe-joint-push-a0g )(agent-at a1 p3-1))
	:effect (and (immediate-dummy-lnn_observe-box-a3_p3-1_b2) )
)
(:action dummy-left-lnn_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hjd_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(observe-joint-push-a0g )(agent-at a1 p3-1)(not (box-at b2 p3-1))(immediate-dummy-lnn_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-lnn_observe-box-a3_p3-1_b2))(dummy-left-lnn_observe-box-a3_p3-1_b2))
)
(:action dummy-right-lnn_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hjd_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(observe-joint-push-a0g )(agent-at a1 p3-1)(box-at b2 p3-1)(immediate-dummy-lnn_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-lnn_observe-box-a3_p3-1_b2))(dummy-right-lnn_observe-box-a3_p3-1_b2))
)
(:action act-b09_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-lnn_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-b09_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-b09_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-b09_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action act-clh_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-lnn_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-clh_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-fag_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-clh_joint-push_p2-1_p2-2_b1_a1_a3)(adj p3-1 p3-2)(agent-at a1 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-fag_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-fag_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-fag_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
)