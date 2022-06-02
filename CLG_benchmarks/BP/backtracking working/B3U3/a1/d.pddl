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
	(init-azv_observe-box-a1_p1-1_b0)
	(immediate-dummy-azv_observe-box-a1_p1-1_b0)
	(dummy-left-azv_observe-box-a1_p1-1_b0)
	(done-goal)
	(dummy-right-azv_observe-box-a1_p1-1_b0)
	(pre-3mv_push_p1-1_p1-2_b0_a1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-azv_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-azv_observe-box-a1_p1-1_b0)(immediate-dummy-azv_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-azv_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-azv_observe-box-a1_p1-1_b0))
	:effect (and (immediate-dummy-azv_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-azv_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-azv_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-azv_observe-box-a1_p1-1_b0))
	:effect (and (not (init-azv_observe-box-a1_p1-1_b0))(not (immediate-dummy-azv_observe-box-a1_p1-1_b0))(dummy-left-azv_observe-box-a1_p1-1_b0))
)
(:action dummy-right-azv_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-azv_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-azv_observe-box-a1_p1-1_b0))
	:effect (and (not (init-azv_observe-box-a1_p1-1_b0))(not (immediate-dummy-azv_observe-box-a1_p1-1_b0))(dummy-right-azv_observe-box-a1_p1-1_b0))
)
(:action goal-achieve-left-azv_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-azv_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-3mv_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-azv_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-3mv_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-3mv_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (pre-3mv_push_p1-1_p1-2_b0_a1))
	:effect (and (done-goal))
)
)