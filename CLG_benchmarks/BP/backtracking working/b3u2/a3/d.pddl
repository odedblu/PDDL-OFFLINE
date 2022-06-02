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
	a3 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-tg1_observe-box-a3_p2-2_b1)
	(immediate-dummy-tg1_observe-box-a3_p2-2_b1)
	(dummy-left-tg1_observe-box-a3_p2-2_b1)
	(pre-qxf_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-tg1_observe-box-a3_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-tg1_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-tg1_observe-box-a3_p2-2_b1)(immediate-dummy-tg1_observe-box-a3_p2-2_b1)(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-tg1_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-tg1_observe-box-a3_p2-2_b1))
	:effect (and (immediate-dummy-tg1_observe-box-a3_p2-2_b1) )
)
(:action dummy-left-tg1_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-tg1_observe-box-a3_p2-2_b1)(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-tg1_observe-box-a3_p2-2_b1))
	:effect (and (not (init-tg1_observe-box-a3_p2-2_b1))(not (immediate-dummy-tg1_observe-box-a3_p2-2_b1))(dummy-left-tg1_observe-box-a3_p2-2_b1))
)
(:action dummy-right-tg1_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-tg1_observe-box-a3_p2-2_b1)(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-tg1_observe-box-a3_p2-2_b1))
	:effect (and (not (init-tg1_observe-box-a3_p2-2_b1))(not (immediate-dummy-tg1_observe-box-a3_p2-2_b1))(dummy-right-tg1_observe-box-a3_p2-2_b1))
)
(:action act-qxf_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-tg1_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-qxf_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-qxf_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-qxf_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-tg1_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-tg1_observe-box-a3_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)