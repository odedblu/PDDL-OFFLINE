(define
(domain kbox-2)
(:types POS AGENT BOX tag value)
(:constants 
	 p1-1 p1-2 p1-3 p1-4 p1-5 p2-1 p2-2 p2-3 p2-4 p2-5 p3-1 p3-2 p3-3 p3-4 p3-5 p4-1 p4-2 p4-3 p4-4 p4-5 p5-1 p5-2 p5-3 p5-4 p5-5 p6-1 p6-2 p6-3 p6-4 p6-5 p7-1 p7-2 p7-3 p7-4 p7-5 p8-1 p8-2 p8-3 p8-4 p8-5 p9-1 p9-2 p9-3 p9-4 p9-5 p10-1 p10-2 p10-3 p10-4 p10-5 - pos
	b0 b1 b2 - box 
	a1 a2 - agent
 	tag0 tag1 - tag 
	v_true v_false - value
)

(:predicates 
	(adj ?i - pos ?j - pos) 
	(agent-at ?a - agent ?i - pos) 
	(kagent-at ?a -agent ?i - pos ?agent_param -agent ?v_param - value) 
	(kgivenagent-at ?a - agent ?i - pos ?tag_param - tag ?agent_param - agent ?v_param - value) 
	(box-at ?b - box ?i - pos) 
	(kbox-at ?b - box ?i - pos ?agent_param - agent ?v_param - value) 
	(kgivenbox-at ?b - box ?i - pos ?tag_param - tag ?agent_param - agent ?v_param - value) 
	(heavy ?b - box) 
	(knot ?tag_param - tag ?agent_param - agent)
)

(:action move
	:parameters (?start - pos ?end - pos ?a - agent)
 	:precondition
		(and (adj ?start ?end) (agent-at ?a ?start))
 	:effect
		(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
) 

(:action push
	:parameters (?start - pos ?end - pos ?a - agent ?b - box)
 	:precondition
		(and (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)) (kbox-at ?b ?start ?a v_true))
 	:effect
		(and (not (agent-at ?a ?start)) (agent-at ?a ?end) (not (box-at ?b ?start)) (box-at ?b ?end) (kbox-at ?b ?start ?a v_false) 
		(not (kbox-at ?b ?start ?a v_true)) (kbox-at ?b ?end ?a v_true) (not (kbox-at ?b ?end ?a v_false)))
) 

(:action joint-push
	:parameters (?start - pos ?end - pos ?b - box)
	:precondition
		(and (adj ?start ?end) (agent-at a1 ?start) (agent-at a2 ?start) (box-at ?b ?start) (heavy ?b))
 	:effect
		(and (not (agent-at a1 ?start)) (agent-at a1 ?end) (not (agent-at a2 ?start)) (agent-at a2 ?end) (not (box-at ?b ?start)) (box-at ?b ?end))
) 

(:action observe-box
	:parameters (?p - pos ?b - box ?a - agent)
 	:precondition
		(and (agent-at ?a ?p) (not (kbox-at ?b ?p ?a v_true)) (not (kbox-at ?b ?p ?a v_false)))
 	:effect
		(and
        	(when (box-at ?b ?p) (kbox-at ?b ?p ?a v_true))
        	(when (not (box-at ?b ?p)) (kbox-at ?b ?p ?a v_false)))
) 

(:action merge-box-at
	:parameters (?b - box ?i - pos ?agent_param - agent ?v_param - value)
 	:precondition
		(and (not (kbox-at ?b ?i ?agent_param ?v_param))
        	(or (kgivenbox-at ?b ?i tag0 ?agent_param ?v_param) (knot tag0 ?agent_param))
        	(or (kgivenbox-at ?b ?i tag1 ?agent_param ?v_param) (knot tag1 ?agent_param)))
 	:effect (and (kbox-at ?b ?i ?agent_param ?v_param))
) 

(:action refutet-box-at
	:parameters (?b - box ?i - pos ?tag_param - tag ?agent_param - agent)
 	:precondition
		(and (not (knot ?tag_param ?agent_param)) (kgivenbox-at ?b ?i ?tag_param ?agent_param v_true) (kbox-at ?b ?i ?agent_param v_true) 
		(not (box-at ?b ?i)))
	:effect (and (knot ?tag_param ?agent_param))
) 

(:action refutef-box-at
	:parameters (?b - box ?i - pos ?tag_param - tag ?agent_param - agent)
 	:precondition
		(and (not (knot ?tag_param ?agent_param)) (kgivenbox-at ?b ?i ?tag_param ?agent_param v_false) (kbox-at ?b ?i ?agent_param v_true) (box-at ?b ?i))
	:effect (and (knot ?tag_param ?agent_param))
)
)

