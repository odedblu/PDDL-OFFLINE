(define
(domain box-3)
(:types pos agent box push)
(:constants
	p1-1 - pos
	p1-2 - pos
	p2-1 - pos
	p2-2 - pos
	p3-1 - pos
	p3-2 - pos
	b0 - box
	b1 - box
	a1 - agent
	a2 - agent
	a3 - agent
)
(:predicates
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(same-agent ?a1 - agent ?a2 - agent )
	(c-p-joint-push-dn6)
	(observe-joint-push-dn6)
)
(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent )
	:precondition (and  (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end)  )
)
(:action push
	:parameters ( ?start - pos ?end - pos ?b - box ?a - agent )
	:precondition (and  (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)) )
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end)  )
)
(:action joint-push
	:parameters ( ?start - pos ?end - pos ?b - box ?a1 - agent ?a2 - agent )
	:precondition (and (not (= ?a1 a2))(not (= ?a2 a2)) (adj ?start ?end) (agent-at ?a1 ?start) (agent-at ?a2 ?start) (box-at ?b ?start) (heavy ?b) (not (same-agent ?a1 ?a2)) )
	:effect (and (not (box-at ?b ?start)) (box-at ?b ?end) )
)
(:action joint-push-a2
	:parameters ( ?start - pos ?end - pos ?b - box )
	:precondition (and (c-p-joint-push-dn6)(observe-joint-push-dn6) (adj ?start ?end)(agent-at a2 ?start)(agent-at a3 ?start) (box-at ?b ?start) (heavy ?b)(not (same-agent a2 a3)) )
	:effect (and (when (c-p-joint-push-dn6) (not (c-p-joint-push-dn6)) ) (not (box-at ?b ?start)) (box-at ?b ?end))
)
(:action commit-joint-push-dn6
	:parameters (?a - agent)
	:precondition (and (not (observe-joint-push-dn6)) )
	:effect (and (c-p-joint-push-dn6))
)
(:action obs-joint-push-dn6-a2
	:parameters (?a - agent)
	:effect (and (observe-joint-push-dn6))
)
(:action observe-box-a1
	:parameters ( ?i - pos ?b - box )
	:precondition (and  (agent-at a1 ?i) )
	:observe (box-at ?b ?i) 
)
(:action observe-box-a3
	:parameters ( ?i - pos ?b - box )
	:precondition (and (observe-joint-push-dn6) (agent-at a3 ?i) )
	:observe (box-at ?b ?i) 
)
)
