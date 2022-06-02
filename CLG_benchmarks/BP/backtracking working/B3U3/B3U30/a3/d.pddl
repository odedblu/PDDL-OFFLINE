(define (domain box-3-a3)
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
	a3 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(c-p-joint-push-a0g )
	(observe-joint-push-a0g )
	(init-3kx_obs-a0g-a1-a2-a3_a3)
	(pre-3kx_obs-a0g-a1-a2-a3_a3)
	(immediate-dummy-0mp_observe-box-a1_p1-1_b0)
	(dummy-left-0mp_observe-box-a1_p1-1_b0)
	(immediate-dummy-2ch_observe-box-a3_p3-1_b2)
	(dummy-left-2ch_observe-box-a3_p3-1_b2)
	(immediate-dummy-iac_observe-box-a3_p2-2_b1)
	(dummy-left-iac_observe-box-a3_p2-2_b1)
	(pre-cur_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-iac_observe-box-a3_p2-2_b1)
	(dummy-right-2ch_observe-box-a3_p3-1_b2)
	(immediate-dummy-gue_observe-box-a1_p2-1_b1)
	(dummy-left-gue_observe-box-a1_p2-1_b1)
	(pre-0qp_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-gue_observe-box-a1_p2-1_b1)
	(pre-huc_joint-push_p2-1_p2-2_b1_a1_a3)
	(pre-bu7_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-0mp_observe-box-a1_p1-1_b0)
	(immediate-dummy-txr_observe-box-a1_p2-1_b1)
	(dummy-left-txr_observe-box-a1_p2-1_b1)
	(immediate-dummy-snv_observe-box-a1_p3-1_b2)
	(dummy-left-snv_observe-box-a1_p3-1_b2)
	(dummy-right-snv_observe-box-a1_p3-1_b2)
	(pre-caa_joint-push_p3-1_p3-2_b2_a1_a3)
	(dummy-right-txr_observe-box-a1_p2-1_b1)
	(immediate-dummy-o5a_observe-box-a3_p3-1_b2)
	(dummy-left-o5a_observe-box-a3_p3-1_b2)
	(pre-stk_joint-push_p2-1_p2-2_b1_a1_a3)
	(dummy-right-o5a_observe-box-a3_p3-1_b2)
	(pre-f3z_joint-push_p2-1_p2-2_b1_a1_a3)
	(pre-691_joint-push_p3-1_p3-2_b2_a1_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-3kx_obs-a0g-a1-a2-a3_a3
	:parameters ( ?a - agent )
	:precondition (and (init-3kx_obs-a0g-a1-a2-a3_a3))
	:effect (and (pre-3kx_obs-a0g-a1-a2-a3_a3)(observe-joint-push-a0g ))
)
(:action act-0mp_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-3kx_obs-a0g-a1-a2-a3_a3)(immediate-dummy-0mp_observe-box-a1_p1-1_b0)(agent-at a3 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-0mp_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-3kx_obs-a0g-a1-a2-a3_a3)(pre-3kx_obs-a0g-a1-a2-a3_a3)(agent-at a3 p1-1))
	:effect (and (immediate-dummy-0mp_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-0mp_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-3kx_obs-a0g-a1-a2-a3_a3)(agent-at a3 p1-1)(not (box-at b0 p1-1))(immediate-dummy-0mp_observe-box-a1_p1-1_b0))
	:effect (and (not (immediate-dummy-0mp_observe-box-a1_p1-1_b0))(dummy-left-0mp_observe-box-a1_p1-1_b0))
)
(:action dummy-right-0mp_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-3kx_obs-a0g-a1-a2-a3_a3)(agent-at a3 p1-1)(box-at b0 p1-1)(immediate-dummy-0mp_observe-box-a1_p1-1_b0))
	:effect (and (not (immediate-dummy-0mp_observe-box-a1_p1-1_b0))(dummy-right-0mp_observe-box-a1_p1-1_b0))
)
(:action act-2ch_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-0mp_observe-box-a1_p1-1_b0)(immediate-dummy-2ch_observe-box-a3_p3-1_b2)(not (box-at b0 p1-1))(agent-at a3 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-2ch_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-0mp_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p3-1))
	:effect (and (immediate-dummy-2ch_observe-box-a3_p3-1_b2) )
)
(:action dummy-left-2ch_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-0mp_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p3-1)(not (box-at b2 p3-1))(immediate-dummy-2ch_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-2ch_observe-box-a3_p3-1_b2))(dummy-left-2ch_observe-box-a3_p3-1_b2))
)
(:action dummy-right-2ch_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-0mp_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p3-1)(box-at b2 p3-1)(immediate-dummy-2ch_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-2ch_observe-box-a3_p3-1_b2))(dummy-right-2ch_observe-box-a3_p3-1_b2))
)
(:action act-iac_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2ch_observe-box-a3_p3-1_b2)(immediate-dummy-iac_observe-box-a3_p2-2_b1)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-iac_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2ch_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p2-2))
	:effect (and (immediate-dummy-iac_observe-box-a3_p2-2_b1) )
)
(:action dummy-left-iac_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2ch_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-iac_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-iac_observe-box-a3_p2-2_b1))(dummy-left-iac_observe-box-a3_p2-2_b1))
)
(:action dummy-right-iac_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2ch_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(observe-joint-push-a0g )(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-iac_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-iac_observe-box-a3_p2-2_b1))(dummy-right-iac_observe-box-a3_p2-2_b1))
)
(:action act-cur_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-iac_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-cur_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-cur_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-cur_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-iac_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-iac_observe-box-a3_p2-2_b1)(box-at b1 p2-2)(not (box-at b2 p3-1))(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-gue_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2ch_observe-box-a3_p3-1_b2)(immediate-dummy-gue_observe-box-a1_p2-1_b1)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a3 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-gue_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2ch_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a3 p2-1))
	:effect (and (immediate-dummy-gue_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-gue_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2ch_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a3 p2-1)(not (box-at b1 p2-1))(immediate-dummy-gue_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-gue_observe-box-a1_p2-1_b1))(dummy-left-gue_observe-box-a1_p2-1_b1))
)
(:action dummy-right-gue_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2ch_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a3 p2-1)(box-at b1 p2-1)(immediate-dummy-gue_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-gue_observe-box-a1_p2-1_b1))(dummy-right-gue_observe-box-a1_p2-1_b1))
)
(:action act-0qp_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-gue_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-0qp_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-0qp_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-0qp_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-huc_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-gue_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-huc_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-bu7_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-huc_joint-push_p2-1_p2-2_b1_a1_a3)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-bu7_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-bu7_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-bu7_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-txr_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-0mp_observe-box-a1_p1-1_b0)(immediate-dummy-txr_observe-box-a1_p2-1_b1)(box-at b0 p1-1)(agent-at a3 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-txr_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-0mp_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(agent-at a3 p2-1))
	:effect (and (immediate-dummy-txr_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-txr_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-0mp_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(agent-at a3 p2-1)(not (box-at b1 p2-1))(immediate-dummy-txr_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-txr_observe-box-a1_p2-1_b1))(dummy-left-txr_observe-box-a1_p2-1_b1))
)
(:action dummy-right-txr_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-0mp_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(agent-at a3 p2-1)(box-at b1 p2-1)(immediate-dummy-txr_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-txr_observe-box-a1_p2-1_b1))(dummy-right-txr_observe-box-a1_p2-1_b1))
)
(:action act-snv_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-txr_observe-box-a1_p2-1_b1)(immediate-dummy-snv_observe-box-a1_p3-1_b2)(not (box-at b1 p2-1))(box-at b0 p1-1)(agent-at a3 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-snv_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-txr_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(box-at b0 p1-1)(agent-at a3 p3-1))
	:effect (and (immediate-dummy-snv_observe-box-a1_p3-1_b2) )
)
(:action dummy-left-snv_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-txr_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(box-at b0 p1-1)(agent-at a3 p3-1)(not (box-at b2 p3-1))(immediate-dummy-snv_observe-box-a1_p3-1_b2))
	:effect (and (not (immediate-dummy-snv_observe-box-a1_p3-1_b2))(dummy-left-snv_observe-box-a1_p3-1_b2))
)
(:action dummy-right-snv_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-txr_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(box-at b0 p1-1)(agent-at a3 p3-1)(box-at b2 p3-1)(immediate-dummy-snv_observe-box-a1_p3-1_b2))
	:effect (and (not (immediate-dummy-snv_observe-box-a1_p3-1_b2))(dummy-right-snv_observe-box-a1_p3-1_b2))
)
(:action goal-achieve-left-snv_observe-box-a1_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-snv_observe-box-a1_p3-1_b2)(not (box-at b2 p3-1))(not (box-at b1 p2-1))(box-at b0 p1-1))
	:effect (and (done-goal))
)
(:action act-caa_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-snv_observe-box-a1_p3-1_b2)(box-at b2 p3-1)(not (box-at b1 p2-1))(box-at b0 p1-1)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-caa_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-caa_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-caa_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
(:action act-o5a_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-txr_observe-box-a1_p2-1_b1)(immediate-dummy-o5a_observe-box-a3_p3-1_b2)(box-at b1 p2-1)(box-at b0 p1-1)(agent-at a3 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-o5a_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-txr_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(box-at b0 p1-1)(observe-joint-push-a0g )(agent-at a3 p3-1))
	:effect (and (immediate-dummy-o5a_observe-box-a3_p3-1_b2) )
)
(:action dummy-left-o5a_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-txr_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(box-at b0 p1-1)(observe-joint-push-a0g )(agent-at a3 p3-1)(not (box-at b2 p3-1))(immediate-dummy-o5a_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-o5a_observe-box-a3_p3-1_b2))(dummy-left-o5a_observe-box-a3_p3-1_b2))
)
(:action dummy-right-o5a_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-txr_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(box-at b0 p1-1)(observe-joint-push-a0g )(agent-at a3 p3-1)(box-at b2 p3-1)(immediate-dummy-o5a_observe-box-a3_p3-1_b2))
	:effect (and (not (immediate-dummy-o5a_observe-box-a3_p3-1_b2))(dummy-right-o5a_observe-box-a3_p3-1_b2))
)
(:action act-stk_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-o5a_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(box-at b1 p2-1)(box-at b0 p1-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-stk_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-stk_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-stk_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action act-f3z_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-o5a_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(box-at b1 p2-1)(box-at b0 p1-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-f3z_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-691_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-f3z_joint-push_p2-1_p2-2_b1_a1_a3)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-691_joint-push_p3-1_p3-2_b2_a1_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-691_joint-push_p3-1_p3-2_b2_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-691_joint-push_p3-1_p3-2_b2_a1_a3))
	:effect (and (done-goal))
)
)