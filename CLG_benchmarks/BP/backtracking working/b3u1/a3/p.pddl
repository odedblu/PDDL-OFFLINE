(define 
(problem box-3)
(:domain box-3-a3)
(:goal (and (done-goal)))
(:init (and 
	(init-zgr_observe-box-a1_p2-2_b1)
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
	(not (observe-124 ))
	(not (c-p-a-124 ))
	(heavy b1)
	(not (heavy b0))
	(not (agent-at a3 p1-1))
	(not (agent-at a3 p1-2))
	(not (agent-at a3 p2-1))
	(not (agent-at a3 p2-2))
	(not (agent-at a3 p3-2))
	(not (box-at b0 p2-1))
	(not (box-at b0 p2-2))
	(not (box-at b0 p3-1))
	(not (box-at b0 p3-2))
	(not (box-at b1 p1-1))
	(not (box-at b1 p1-2))
	(not (box-at b1 p3-1))
	(not (box-at b1 p3-2))
	
(oneof (box-at b0 p1-1) (box-at b0 p1-2))
	
(oneof (box-at b1 p2-1) (box-at b1 p2-2))
) )
)