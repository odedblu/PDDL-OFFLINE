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
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-ti9_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ti9_observe-box_p1-1_a1_b0)(immediate-dummy-ti9_observe-box_p1-1_a1_b0)(agent-at a3 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-ti9_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ti9_observe-box_p1-1_a1_b0))
	:effect (and (immediate-dummy-ti9_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-ti9_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ti9_observe-box_p1-1_a1_b0)(agent-at a3 p1-1)(not (box-at b0 p1-1))(immediate-dummy-ti9_observe-box_p1-1_a1_b0))
	:effect (and (not (init-ti9_observe-box_p1-1_a1_b0))(not (immediate-dummy-ti9_observe-box_p1-1_a1_b0))(dummy-left-ti9_observe-box_p1-1_a1_b0))
)
(:action dummy-right-ti9_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ti9_observe-box_p1-1_a1_b0)(agent-at a3 p1-1)(box-at b0 p1-1)(immediate-dummy-ti9_observe-box_p1-1_a1_b0))
	:effect (and (not (init-ti9_observe-box_p1-1_a1_b0))(not (immediate-dummy-ti9_observe-box_p1-1_a1_b0))(dummy-right-ti9_observe-box_p1-1_a1_b0))
)
(:action act-9md_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ti9_observe-box_p1-1_a1_b0)(immediate-dummy-9md_observe-box_p2-2_a3_b1)(not (box-at b0 p1-1))(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-9md_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ti9_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a3 p2-2))
	:effect (and (immediate-dummy-9md_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-9md_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ti9_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-9md_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-9md_observe-box_p2-2_a3_b1))(dummy-left-9md_observe-box_p2-2_a3_b1))
)
(:action dummy-right-9md_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ti9_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-9md_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-9md_observe-box_p2-2_a3_b1))(dummy-right-9md_observe-box_p2-2_a3_b1))
)
(:action act-6q6_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9md_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-6q6_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-6q6_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-6q6_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-9md_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-9md_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-5bj_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ti9_observe-box_p1-1_a1_b0)(immediate-dummy-5bj_observe-box_p2-1_a2_b1)(box-at b0 p1-1)(agent-at a3 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-5bj_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ti9_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a3 p2-1))
	:effect (and (immediate-dummy-5bj_observe-box_p2-1_a2_b1) )
)
(:action dummy-left-5bj_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ti9_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a3 p2-1)(not (box-at b1 p2-1))(immediate-dummy-5bj_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-5bj_observe-box_p2-1_a2_b1))(dummy-left-5bj_observe-box_p2-1_a2_b1))
)
(:action dummy-right-5bj_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ti9_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a3 p2-1)(box-at b1 p2-1)(immediate-dummy-5bj_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-5bj_observe-box_p2-1_a2_b1))(dummy-right-5bj_observe-box_p2-1_a2_b1))
)
(:action act-hca_joint-push_p1-1_p1-2_b0_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-5bj_observe-box_p2-1_a2_b1)(not (box-at b1 p2-1))(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a3 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-hca_joint-push_p1-1_p1-2_b0_a1_a3)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-hca_joint-push_p1-1_p1-2_b0_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-hca_joint-push_p1-1_p1-2_b0_a1_a3))
	:effect (and (done-goal))
)
(:action act-4cx_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-5bj_observe-box_p2-1_a2_b1)(box-at b1 p2-1)(box-at b0 p1-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-4cx_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-68k_joint-push_p1-1_p1-2_b0_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-4cx_joint-push_p2-1_p2-2_b1_a2_a3)(adj p1-1 p1-2)(agent-at a3 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-68k_joint-push_p1-1_p1-2_b0_a1_a3)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-68k_joint-push_p1-1_p1-2_b0_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-68k_joint-push_p1-1_p1-2_b0_a1_a3))
	:effect (and (done-goal))
)
)