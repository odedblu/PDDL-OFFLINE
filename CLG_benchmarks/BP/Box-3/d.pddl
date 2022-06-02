(define 
(domain Box-3)
(:types POS AGENT BOX PUSH)
(:constants
	 p1-1 p1-2 p1-3 p2-1 p2-2 p2-3 p3-1 p3-2 p3-3 - pos
	 b0 b1 b2 - box
	 a1 a2 - agent
	)

(:predicates
	(adj ?i ?j - pos)
	(agent-at ?a - agent ?i - pos)
	(box-at ?b - box ?i - pos)
	(heavy ?b - box)
)
(:action move
	:parameters (?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start))
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)

(:action push
	:parameters (?start - pos ?end - pos ?b - box ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)))
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) (not (box-at ?b ?start)) (box-at ?b ?end))
)

(:action joint-push
	:parameters (?start - pos ?end - pos ?b - box)
	:precondition (and (adj ?start ?end) (agent-at a1 ?start) (agent-at a2 ?start) (box-at ?b ?start) (heavy ?b))
	:effect (and (not (agent-at a1 ?start)) (agent-at a1 ?end) (not (agent-at a2 ?start)) (agent-at a2 ?end) (not (box-at ?b ?start)) (box-at ?b ?end))
)

(:action observe-box
	:parameters (?p - pos ?a - agent ?b - box)
	:precondition (and (agent-at ?a ?p))
	:observe-agent ?a (box-at ?b ?p)
)

)