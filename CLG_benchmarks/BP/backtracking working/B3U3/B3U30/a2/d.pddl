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
	(c-p-joint-push-a0g )
	(observe-joint-push-a0g )
	(init-3ya_obs-a0g-a1-a2-a3_a3)
	(pre-3ya_obs-a0g-a1-a2-a3_a3)
	(done-goal)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-3ya_obs-a0g-a1-a2-a3_a3
	:parameters ( ?a - agent )
	:precondition (and (init-3ya_obs-a0g-a1-a2-a3_a3))
	:effect (and (pre-3ya_obs-a0g-a1-a2-a3_a3)(observe-joint-push-a0g ))
)
(:action goal-achieve-3ya_obs-a0g-a1-a2-a3_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-3ya_obs-a0g-a1-a2-a3_a3))
	:effect (and (done-goal))
)
)