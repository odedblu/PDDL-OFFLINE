(define (problem Kbox-2)
(:domain Kbox-2)
(:init
(Kagent-at a1 p1-2 a1 V_TRUE)
(Kagent-at a1 p1-2 a2 V_TRUE)
(agent-at a1 p1-2)
(Kagent-at a2 p1-2 a1 V_TRUE)
(Kagent-at a2 p1-2 a2 V_TRUE)
(agent-at a2 p1-2)
(adj p1-1 p1-2)
(adj p1-2 p1-1)
(heavy b0)
(same-agent a1 a1)
(same-agent a2 a2)
(Kagent-at a1 p1-1 a1 V_FALSE)
(Kagent-at a1 p1-1 a2 V_FALSE)
(Kagent-at a2 p1-1 a1 V_FALSE)
(Kagent-at a2 p1-1 a2 V_FALSE)
(Kbox-at b0 p1-2 a1 V_FALSE)
(Kbox-at b0 p1-1 a1 V_TRUE)
(box-at b0 p1-1)
(KGivenbox-at b0 p1-2 tag0 a1 V_FALSE)
(KGivenbox-at b0 p1-2 tag0 a2 V_FALSE)
(KGivenbox-at b0 p1-1 tag0 a1 V_TRUE)
(KGivenbox-at b0 p1-1 tag0 a2 V_TRUE)
(KGivenbox-at b0 p1-2 tag1 a1 V_TRUE)
(KGivenbox-at b0 p1-2 tag1 a2 V_TRUE)
(KGivenbox-at b0 p1-1 tag1 a1 V_FALSE)
(KGivenbox-at b0 p1-1 tag1 a2 V_FALSE)
)
(:goal 
(and (box-at b0 p1-2) (Kbox-at b0 p1-2 a1 V_TRUE) (Kbox-at b0 p1-2 a2 V_TRUE)))
)
