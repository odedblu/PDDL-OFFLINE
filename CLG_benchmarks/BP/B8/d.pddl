(define 
(domain Box-3)
(:types POS AGENT BOX PUSH)
(:constants
	 p1-1 p1-2 p2-1 p2-2 p3-1 p3-2 - pos
	 b0 b1 - box
	 a1 a2 a3 a4 - agent
	)

(:predicates
	(adj ?i ?j - pos)
	(agent-at ?a - agent ?i - pos)
	(box-at ?b - box ?i - pos)
	(heavy ?b - box)
	(same-agent ?a1 - agent ?a2 - agent)
	(can-observe ?a1 - agent)
	(can-observe-not ?a1 - agent)
)

(:action move
	:parameters (?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start))
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)

(:action push
	:parameters (?start - pos ?end - pos ?b - box ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)))
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end))
)

(:action joint-push
	:parameters (?start - pos ?end - pos ?b - box ?a1 - agent ?a2 - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a1 ?start) (agent-at ?a2 ?start) (box-at ?b ?start) (heavy ?b) 
		(not (same-agent ?a1 ?a2))(can-observe-not ?a2)(can-observe-not ?a1))
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end))
)

(:action observe-box
	:parameters (?a1 - agent ?i - pos ?b - box)
	:precondition (and (agent-at ?a1 ?i) (can-observe ?a1))
	:observe (box-at ?b ?i)
)

)