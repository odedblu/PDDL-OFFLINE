(define (domain box-3-a2)
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
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-d8c_observe-box_p1-1_a1_b0)
	(immediate-dummy-d8c_observe-box_p1-1_a1_b0)
	(dummy-left-d8c_observe-box_p1-1_a1_b0)
	(immediate-dummy-ap7_observe-box_p3-1_a3_b2)
	(dummy-left-ap7_observe-box_p3-1_a3_b2)
	(immediate-dummy-mfo_observe-box_p2-2_a3_b1)
	(dummy-left-mfo_observe-box_p2-2_a3_b1)
	(pre-g3v_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-mfo_observe-box_p2-2_a3_b1)
	(dummy-right-ap7_observe-box_p3-1_a3_b2)
	(immediate-dummy-qfl_observe-box_p2-2_a2_b1)
	(dummy-left-qfl_observe-box_p2-2_a2_b1)
	(pre-2ez_joint-push_p2-1_p2-2_b1_a2_a3)
	(pre-3mu_joint-push_p3-1_p3-2_b2_a2_a3)
	(dummy-right-qfl_observe-box_p2-2_a2_b1)
	(pre-if8_joint-push_p3-1_p3-2_b2_a2_a3)
	(dummy-right-d8c_observe-box_p1-1_a1_b0)
	(pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)
	(immediate-dummy-jqi_observe-box_p3-1_a3_b2)
	(dummy-left-jqi_observe-box_p3-1_a3_b2)
	(immediate-dummy-k3l_observe-box_p2-2_a3_b1)
	(dummy-left-k3l_observe-box_p2-2_a3_b1)
	(pre-45g_joint-push_p2-1_p2-2_b1_a2_a3)
	(dummy-right-k3l_observe-box_p2-2_a3_b1)
	(dummy-right-jqi_observe-box_p3-1_a3_b2)
	(immediate-dummy-w81_observe-box_p2-2_a2_b1)
	(dummy-left-w81_observe-box_p2-2_a2_b1)
	(pre-rp7_joint-push_p2-1_p2-2_b1_a2_a3)
	(pre-pfh_joint-push_p3-1_p3-2_b2_a2_a3)
	(dummy-right-w81_observe-box_p2-2_a2_b1)
	(pre-h31_joint-push_p3-1_p3-2_b2_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-d8c_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-d8c_observe-box_p1-1_a1_b0)(immediate-dummy-d8c_observe-box_p1-1_a1_b0)(agent-at a2 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-d8c_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-d8c_observe-box_p1-1_a1_b0))
	:effect (and (immediate-dummy-d8c_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-d8c_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-d8c_observe-box_p1-1_a1_b0)(agent-at a2 p1-1)(not (box-at b0 p1-1))(immediate-dummy-d8c_observe-box_p1-1_a1_b0))
	:effect (and (not (init-d8c_observe-box_p1-1_a1_b0))(not (immediate-dummy-d8c_observe-box_p1-1_a1_b0))(dummy-left-d8c_observe-box_p1-1_a1_b0))
)
(:action dummy-right-d8c_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-d8c_observe-box_p1-1_a1_b0)(agent-at a2 p1-1)(box-at b0 p1-1)(immediate-dummy-d8c_observe-box_p1-1_a1_b0))
	:effect (and (not (init-d8c_observe-box_p1-1_a1_b0))(not (immediate-dummy-d8c_observe-box_p1-1_a1_b0))(dummy-right-d8c_observe-box_p1-1_a1_b0))
)
(:action act-ap7_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-d8c_observe-box_p1-1_a1_b0)(immediate-dummy-ap7_observe-box_p3-1_a3_b2)(not (box-at b0 p1-1))(agent-at a2 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-ap7_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-d8c_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p3-1))
	:effect (and (immediate-dummy-ap7_observe-box_p3-1_a3_b2) )
)
(:action dummy-left-ap7_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-d8c_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p3-1)(not (box-at b2 p3-1))(immediate-dummy-ap7_observe-box_p3-1_a3_b2))
	:effect (and (not (immediate-dummy-ap7_observe-box_p3-1_a3_b2))(dummy-left-ap7_observe-box_p3-1_a3_b2))
)
(:action dummy-right-ap7_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-d8c_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p3-1)(box-at b2 p3-1)(immediate-dummy-ap7_observe-box_p3-1_a3_b2))
	:effect (and (not (immediate-dummy-ap7_observe-box_p3-1_a3_b2))(dummy-right-ap7_observe-box_p3-1_a3_b2))
)
(:action act-mfo_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ap7_observe-box_p3-1_a3_b2)(immediate-dummy-mfo_observe-box_p2-2_a3_b1)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-mfo_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ap7_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:effect (and (immediate-dummy-mfo_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-mfo_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ap7_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-mfo_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-mfo_observe-box_p2-2_a3_b1))(dummy-left-mfo_observe-box_p2-2_a3_b1))
)
(:action dummy-right-mfo_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ap7_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(not (box-at b0 p1-1))(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-mfo_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-mfo_observe-box_p2-2_a3_b1))(dummy-right-mfo_observe-box_p2-2_a3_b1))
)
(:action act-g3v_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-mfo_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-g3v_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-g3v_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-g3v_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-mfo_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-mfo_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b2 p3-1))(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-qfl_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ap7_observe-box_p3-1_a3_b2)(immediate-dummy-qfl_observe-box_p2-2_a2_b1)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-qfl_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ap7_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:effect (and (immediate-dummy-qfl_observe-box_p2-2_a2_b1) )
)
(:action dummy-left-qfl_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ap7_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-qfl_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-qfl_observe-box_p2-2_a2_b1))(dummy-left-qfl_observe-box_p2-2_a2_b1))
)
(:action dummy-right-qfl_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ap7_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(not (box-at b0 p1-1))(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-qfl_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-qfl_observe-box_p2-2_a2_b1))(dummy-right-qfl_observe-box_p2-2_a2_b1))
)
(:action act-2ez_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-qfl_observe-box_p2-2_a2_b1)(not (box-at b1 p2-2))(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-2ez_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-3mu_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-2ez_joint-push_p2-1_p2-2_b1_a2_a3)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-3mu_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-3mu_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-3mu_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-if8_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-qfl_observe-box_p2-2_a2_b1)(box-at b1 p2-2)(box-at b2 p3-1)(not (box-at b0 p1-1))(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-if8_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-if8_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-if8_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-6rw_joint-push_p1-1_p1-2_b0_a1_a2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-d8c_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a2 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action act-jqi_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(immediate-dummy-jqi_observe-box_p3-1_a3_b2)(agent-at a2 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-jqi_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(agent-at a2 p3-1))
	:effect (and (immediate-dummy-jqi_observe-box_p3-1_a3_b2) )
)
(:action dummy-left-jqi_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(agent-at a2 p3-1)(not (box-at b2 p3-1))(immediate-dummy-jqi_observe-box_p3-1_a3_b2))
	:effect (and (not (immediate-dummy-jqi_observe-box_p3-1_a3_b2))(dummy-left-jqi_observe-box_p3-1_a3_b2))
)
(:action dummy-right-jqi_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-6rw_joint-push_p1-1_p1-2_b0_a1_a2)(agent-at a2 p3-1)(box-at b2 p3-1)(immediate-dummy-jqi_observe-box_p3-1_a3_b2))
	:effect (and (not (immediate-dummy-jqi_observe-box_p3-1_a3_b2))(dummy-right-jqi_observe-box_p3-1_a3_b2))
)
(:action act-k3l_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jqi_observe-box_p3-1_a3_b2)(immediate-dummy-k3l_observe-box_p2-2_a3_b1)(not (box-at b2 p3-1))(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-k3l_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jqi_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a2 p2-2))
	:effect (and (immediate-dummy-k3l_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-k3l_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jqi_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-k3l_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-k3l_observe-box_p2-2_a3_b1))(dummy-left-k3l_observe-box_p2-2_a3_b1))
)
(:action dummy-right-k3l_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jqi_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-k3l_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-k3l_observe-box_p2-2_a3_b1))(dummy-right-k3l_observe-box_p2-2_a3_b1))
)
(:action act-45g_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-k3l_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-45g_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-45g_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-45g_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-k3l_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-k3l_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-w81_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jqi_observe-box_p3-1_a3_b2)(immediate-dummy-w81_observe-box_p2-2_a2_b1)(box-at b2 p3-1)(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-w81_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jqi_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a2 p2-2))
	:effect (and (immediate-dummy-w81_observe-box_p2-2_a2_b1) )
)
(:action dummy-left-w81_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jqi_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-w81_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-w81_observe-box_p2-2_a2_b1))(dummy-left-w81_observe-box_p2-2_a2_b1))
)
(:action dummy-right-w81_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jqi_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-w81_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-w81_observe-box_p2-2_a2_b1))(dummy-right-w81_observe-box_p2-2_a2_b1))
)
(:action act-rp7_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-w81_observe-box_p2-2_a2_b1)(not (box-at b1 p2-2))(box-at b2 p3-1)(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-rp7_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-pfh_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-rp7_joint-push_p2-1_p2-2_b1_a2_a3)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-pfh_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-pfh_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-pfh_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-h31_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-w81_observe-box_p2-2_a2_b1)(box-at b1 p2-2)(box-at b2 p3-1)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-h31_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-h31_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-h31_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
)