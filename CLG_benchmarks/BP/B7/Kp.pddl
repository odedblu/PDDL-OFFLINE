(define (problem Kbox-4)
(:domain Kbox-4)
(:init
(Kagent-at a1 p1-1 a1 V_TRUE)
(Kagent-at a1 p1-1 a2 V_TRUE)
(Kagent-at a1 p1-1 a3 V_TRUE)
(agent-at a1 p1-1)
(Kagent-at a2 p5-1 a1 V_FALSE)
(Kagent-at a2 p5-1 a2 V_FALSE)
(Kagent-at a2 p5-1 a3 V_FALSE)
(Kagent-at a3 p3-1 a1 V_TRUE)
(Kagent-at a3 p3-1 a2 V_TRUE)
(Kagent-at a3 p3-1 a3 V_TRUE)
(agent-at a3 p3-1)
(adj p1-1 p1-2)
(adj p2-1 p2-2)
(adj p3-1 p3-2)
(adj p4-1 p4-2)
(adj p5-1 p5-2)
(adj p1-2 p1-1)
(adj p2-2 p2-1)
(adj p3-2 p3-1)
(adj p4-2 p4-1)
(adj p5-2 p5-1)
(adj p1-1 p2-1)
(adj p2-1 p3-1)
(adj p3-1 p4-1)
(adj p4-1 p5-1)
(adj p2-1 p1-1)
(adj p3-1 p2-1)
(adj p4-1 p3-1)
(adj p5-1 p4-1)
(heavy b1)
(heavy b2)
(same-agent a1 a1)
(same-agent a2 a2)
(same-agent a3 a3)
(Kagent-at a1 p1-2 a1 V_FALSE)
(Kagent-at a1 p1-2 a2 V_FALSE)
(Kagent-at a1 p1-2 a3 V_FALSE)
(Kagent-at a1 p2-1 a1 V_FALSE)
(Kagent-at a1 p2-1 a2 V_FALSE)
(Kagent-at a1 p2-1 a3 V_FALSE)
(Kagent-at a1 p2-2 a1 V_FALSE)
(Kagent-at a1 p2-2 a2 V_FALSE)
(Kagent-at a1 p2-2 a3 V_FALSE)
(Kagent-at a1 p3-1 a1 V_FALSE)
(Kagent-at a1 p3-1 a2 V_FALSE)
(Kagent-at a1 p3-1 a3 V_FALSE)
(Kagent-at a1 p3-2 a1 V_FALSE)
(Kagent-at a1 p3-2 a2 V_FALSE)
(Kagent-at a1 p3-2 a3 V_FALSE)
(Kagent-at a1 p4-1 a1 V_FALSE)
(Kagent-at a1 p4-1 a2 V_FALSE)
(Kagent-at a1 p4-1 a3 V_FALSE)
(Kagent-at a1 p4-2 a1 V_FALSE)
(Kagent-at a1 p4-2 a2 V_FALSE)
(Kagent-at a1 p4-2 a3 V_FALSE)
(Kagent-at a1 p5-1 a1 V_FALSE)
(Kagent-at a1 p5-1 a2 V_FALSE)
(Kagent-at a1 p5-1 a3 V_FALSE)
(Kagent-at a1 p5-2 a1 V_FALSE)
(Kagent-at a1 p5-2 a2 V_FALSE)
(Kagent-at a1 p5-2 a3 V_FALSE)
(Kagent-at a2 p1-1 a1 V_FALSE)
(Kagent-at a2 p1-1 a2 V_FALSE)
(Kagent-at a2 p1-1 a3 V_FALSE)
(Kagent-at a2 p1-2 a1 V_FALSE)
(Kagent-at a2 p1-2 a2 V_FALSE)
(Kagent-at a2 p1-2 a3 V_FALSE)
(Kagent-at a2 p2-1 a1 V_FALSE)
(Kagent-at a2 p2-1 a2 V_FALSE)
(Kagent-at a2 p2-1 a3 V_FALSE)
(Kagent-at a2 p2-2 a1 V_FALSE)
(Kagent-at a2 p2-2 a2 V_FALSE)
(Kagent-at a2 p2-2 a3 V_FALSE)
(Kagent-at a2 p3-1 a1 V_TRUE)
(Kagent-at a2 p3-1 a2 V_TRUE)
(Kagent-at a2 p3-1 a3 V_TRUE)
(agent-at a2 p3-1)
(Kagent-at a2 p3-2 a1 V_FALSE)
(Kagent-at a2 p3-2 a2 V_FALSE)
(Kagent-at a2 p3-2 a3 V_FALSE)
(Kagent-at a2 p4-1 a1 V_FALSE)
(Kagent-at a2 p4-1 a2 V_FALSE)
(Kagent-at a2 p4-1 a3 V_FALSE)
(Kagent-at a2 p4-2 a1 V_FALSE)
(Kagent-at a2 p4-2 a2 V_FALSE)
(Kagent-at a2 p4-2 a3 V_FALSE)
(Kagent-at a2 p5-2 a1 V_FALSE)
(Kagent-at a2 p5-2 a2 V_FALSE)
(Kagent-at a2 p5-2 a3 V_FALSE)
(Kagent-at a3 p1-1 a1 V_FALSE)
(Kagent-at a3 p1-1 a2 V_FALSE)
(Kagent-at a3 p1-1 a3 V_FALSE)
(Kagent-at a3 p1-2 a1 V_FALSE)
(Kagent-at a3 p1-2 a2 V_FALSE)
(Kagent-at a3 p1-2 a3 V_FALSE)
(Kagent-at a3 p2-1 a1 V_FALSE)
(Kagent-at a3 p2-1 a2 V_FALSE)
(Kagent-at a3 p2-1 a3 V_FALSE)
(Kagent-at a3 p2-2 a1 V_FALSE)
(Kagent-at a3 p2-2 a2 V_FALSE)
(Kagent-at a3 p2-2 a3 V_FALSE)
(Kagent-at a3 p3-2 a1 V_FALSE)
(Kagent-at a3 p3-2 a2 V_FALSE)
(Kagent-at a3 p3-2 a3 V_FALSE)
(Kagent-at a3 p4-1 a1 V_FALSE)
(Kagent-at a3 p4-1 a2 V_FALSE)
(Kagent-at a3 p4-1 a3 V_FALSE)
(Kagent-at a3 p4-2 a1 V_FALSE)
(Kagent-at a3 p4-2 a2 V_FALSE)
(Kagent-at a3 p4-2 a3 V_FALSE)
(Kagent-at a3 p5-1 a1 V_FALSE)
(Kagent-at a3 p5-1 a2 V_FALSE)
(Kagent-at a3 p5-1 a3 V_FALSE)
(Kagent-at a3 p5-2 a1 V_FALSE)
(Kagent-at a3 p5-2 a2 V_FALSE)
(Kagent-at a3 p5-2 a3 V_FALSE)
(Kbox-at b0 p2-1 a1 V_FALSE)
(Kbox-at b0 p2-1 a2 V_FALSE)
(Kbox-at b0 p2-1 a3 V_FALSE)
(Kbox-at b0 p2-2 a1 V_FALSE)
(Kbox-at b0 p2-2 a2 V_FALSE)
(Kbox-at b0 p2-2 a3 V_FALSE)
(Kbox-at b0 p3-1 a1 V_FALSE)
(Kbox-at b0 p3-1 a2 V_FALSE)
(Kbox-at b0 p3-1 a3 V_FALSE)
(Kbox-at b0 p3-2 a1 V_FALSE)
(Kbox-at b0 p3-2 a2 V_FALSE)
(Kbox-at b0 p3-2 a3 V_FALSE)
(Kbox-at b0 p4-1 a1 V_FALSE)
(Kbox-at b0 p4-1 a2 V_FALSE)
(Kbox-at b0 p4-1 a3 V_FALSE)
(Kbox-at b0 p4-2 a1 V_FALSE)
(Kbox-at b0 p4-2 a2 V_FALSE)
(Kbox-at b0 p4-2 a3 V_FALSE)
(Kbox-at b0 p5-1 a1 V_FALSE)
(Kbox-at b0 p5-1 a2 V_FALSE)
(Kbox-at b0 p5-1 a3 V_FALSE)
(Kbox-at b0 p5-2 a1 V_FALSE)
(Kbox-at b0 p5-2 a2 V_FALSE)
(Kbox-at b0 p5-2 a3 V_FALSE)
(Kbox-at b1 p1-1 a1 V_FALSE)
(Kbox-at b1 p1-1 a2 V_FALSE)
(Kbox-at b1 p1-1 a3 V_FALSE)
(Kbox-at b1 p1-2 a1 V_FALSE)
(Kbox-at b1 p1-2 a2 V_FALSE)
(Kbox-at b1 p1-2 a3 V_FALSE)
(Kbox-at b1 p2-1 a1 V_FALSE)
(Kbox-at b1 p2-1 a2 V_FALSE)
(Kbox-at b1 p2-1 a3 V_FALSE)
(Kbox-at b1 p2-2 a1 V_FALSE)
(Kbox-at b1 p2-2 a2 V_FALSE)
(Kbox-at b1 p2-2 a3 V_FALSE)
(Kbox-at b1 p4-1 a1 V_FALSE)
(Kbox-at b1 p4-1 a2 V_FALSE)
(Kbox-at b1 p4-1 a3 V_FALSE)
(Kbox-at b1 p4-2 a1 V_FALSE)
(Kbox-at b1 p4-2 a2 V_FALSE)
(Kbox-at b1 p4-2 a3 V_FALSE)
(Kbox-at b1 p5-1 a1 V_FALSE)
(Kbox-at b1 p5-1 a2 V_FALSE)
(Kbox-at b1 p5-1 a3 V_FALSE)
(Kbox-at b1 p5-2 a1 V_FALSE)
(Kbox-at b1 p5-2 a2 V_FALSE)
(Kbox-at b1 p5-2 a3 V_FALSE)
(Kbox-at b2 p1-1 a1 V_FALSE)
(Kbox-at b2 p1-1 a2 V_FALSE)
(Kbox-at b2 p1-1 a3 V_FALSE)
(Kbox-at b2 p1-2 a1 V_FALSE)
(Kbox-at b2 p1-2 a2 V_FALSE)
(Kbox-at b2 p1-2 a3 V_FALSE)
(Kbox-at b2 p2-1 a1 V_FALSE)
(Kbox-at b2 p2-1 a2 V_FALSE)
(Kbox-at b2 p2-1 a3 V_FALSE)
(Kbox-at b2 p2-2 a1 V_FALSE)
(Kbox-at b2 p2-2 a2 V_FALSE)
(Kbox-at b2 p2-2 a3 V_FALSE)
(Kbox-at b2 p3-1 a1 V_FALSE)
(Kbox-at b2 p3-1 a2 V_FALSE)
(Kbox-at b2 p3-1 a3 V_FALSE)
(Kbox-at b2 p3-2 a1 V_FALSE)
(Kbox-at b2 p3-2 a2 V_FALSE)
(Kbox-at b2 p3-2 a3 V_FALSE)
(Kbox-at b2 p4-1 a1 V_FALSE)
(Kbox-at b2 p4-1 a2 V_FALSE)
(Kbox-at b2 p4-1 a3 V_FALSE)
(Kbox-at b2 p4-2 a1 V_FALSE)
(Kbox-at b2 p4-2 a2 V_FALSE)
(Kbox-at b2 p4-2 a3 V_FALSE)
(Kbox-at b2 p5-2 a2 V_TRUE)
(Kbox-at b2 p5-1 a2 V_FALSE)
(Kbox-at b2 p5-1 a3 V_FALSE)
(Kbox-at b2 p5-2 a3 V_TRUE)
(Kbox-at b1 p3-1 a3 V_FALSE)
(Kbox-at b1 p3-2 a3 V_TRUE)
(box-at b0 p1-1)
(box-at b2 p5-2)
(box-at b1 p3-2)
(Kbox-at b0 p2-1 a1 V_FALSE)
(Kbox-at b0 p2-1 a2 V_FALSE)
(Kbox-at b0 p2-1 a3 V_FALSE)
(Kbox-at b0 p2-2 a1 V_FALSE)
(Kbox-at b0 p2-2 a2 V_FALSE)
(Kbox-at b0 p2-2 a3 V_FALSE)
(Kbox-at b0 p3-1 a1 V_FALSE)
(Kbox-at b0 p3-1 a2 V_FALSE)
(Kbox-at b0 p3-1 a3 V_FALSE)
(Kbox-at b0 p3-2 a1 V_FALSE)
(Kbox-at b0 p3-2 a2 V_FALSE)
(Kbox-at b0 p3-2 a3 V_FALSE)
(Kbox-at b0 p4-1 a1 V_FALSE)
(Kbox-at b0 p4-1 a2 V_FALSE)
(Kbox-at b0 p4-1 a3 V_FALSE)
(Kbox-at b0 p4-2 a1 V_FALSE)
(Kbox-at b0 p4-2 a2 V_FALSE)
(Kbox-at b0 p4-2 a3 V_FALSE)
(Kbox-at b0 p5-1 a1 V_FALSE)
(Kbox-at b0 p5-1 a2 V_FALSE)
(Kbox-at b0 p5-1 a3 V_FALSE)
(Kbox-at b0 p5-2 a1 V_FALSE)
(Kbox-at b0 p5-2 a2 V_FALSE)
(Kbox-at b0 p5-2 a3 V_FALSE)
(Kbox-at b1 p1-1 a1 V_FALSE)
(Kbox-at b1 p1-1 a2 V_FALSE)
(Kbox-at b1 p1-1 a3 V_FALSE)
(Kbox-at b1 p1-2 a1 V_FALSE)
(Kbox-at b1 p1-2 a2 V_FALSE)
(Kbox-at b1 p1-2 a3 V_FALSE)
(Kbox-at b1 p2-1 a1 V_FALSE)
(Kbox-at b1 p2-1 a2 V_FALSE)
(Kbox-at b1 p2-1 a3 V_FALSE)
(Kbox-at b1 p2-2 a1 V_FALSE)
(Kbox-at b1 p2-2 a2 V_FALSE)
(Kbox-at b1 p2-2 a3 V_FALSE)
(Kbox-at b1 p4-1 a1 V_FALSE)
(Kbox-at b1 p4-1 a2 V_FALSE)
(Kbox-at b1 p4-1 a3 V_FALSE)
(Kbox-at b1 p4-2 a1 V_FALSE)
(Kbox-at b1 p4-2 a2 V_FALSE)
(Kbox-at b1 p4-2 a3 V_FALSE)
(Kbox-at b1 p5-1 a1 V_FALSE)
(Kbox-at b1 p5-1 a2 V_FALSE)
(Kbox-at b1 p5-1 a3 V_FALSE)
(Kbox-at b1 p5-2 a1 V_FALSE)
(Kbox-at b1 p5-2 a2 V_FALSE)
(Kbox-at b1 p5-2 a3 V_FALSE)
(Kbox-at b2 p1-1 a1 V_FALSE)
(Kbox-at b2 p1-1 a2 V_FALSE)
(Kbox-at b2 p1-1 a3 V_FALSE)
(Kbox-at b2 p1-2 a1 V_FALSE)
(Kbox-at b2 p1-2 a2 V_FALSE)
(Kbox-at b2 p1-2 a3 V_FALSE)
(Kbox-at b2 p2-1 a1 V_FALSE)
(Kbox-at b2 p2-1 a2 V_FALSE)
(Kbox-at b2 p2-1 a3 V_FALSE)
(Kbox-at b2 p2-2 a1 V_FALSE)
(Kbox-at b2 p2-2 a2 V_FALSE)
(Kbox-at b2 p2-2 a3 V_FALSE)
(Kbox-at b2 p3-1 a1 V_FALSE)
(Kbox-at b2 p3-1 a2 V_FALSE)
(Kbox-at b2 p3-1 a3 V_FALSE)
(Kbox-at b2 p3-2 a1 V_FALSE)
(Kbox-at b2 p3-2 a2 V_FALSE)
(Kbox-at b2 p3-2 a3 V_FALSE)
(Kbox-at b2 p4-1 a1 V_FALSE)
(Kbox-at b2 p4-1 a2 V_FALSE)
(Kbox-at b2 p4-1 a3 V_FALSE)
(Kbox-at b2 p4-2 a1 V_FALSE)
(Kbox-at b2 p4-2 a2 V_FALSE)
(Kbox-at b2 p4-2 a3 V_FALSE)
(KGivenbox-at b0 p1-1 tag0 a1 V_TRUE)
(KGivenbox-at b0 p1-1 tag0 a2 V_TRUE)
(KGivenbox-at b0 p1-1 tag0 a3 V_TRUE)
(KGivenbox-at b0 p1-2 tag0 a1 V_FALSE)
(KGivenbox-at b0 p1-2 tag0 a2 V_FALSE)
(KGivenbox-at b0 p1-2 tag0 a3 V_FALSE)
(KGivenbox-at b2 p5-2 tag0 a1 V_TRUE)
(KGivenbox-at b2 p5-2 tag0 a2 V_TRUE)
(KGivenbox-at b2 p5-2 tag0 a3 V_TRUE)
(KGivenbox-at b2 p5-1 tag0 a1 V_FALSE)
(KGivenbox-at b2 p5-1 tag0 a2 V_FALSE)
(KGivenbox-at b2 p5-1 tag0 a3 V_FALSE)
(KGivenbox-at b1 p3-1 tag0 a1 V_FALSE)
(KGivenbox-at b1 p3-1 tag0 a2 V_FALSE)
(KGivenbox-at b1 p3-1 tag0 a3 V_FALSE)
(KGivenbox-at b1 p3-2 tag0 a1 V_TRUE)
(KGivenbox-at b1 p3-2 tag0 a2 V_TRUE)
(KGivenbox-at b1 p3-2 tag0 a3 V_TRUE)
(KGivenbox-at b0 p1-1 tag1 a1 V_FALSE)
(KGivenbox-at b0 p1-1 tag1 a2 V_FALSE)
(KGivenbox-at b0 p1-1 tag1 a3 V_FALSE)
(KGivenbox-at b0 p1-2 tag1 a1 V_TRUE)
(KGivenbox-at b0 p1-2 tag1 a2 V_TRUE)
(KGivenbox-at b0 p1-2 tag1 a3 V_TRUE)
(KGivenbox-at b2 p5-2 tag1 a1 V_FALSE)
(KGivenbox-at b2 p5-2 tag1 a2 V_FALSE)
(KGivenbox-at b2 p5-2 tag1 a3 V_FALSE)
(KGivenbox-at b2 p5-1 tag1 a1 V_TRUE)
(KGivenbox-at b2 p5-1 tag1 a2 V_TRUE)
(KGivenbox-at b2 p5-1 tag1 a3 V_TRUE)
(KGivenbox-at b1 p3-1 tag1 a1 V_TRUE)
(KGivenbox-at b1 p3-1 tag1 a2 V_TRUE)
(KGivenbox-at b1 p3-1 tag1 a3 V_TRUE)
(KGivenbox-at b1 p3-2 tag1 a1 V_FALSE)
(KGivenbox-at b1 p3-2 tag1 a2 V_FALSE)
(KGivenbox-at b1 p3-2 tag1 a3 V_FALSE)
)
(:goal 
(and (box-at b0 p1-2) (box-at b1 p3-2) (box-at b2 p5-2) 
	(or (Kbox-at b0 p1-2 a1 V_TRUE) (Kbox-at b0 p1-2 a2 V_TRUE) (Kbox-at b0 p1-2 a3 V_TRUE))
	(or (Kbox-at b1 p3-2 a1 V_TRUE) (Kbox-at b1 p3-2 a2 V_TRUE) (Kbox-at b1 p3-2 a3 V_TRUE))
	(or (Kbox-at b2 p5-2 a1 V_TRUE) (Kbox-at b2 p5-2 a2 V_TRUE) (Kbox-at b2 p5-2 a3 V_TRUE))))
)