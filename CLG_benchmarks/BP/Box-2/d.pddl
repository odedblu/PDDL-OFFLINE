(define 
(domain Box-2)
(:types POS AGENT BOX PUSH)
(:constants
	 p1-1 p1-2 p1-3 p1-4 p1-5 p2-1 p2-2 p2-3 p2-4 p2-5 p3-1 p3-2 p3-3 p3-4 p3-5 p4-1 p4-2 p4-3 p4-4 p4-5 p5-1 p5-2 p5-3 p5-4 p5-5 p6-1 p6-2 p6-3 p6-4 p6-5 p7-1 p7-2 p7-3 p7-4 p7-5 p8-1 p8-2 p8-3 p8-4 p8-5 p9-1 p9-2 p9-3 p9-4 p9-5 p10-1 p10-2 p10-3 p10-4 p10-5 - pos
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