(define 
(domain Box-3)
(:types POS AGENT BOX PUSH)
(:constants
	p1-1 p1-2 p2-1 p2-2 p3-1 p3-2 - pos
	b0 b1 - box	
	a1 a2 a3 - agent 	 
)

(:predicates
	(adj ?i ?j - pos)
	(agent-at ?a - agent ?i - pos)
	(box-at ?b - box ?i - pos)
	(heavy ?b - box)
	(same-agent ?a1 - agent ?a2 - agent)
	(c-p-a-124)
	(observe-124)
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
	:precondition (and (not (= ?a1 a2)) (not (= ?a2 a2)) (adj ?start ?end) (agent-at ?a1 ?start) (agent-at ?a2 ?start) (box-at ?b ?start) (heavy ?b) (not (same-agent ?a1 ?a2)))
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end))
)

(:action joint-push-a2
	:parameters (?start - pos ?end - pos ?b - box )
	:precondition (and (adj ?start ?end) (agent-at a2 ?start) (agent-at a3 ?start) (box-at ?b ?start) (heavy ?b) (not (same-agent a2 a3)) (c-p-a-124) (observe-124))
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end) (when (c-p-a-124) (not (c-p-a-124))) )
)

(:action observe-box-a1
	:parameters (?i - pos ?b - box)
	:precondition (and (agent-at a1 ?i))
	:observe (box-at ?b ?i)
)

(:action observe-box-a3
	:parameters (?i - pos ?b - box)
	:precondition (and (agent-at a3 ?i) (observe-124))
	:observe (box-at ?b ?i)
)

(:action commit-box-at-location
	:parameters (?a - agent)
	:precondition (and (not (observe-124)) )
	:effect (and (c-p-a-124) )
)

(:action observe-box-at-loc
	:parameters (?a - agent)
	:effect (and (observe-124)) 
)

)