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
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(achieve ?b1 - box)
)
(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action push
	:parameters ( ?start - pos ?end - pos ?b - box ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)) )
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end) 	(achieve ?b))
)
(:action joint-push
	:parameters ( ?start - pos ?end - pos ?b - box)
	:precondition (and (adj ?start ?end) (agent-at a2 ?start) (box-at ?b ?start) (heavy ?b) )
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end) )
)
(:action observe-box
	:parameters ( ?i - pos ?a - agent ?b - box)
	:precondition (and (agent-at ?a ?i) )
	:observe (box-at ?b ?i) )

(:action dummy-action-b1
	:parameters ()
	:precondition (and (not (box-at b1 p3-1)) )
	:effect (and (achieve b1)) )
)