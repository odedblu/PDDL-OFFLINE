(define (problem Kbox-3)
(:domain Kbox-3)
;;SingleStateK
(:init
(agent-at a1 p1-1)
(agent-at a2 p2-1)
(agent-at a3 p3-1)
(adj p1-1 p1-2)
(adj p2-1 p2-2)
(adj p3-1 p3-2)
(adj p1-2 p1-1)
(adj p2-2 p2-1)
(adj p3-2 p3-1)
(adj p1-1 p2-1)
(adj p2-1 p3-1)
(adj p2-1 p1-1)
(adj p3-1 p2-1)
(heavy b2)
(heavy b1)
(not (heavy b0))
(same-agent a1 a1)
(same-agent a2 a2)
(same-agent a3 a3)
(not (same-agent a1 a2))
(not (same-agent a2 a1))
(not (same-agent a1 a3))
(not (same-agent a3 a1))
(not (same-agent a3 a2))
(not (same-agent a2 a3))
(not (agent-at a1 p1-2))
(not (agent-at a1 p2-1))
(not (agent-at a1 p2-2))
(not (agent-at a1 p3-1))
(not (agent-at a1 p3-2))
(not (agent-at a2 p1-1))
(not (agent-at a2 p1-2))
(not (agent-at a2 p2-2))
(not (agent-at a2 p3-1))
(not (agent-at a2 p3-2))
(not (agent-at a3 p1-1))
(not (agent-at a3 p1-2))
(not (agent-at a3 p2-1))
(not (agent-at a3 p2-2))
(not (agent-at a3 p3-2))
(not (box-at b0 p2-1))
(KNbox-at b0 p2-1)
(not (box-at b0 p2-2))
(KNbox-at b0 p2-2)
(not (box-at b0 p3-1))
(KNbox-at b0 p3-1)
(not (box-at b0 p3-2))
(KNbox-at b0 p3-2)
(not (box-at b1 p1-1))
(KNbox-at b1 p1-1)
(not (box-at b1 p1-2))
(KNbox-at b1 p1-2)
(not (box-at b1 p3-1))
(KNbox-at b1 p3-1)
(not (box-at b1 p3-2))
(KNbox-at b1 p3-2)
(not (box-at b2 p1-1))
(KNbox-at b2 p1-1)
(not (box-at b2 p1-2))
(KNbox-at b2 p1-2)
(not (box-at b2 p2-1))
(KNbox-at b2 p2-1)
(not (box-at b2 p2-2))
(KNbox-at b2 p2-2)
(box-at b0 p1-1)
(Kbox-at b0 p1-1)
(not (box-at b0 p1-2))
(KNbox-at b0 p1-2)
(box-at b1 p2-1)
(not (box-at b1 p2-2))
(box-at b2 p3-1)
(not (box-at b2 p3-2))
)
(:goal 
(and (Kbox-at b0 p1-2) (Kbox-at b1 p2-2) (Kbox-at b2 p3-2)))
)
