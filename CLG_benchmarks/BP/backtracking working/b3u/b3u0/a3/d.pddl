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
	(c-p-joint-push-dn6 )
	(observe-joint-push-dn6 )
	(init-28z_observe-box-a1_p2-2_b1)
	(immediate-dummy-28z_observe-box-a1_p2-2_b1)
	(dummy-left-28z_observe-box-a1_p2-2_b1)
	(pre-otx_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-28z_observe-box-a1_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-28z_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-28z_observe-box-a1_p2-2_b1)(immediate-dummy-28z_observe-box-a1_p2-2_b1)(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-28z_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-28z_observe-box-a1_p2-2_b1))
	:effect (and (immediate-dummy-28z_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-28z_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-28z_observe-box-a1_p2-2_b1)(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-28z_observe-box-a1_p2-2_b1))
	:effect (and (not (init-28z_observe-box-a1_p2-2_b1))(not (immediate-dummy-28z_observe-box-a1_p2-2_b1))(dummy-left-28z_observe-box-a1_p2-2_b1))
)
(:action dummy-right-28z_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (init-28z_observe-box-a1_p2-2_b1)(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-28z_observe-box-a1_p2-2_b1))
	:effect (and (not (init-28z_observe-box-a1_p2-2_b1))(not (immediate-dummy-28z_observe-box-a1_p2-2_b1))(dummy-right-28z_observe-box-a1_p2-2_b1))
)
(:action act-otx_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-28z_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-otx_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-otx_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-otx_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-28z_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-28z_observe-box-a1_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)