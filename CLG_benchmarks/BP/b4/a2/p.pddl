(define 
(problem box-4)
(:domain box-4-a2)
(:goal (and (done-goal)))
(:init (and 
	(init-916_observe-box_p3-1_a3_b1)
	(agent-at a2 p5-1)
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
	(not (heavy b0))
	(heavy b1)
	(heavy b2)
	(not (agent-at a2 p1-1))
	(not (agent-at a2 p1-2))
	(not (agent-at a2 p2-1))
	(not (agent-at a2 p2-2))
	(not (agent-at a2 p3-1))
	(not (agent-at a2 p3-2))
	(not (agent-at a2 p4-1))
	(not (agent-at a2 p4-2))
	(not (agent-at a2 p5-2))
	(not (box-at b0 p2-1))
	(not (box-at b0 p2-2))
	(not (box-at b0 p3-1))
	(not (box-at b0 p3-2))
	(not (box-at b0 p4-1))
	(not (box-at b0 p4-2))
	(not (box-at b0 p5-1))
	(not (box-at b0 p5-2))
	(not (box-at b1 p1-1))
	(not (box-at b1 p1-2))
	(not (box-at b1 p2-1))
	(not (box-at b1 p2-2))
	(not (box-at b1 p4-1))
	(not (box-at b1 p4-2))
	(not (box-at b1 p5-1))
	(not (box-at b1 p5-2))
	(not (box-at b2 p1-1))
	(not (box-at b2 p1-2))
	(not (box-at b2 p2-1))
	(not (box-at b2 p2-2))
	(not (box-at b2 p3-1))
	(not (box-at b2 p3-2))
	(not (box-at b2 p4-1))
	(not (box-at b2 p4-2))
	
(oneof (box-at b0 p1-1) (box-at b0 p1-2))
	
(oneof (box-at b1 p3-1) (box-at b1 p3-2))
	
(oneof (box-at b2 p5-1) (box-at b2 p5-2))
) )
)