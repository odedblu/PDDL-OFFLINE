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
	(c-p-a-124 )
	(observe-124 )
	(init-zgr_observe-box-a1_p2-2_b1)
	(immediate-dummy-zgr_observe-box-a1_p2-2_b1)
	(dummy-left-zgr_observe-box-a1_p2-2_b1)
	(pre-nis_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-zgr_observe-box-a1_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action commit-box-at-location
	:parameters ( ?a - agent)
	:precondition (and (not (observe-124 )) )
	:effect (and (c-p-a-124 ) )
)
(:action act-zgr_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-zgr_observe-box-a1_p2-2_b1)(immediate-dummy-zgr_observe-box-a1_p2-2_b1)(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-zgr_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-zgr_observe-box-a1_p2-2_b1))
	:effect (and (immediate-dummy-zgr_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-zgr_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-zgr_observe-box-a1_p2-2_b1)(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-zgr_observe-box-a1_p2-2_b1))
	:effect (and (not (init-zgr_observe-box-a1_p2-2_b1))(not (immediate-dummy-zgr_observe-box-a1_p2-2_b1))(dummy-left-zgr_observe-box-a1_p2-2_b1))
)
(:action dummy-right-zgr_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-zgr_observe-box-a1_p2-2_b1)(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-zgr_observe-box-a1_p2-2_b1))
	:effect (and (not (init-zgr_observe-box-a1_p2-2_b1))(not (immediate-dummy-zgr_observe-box-a1_p2-2_b1))(dummy-right-zgr_observe-box-a1_p2-2_b1))
)
(:action act-nis_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-zgr_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-nis_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-nis_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-nis_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-zgr_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-zgr_observe-box-a1_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)