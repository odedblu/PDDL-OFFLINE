(define (problem RockSample4-2)
(:domain RockSample4-2)
(:init
	(agent-at p3-3)
	(rock-at r0 p4-2)
	(rock-at r1 p1-4)
	(antena-height h0)
	(adj p1-1 p1-2)
	(adj p1-1 p2-1)
	(adj p1-2 p1-1)
	(adj p1-2 p1-3)
	(adj p1-2 p2-2)
	(adj p1-3 p1-2)
	(adj p1-3 p1-4)
	(adj p1-3 p2-3)
	(adj p1-4 p1-3)
	(adj p1-4 p2-4)
	(adj p2-1 p1-1)
	(adj p2-1 p2-2)
	(adj p2-1 p3-1)
	(adj p2-2 p1-2)
	(adj p2-2 p2-1)
	(adj p2-2 p2-3)
	(adj p2-2 p3-2)
	(adj p2-3 p1-3)
	(adj p2-3 p2-2)
	(adj p2-3 p2-4)
	(adj p2-3 p3-3)
	(adj p2-4 p1-4)
	(adj p2-4 p2-3)
	(adj p2-4 p3-4)
	(adj p3-1 p2-1)
	(adj p3-1 p3-2)
	(adj p3-1 p4-1)
	(adj p3-2 p2-2)
	(adj p3-2 p3-1)
	(adj p3-2 p3-3)
	(adj p3-2 p4-2)
	(adj p3-3 p2-3)
	(adj p3-3 p3-2)
	(adj p3-3 p3-4)
	(adj p3-3 p4-3)
	(adj p3-4 p2-4)
	(adj p3-4 p3-3)
	(adj p3-4 p4-4)
	(adj p4-1 p3-1)
	(adj p4-1 p4-2)
	(adj p4-2 p3-2)
	(adj p4-2 p4-1)
	(adj p4-2 p4-3)
	(adj p4-3 p3-3)
	(adj p4-3 p4-2)
	(adj p4-3 p4-4)
	(adj p4-4 p3-4)
	(adj p4-4 p4-3)
	(invariant (good r0) (not (good r0)))
	(invariant (good r1) (not (good r1)))
)
(:hidden
	(good r0)
	(not (good r1))
)
(:goal 
(and (not (good r0)) (not (good r1))))
)
