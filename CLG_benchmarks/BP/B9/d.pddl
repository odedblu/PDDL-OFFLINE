(define (domain box-2-a1)
(:types pos agent box push )
(:constants 
	p1-1 - pos
	p1-2 - pos
	b0 - box
	a1 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-jqe_observe-box_a2_p1-2_b0)
	(immediate-dummy-jqe_observe-box_a2_p1-2_b0)
	(dummy-left-jqe_observe-box_a2_p1-2_b0)
	(immediate-dummy-91g_observe-box_a1_p1-1_b0)
	(dummy-right-91g_observe-box_a1_p1-1_b0)
	(pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2)
	(done-goal)
	(dummy-right-jqe_observe-box_a2_p1-2_b0)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-jqe_observe-box_a2_p1-2_b0
	:precondition (and (init-jqe_observe-box_a2_p1-2_b0)(immediate-dummy-jqe_observe-box_a2_p1-2_b0)(agent-at a1 p1-2))
	:observe (box-at b0 p1-2)
)
(:action act-dummy-jqe_observe-box_a2_p1-2_b0
	:precondition (and (init-jqe_observe-box_a2_p1-2_b0))
	:effect (and (immediate-dummy-jqe_observe-box_a2_p1-2_b0) )
)
(:action dummy-left-jqe_observe-box_a2_p1-2_b0
	:precondition (and (init-jqe_observe-box_a2_p1-2_b0)(agent-at a1 p1-2)(not (box-at b0 p1-2))(immediate-dummy-jqe_observe-box_a2_p1-2_b0))
	:effect (and (not (init-jqe_observe-box_a2_p1-2_b0))(not (immediate-dummy-jqe_observe-box_a2_p1-2_b0))(dummy-left-jqe_observe-box_a2_p1-2_b0))
)
(:action dummy-right-jqe_observe-box_a2_p1-2_b0
	:precondition (and (init-jqe_observe-box_a2_p1-2_b0)(agent-at a1 p1-2)(box-at b0 p1-2)(immediate-dummy-jqe_observe-box_a2_p1-2_b0))
	:effect (and (not (init-jqe_observe-box_a2_p1-2_b0))(not (immediate-dummy-jqe_observe-box_a2_p1-2_b0))(dummy-right-jqe_observe-box_a2_p1-2_b0))
)
(:action act-91g_observe-box_a1_p1-1_b0
	:precondition (and (dummy-left-jqe_observe-box_a2_p1-2_b0)(immediate-dummy-91g_observe-box_a1_p1-1_b0)(not (box-at b0 p1-2))(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-91g_observe-box_a1_p1-1_b0
	:precondition (and (dummy-left-jqe_observe-box_a2_p1-2_b0)(not (box-at b0 p1-2))(agent-at a1 p1-1))
	:effect (and (immediate-dummy-91g_observe-box_a1_p1-1_b0) )
)
(:action dummy-right-91g_observe-box_a1_p1-1_b0
	:precondition (and (dummy-left-jqe_observe-box_a2_p1-2_b0)(not (box-at b0 p1-2))(agent-at a1 p1-1)(box-at b0 p1-1)
		(immediate-dummy-91g_observe-box_a1_p1-1_b0))
	:effect (and (not (immediate-dummy-91g_observe-box_a1_p1-1_b0))(dummy-right-91g_observe-box_a1_p1-1_b0))
)
(:action act-g1e_joint-push_p1-1_p1-2_b0_a1_a2
	:precondition (and (dummy-right-91g_observe-box_a1_p1-1_b0)(box-at b0 p1-1)(not (box-at b0 p1-2))(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-g1e_joint-push_p1-1_p1-2_b0_a1_a2
	:precondition (and (pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2))
	:effect (and (done-goal))
)
(:action goal-achieve-right-jqe_observe-box_a2_p1-2_b0
	:precondition (and (dummy-right-jqe_observe-box_a2_p1-2_b0)(box-at b0 p1-2))
	:effect (and (done-goal))
)
)