(define (problem Kwumpus-10)
(:domain Kwumpus)
;;SingleStateK
(:init
(not (at p1-1))
(alive )
(adj p1-1 p2-1)
(adj p2-1 p1-1)
(adj p1-2 p2-2)
(adj p2-2 p1-2)
(adj p1-3 p2-3)
(adj p2-3 p1-3)
(adj p1-4 p2-4)
(adj p2-4 p1-4)
(adj p1-5 p2-5)
(adj p2-5 p1-5)
(adj p1-6 p2-6)
(adj p2-6 p1-6)
(adj p1-7 p2-7)
(adj p2-7 p1-7)
(adj p1-8 p2-8)
(adj p2-8 p1-8)
(adj p1-9 p2-9)
(adj p2-9 p1-9)
(adj p1-10 p2-10)
(adj p2-10 p1-10)
(adj p2-1 p3-1)
(adj p3-1 p2-1)
(adj p2-2 p3-2)
(adj p3-2 p2-2)
(adj p2-3 p3-3)
(adj p3-3 p2-3)
(adj p2-4 p3-4)
(adj p3-4 p2-4)
(adj p2-5 p3-5)
(adj p3-5 p2-5)
(adj p2-6 p3-6)
(adj p3-6 p2-6)
(adj p2-7 p3-7)
(adj p3-7 p2-7)
(adj p2-8 p3-8)
(adj p3-8 p2-8)
(adj p2-9 p3-9)
(adj p3-9 p2-9)
(adj p2-10 p3-10)
(adj p3-10 p2-10)
(adj p3-1 p4-1)
(adj p4-1 p3-1)
(adj p3-2 p4-2)
(adj p4-2 p3-2)
(adj p3-3 p4-3)
(adj p4-3 p3-3)
(adj p3-4 p4-4)
(adj p4-4 p3-4)
(adj p3-5 p4-5)
(adj p4-5 p3-5)
(adj p3-6 p4-6)
(adj p4-6 p3-6)
(adj p3-7 p4-7)
(adj p4-7 p3-7)
(adj p3-8 p4-8)
(adj p4-8 p3-8)
(adj p3-9 p4-9)
(adj p4-9 p3-9)
(adj p3-10 p4-10)
(adj p4-10 p3-10)
(adj p4-1 p5-1)
(adj p5-1 p4-1)
(adj p4-2 p5-2)
(adj p5-2 p4-2)
(adj p4-3 p5-3)
(adj p5-3 p4-3)
(adj p4-4 p5-4)
(adj p5-4 p4-4)
(adj p4-5 p5-5)
(adj p5-5 p4-5)
(adj p4-6 p5-6)
(adj p5-6 p4-6)
(adj p4-7 p5-7)
(adj p5-7 p4-7)
(adj p4-8 p5-8)
(adj p5-8 p4-8)
(adj p4-9 p5-9)
(adj p5-9 p4-9)
(adj p4-10 p5-10)
(adj p5-10 p4-10)
(adj p5-1 p6-1)
(adj p6-1 p5-1)
(adj p5-2 p6-2)
(adj p6-2 p5-2)
(adj p5-3 p6-3)
(adj p6-3 p5-3)
(adj p5-4 p6-4)
(adj p6-4 p5-4)
(adj p5-5 p6-5)
(adj p6-5 p5-5)
(adj p5-6 p6-6)
(adj p6-6 p5-6)
(adj p5-7 p6-7)
(adj p6-7 p5-7)
(adj p5-8 p6-8)
(adj p6-8 p5-8)
(adj p5-9 p6-9)
(adj p6-9 p5-9)
(adj p5-10 p6-10)
(adj p6-10 p5-10)
(adj p6-1 p7-1)
(adj p7-1 p6-1)
(adj p6-2 p7-2)
(adj p7-2 p6-2)
(adj p6-3 p7-3)
(adj p7-3 p6-3)
(adj p6-4 p7-4)
(adj p7-4 p6-4)
(adj p6-5 p7-5)
(adj p7-5 p6-5)
(adj p6-6 p7-6)
(adj p7-6 p6-6)
(adj p6-7 p7-7)
(adj p7-7 p6-7)
(adj p6-8 p7-8)
(adj p7-8 p6-8)
(adj p6-9 p7-9)
(adj p7-9 p6-9)
(adj p6-10 p7-10)
(adj p7-10 p6-10)
(adj p7-1 p8-1)
(adj p8-1 p7-1)
(adj p7-2 p8-2)
(adj p8-2 p7-2)
(adj p7-3 p8-3)
(adj p8-3 p7-3)
(adj p7-4 p8-4)
(adj p8-4 p7-4)
(adj p7-5 p8-5)
(adj p8-5 p7-5)
(adj p7-6 p8-6)
(adj p8-6 p7-6)
(adj p7-7 p8-7)
(adj p8-7 p7-7)
(adj p7-8 p8-8)
(adj p8-8 p7-8)
(adj p7-9 p8-9)
(adj p8-9 p7-9)
(adj p7-10 p8-10)
(adj p8-10 p7-10)
(adj p8-1 p9-1)
(adj p9-1 p8-1)
(adj p8-2 p9-2)
(adj p9-2 p8-2)
(adj p8-3 p9-3)
(adj p9-3 p8-3)
(adj p8-4 p9-4)
(adj p9-4 p8-4)
(adj p8-5 p9-5)
(adj p9-5 p8-5)
(adj p8-6 p9-6)
(adj p9-6 p8-6)
(adj p8-7 p9-7)
(adj p9-7 p8-7)
(adj p8-8 p9-8)
(adj p9-8 p8-8)
(adj p8-9 p9-9)
(adj p9-9 p8-9)
(adj p8-10 p9-10)
(adj p9-10 p8-10)
(adj p9-1 p10-1)
(adj p10-1 p9-1)
(adj p9-2 p10-2)
(adj p10-2 p9-2)
(adj p9-3 p10-3)
(adj p10-3 p9-3)
(adj p9-4 p10-4)
(adj p10-4 p9-4)
(adj p9-5 p10-5)
(adj p10-5 p9-5)
(adj p9-6 p10-6)
(adj p10-6 p9-6)
(adj p9-7 p10-7)
(adj p10-7 p9-7)
(adj p9-8 p10-8)
(adj p10-8 p9-8)
(adj p9-9 p10-9)
(adj p10-9 p9-9)
(adj p9-10 p10-10)
(adj p10-10 p9-10)
(adj p1-1 p1-2)
(adj p1-2 p1-1)
(adj p2-1 p2-2)
(adj p2-2 p2-1)
(adj p3-1 p3-2)
(adj p3-2 p3-1)
(adj p4-1 p4-2)
(adj p4-2 p4-1)
(adj p5-1 p5-2)
(adj p5-2 p5-1)
(adj p6-1 p6-2)
(adj p6-2 p6-1)
(adj p7-1 p7-2)
(adj p7-2 p7-1)
(adj p8-1 p8-2)
(adj p8-2 p8-1)
(adj p9-1 p9-2)
(adj p9-2 p9-1)
(adj p10-1 p10-2)
(adj p10-2 p10-1)
(adj p1-2 p1-3)
(adj p1-3 p1-2)
(adj p2-2 p2-3)
(adj p2-3 p2-2)
(adj p3-2 p3-3)
(adj p3-3 p3-2)
(adj p4-2 p4-3)
(adj p4-3 p4-2)
(adj p5-2 p5-3)
(adj p5-3 p5-2)
(adj p6-2 p6-3)
(adj p6-3 p6-2)
(adj p7-2 p7-3)
(adj p7-3 p7-2)
(adj p8-2 p8-3)
(adj p8-3 p8-2)
(adj p9-2 p9-3)
(adj p9-3 p9-2)
(adj p10-2 p10-3)
(adj p10-3 p10-2)
(adj p1-3 p1-4)
(adj p1-4 p1-3)
(adj p2-3 p2-4)
(adj p2-4 p2-3)
(adj p3-3 p3-4)
(adj p3-4 p3-3)
(adj p4-3 p4-4)
(adj p4-4 p4-3)
(adj p5-3 p5-4)
(adj p5-4 p5-3)
(adj p6-3 p6-4)
(adj p6-4 p6-3)
(adj p7-3 p7-4)
(adj p7-4 p7-3)
(adj p8-3 p8-4)
(adj p8-4 p8-3)
(adj p9-3 p9-4)
(adj p9-4 p9-3)
(adj p10-3 p10-4)
(adj p10-4 p10-3)
(adj p1-4 p1-5)
(adj p1-5 p1-4)
(adj p2-4 p2-5)
(adj p2-5 p2-4)
(adj p3-4 p3-5)
(adj p3-5 p3-4)
(adj p4-4 p4-5)
(adj p4-5 p4-4)
(adj p5-4 p5-5)
(adj p5-5 p5-4)
(adj p6-4 p6-5)
(adj p6-5 p6-4)
(adj p7-4 p7-5)
(adj p7-5 p7-4)
(adj p8-4 p8-5)
(adj p8-5 p8-4)
(adj p9-4 p9-5)
(adj p9-5 p9-4)
(adj p10-4 p10-5)
(adj p10-5 p10-4)
(adj p1-5 p1-6)
(adj p1-6 p1-5)
(adj p2-5 p2-6)
(adj p2-6 p2-5)
(adj p3-5 p3-6)
(adj p3-6 p3-5)
(adj p4-5 p4-6)
(adj p4-6 p4-5)
(adj p5-5 p5-6)
(adj p5-6 p5-5)
(adj p6-5 p6-6)
(adj p6-6 p6-5)
(adj p7-5 p7-6)
(adj p7-6 p7-5)
(adj p8-5 p8-6)
(adj p8-6 p8-5)
(adj p9-5 p9-6)
(adj p9-6 p9-5)
(adj p10-5 p10-6)
(adj p10-6 p10-5)
(adj p1-6 p1-7)
(adj p1-7 p1-6)
(adj p2-6 p2-7)
(adj p2-7 p2-6)
(adj p3-6 p3-7)
(adj p3-7 p3-6)
(adj p4-6 p4-7)
(adj p4-7 p4-6)
(adj p5-6 p5-7)
(adj p5-7 p5-6)
(adj p6-6 p6-7)
(adj p6-7 p6-6)
(adj p7-6 p7-7)
(adj p7-7 p7-6)
(adj p8-6 p8-7)
(adj p8-7 p8-6)
(adj p9-6 p9-7)
(adj p9-7 p9-6)
(adj p10-6 p10-7)
(adj p10-7 p10-6)
(adj p1-7 p1-8)
(adj p1-8 p1-7)
(adj p2-7 p2-8)
(adj p2-8 p2-7)
(adj p3-7 p3-8)
(adj p3-8 p3-7)
(adj p4-7 p4-8)
(adj p4-8 p4-7)
(adj p5-7 p5-8)
(adj p5-8 p5-7)
(adj p6-7 p6-8)
(adj p6-8 p6-7)
(adj p7-7 p7-8)
(adj p7-8 p7-7)
(adj p8-7 p8-8)
(adj p8-8 p8-7)
(adj p9-7 p9-8)
(adj p9-8 p9-7)
(adj p10-7 p10-8)
(adj p10-8 p10-7)
(adj p1-8 p1-9)
(adj p1-9 p1-8)
(adj p2-8 p2-9)
(adj p2-9 p2-8)
(adj p3-8 p3-9)
(adj p3-9 p3-8)
(adj p4-8 p4-9)
(adj p4-9 p4-8)
(adj p5-8 p5-9)
(adj p5-9 p5-8)
(adj p6-8 p6-9)
(adj p6-9 p6-8)
(adj p7-8 p7-9)
(adj p7-9 p7-8)
(adj p8-8 p8-9)
(adj p8-9 p8-8)
(adj p9-8 p9-9)
(adj p9-9 p9-8)
(adj p10-8 p10-9)
(adj p10-9 p10-8)
(adj p1-9 p1-10)
(adj p1-10 p1-9)
(adj p2-9 p2-10)
(adj p2-10 p2-9)
(adj p3-9 p3-10)
(adj p3-10 p3-9)
(adj p4-9 p4-10)
(adj p4-10 p4-9)
(adj p5-9 p5-10)
(adj p5-10 p5-9)
(adj p6-9 p6-10)
(adj p6-10 p6-9)
(adj p7-9 p7-10)
(adj p7-10 p7-9)
(adj p8-9 p8-10)
(adj p8-10 p8-9)
(adj p9-9 p9-10)
(adj p9-10 p9-9)
(adj p10-9 p10-10)
(adj p10-10 p10-9)
(gold-at p10-10)
(safe p1-1)
(Ksafe p1-1)
(safe p2-1)
(Ksafe p2-1)
(safe p3-1)
(Ksafe p3-1)
(safe p4-1)
(Ksafe p4-1)
(safe p5-1)
(Ksafe p5-1)
(safe p6-1)
(Ksafe p6-1)
(safe p7-1)
(Ksafe p7-1)
(safe p8-1)
(Ksafe p8-1)
(safe p9-1)
(Ksafe p9-1)
(safe p10-1)
(Ksafe p10-1)
(safe p1-2)
(Ksafe p1-2)
(safe p1-3)
(Ksafe p1-3)
(safe p1-4)
(Ksafe p1-4)
(safe p1-5)
(Ksafe p1-5)
(safe p1-6)
(Ksafe p1-6)
(safe p1-7)
(Ksafe p1-7)
(safe p1-8)
(Ksafe p1-8)
(safe p1-9)
(Ksafe p1-9)
(safe p1-10)
(Ksafe p1-10)
(safe p2-2)
(Ksafe p2-2)
(safe p2-4)
(Ksafe p2-4)
(safe p2-5)
(Ksafe p2-5)
(safe p2-6)
(Ksafe p2-6)
(safe p2-7)
(Ksafe p2-7)
(safe p2-8)
(Ksafe p2-8)
(safe p2-9)
(Ksafe p2-9)
(safe p2-10)
(Ksafe p2-10)
(safe p3-3)
(Ksafe p3-3)
(safe p3-5)
(Ksafe p3-5)
(safe p3-6)
(Ksafe p3-6)
(safe p3-7)
(Ksafe p3-7)
(safe p3-8)
(Ksafe p3-8)
(safe p3-9)
(Ksafe p3-9)
(safe p3-10)
(Ksafe p3-10)
(safe p4-2)
(Ksafe p4-2)
(safe p4-4)
(Ksafe p4-4)
(safe p4-6)
(Ksafe p4-6)
(safe p4-7)
(Ksafe p4-7)
(safe p4-8)
(Ksafe p4-8)
(safe p4-9)
(Ksafe p4-9)
(safe p4-10)
(Ksafe p4-10)
(safe p5-2)
(Ksafe p5-2)
(safe p5-3)
(Ksafe p5-3)
(safe p5-5)
(Ksafe p5-5)
(safe p5-7)
(Ksafe p5-7)
(safe p5-8)
(Ksafe p5-8)
(safe p5-9)
(Ksafe p5-9)
(safe p5-10)
(Ksafe p5-10)
(safe p6-2)
(Ksafe p6-2)
(safe p6-3)
(Ksafe p6-3)
(safe p6-4)
(Ksafe p6-4)
(safe p6-6)
(Ksafe p6-6)
(safe p6-8)
(Ksafe p6-8)
(safe p6-9)
(Ksafe p6-9)
(safe p6-10)
(Ksafe p6-10)
(safe p7-2)
(Ksafe p7-2)
(safe p7-3)
(Ksafe p7-3)
(safe p7-4)
(Ksafe p7-4)
(safe p7-5)
(Ksafe p7-5)
(safe p7-7)
(Ksafe p7-7)
(safe p7-9)
(Ksafe p7-9)
(safe p7-10)
(Ksafe p7-10)
(safe p8-2)
(Ksafe p8-2)
(safe p8-3)
(Ksafe p8-3)
(safe p8-4)
(Ksafe p8-4)
(safe p8-5)
(Ksafe p8-5)
(safe p8-6)
(Ksafe p8-6)
(safe p8-8)
(Ksafe p8-8)
(safe p8-10)
(Ksafe p8-10)
(safe p9-2)
(Ksafe p9-2)
(safe p9-3)
(Ksafe p9-3)
(safe p9-4)
(Ksafe p9-4)
(safe p9-5)
(Ksafe p9-5)
(safe p9-6)
(Ksafe p9-6)
(safe p9-7)
(Ksafe p9-7)
(safe p9-9)
(Ksafe p9-9)
(safe p10-2)
(Ksafe p10-2)
(safe p10-3)
(Ksafe p10-3)
(safe p10-4)
(Ksafe p10-4)
(safe p10-5)
(Ksafe p10-5)
(safe p10-6)
(Ksafe p10-6)
(safe p10-7)
(Ksafe p10-7)
(safe p10-8)
(Ksafe p10-8)
(safe p10-10)
(Ksafe p10-10)
(not (at p1-2))
(not (at p1-3))
(not (at p1-4))
(not (at p1-5))
(not (at p1-6))
(not (at p1-7))
(not (at p1-8))
(not (at p1-9))
(not (at p1-10))
(not (at p2-1))
(not (at p2-2))
(not (at p2-3))
(at p2-4)
(not (at p2-5))
(not (at p2-6))
(not (at p2-7))
(not (at p2-8))
(not (at p2-9))
(not (at p2-10))
(not (at p3-1))
(not (at p3-2))
(not (at p3-3))
(not (at p3-4))
(not (at p3-5))
(not (at p3-6))
(not (at p3-7))
(not (at p3-8))
(not (at p3-9))
(not (at p3-10))
(not (at p4-1))
(not (at p4-2))
(not (at p4-3))
(not (at p4-4))
(not (at p4-5))
(not (at p4-6))
(not (at p4-7))
(not (at p4-8))
(not (at p4-9))
(not (at p4-10))
(not (at p5-1))
(not (at p5-2))
(not (at p5-3))
(not (at p5-4))
(not (at p5-5))
(not (at p5-6))
(not (at p5-7))
(not (at p5-8))
(not (at p5-9))
(not (at p5-10))
(not (at p6-1))
(not (at p6-2))
(not (at p6-3))
(not (at p6-4))
(not (at p6-5))
(not (at p6-6))
(not (at p6-7))
(not (at p6-8))
(not (at p6-9))
(not (at p6-10))
(not (at p7-1))
(not (at p7-2))
(not (at p7-3))
(not (at p7-4))
(not (at p7-5))
(not (at p7-6))
(not (at p7-7))
(not (at p7-8))
(not (at p7-9))
(not (at p7-10))
(not (at p8-1))
(not (at p8-2))
(not (at p8-3))
(not (at p8-4))
(not (at p8-5))
(not (at p8-6))
(not (at p8-7))
(not (at p8-8))
(not (at p8-9))
(not (at p8-10))
(not (at p9-1))
(not (at p9-2))
(not (at p9-3))
(not (at p9-4))
(not (at p9-5))
(not (at p9-6))
(not (at p9-7))
(not (at p9-8))
(not (at p9-9))
(not (at p9-10))
(not (at p10-1))
(not (at p10-2))
(not (at p10-3))
(not (at p10-4))
(not (at p10-5))
(not (at p10-6))
(not (at p10-7))
(not (at p10-8))
(not (at p10-9))
(not (at p10-10))
(not (wumpus-at p1-1))
(KNwumpus-at p1-1)
(not (wumpus-at p1-2))
(KNwumpus-at p1-2)
(not (wumpus-at p1-3))
(KNwumpus-at p1-3)
(not (wumpus-at p1-4))
(KNwumpus-at p1-4)
(not (wumpus-at p1-5))
(KNwumpus-at p1-5)
(not (wumpus-at p1-6))
(KNwumpus-at p1-6)
(not (wumpus-at p1-7))
(KNwumpus-at p1-7)
(not (wumpus-at p1-8))
(KNwumpus-at p1-8)
(not (wumpus-at p1-9))
(KNwumpus-at p1-9)
(not (wumpus-at p1-10))
(KNwumpus-at p1-10)
(not (wumpus-at p2-1))
(KNwumpus-at p2-1)
(not (wumpus-at p2-2))
(KNwumpus-at p2-2)
(not (wumpus-at p2-4))
(KNwumpus-at p2-4)
(not (wumpus-at p2-5))
(KNwumpus-at p2-5)
(not (wumpus-at p2-6))
(KNwumpus-at p2-6)
(not (wumpus-at p2-7))
(KNwumpus-at p2-7)
(not (wumpus-at p2-8))
(KNwumpus-at p2-8)
(not (wumpus-at p2-9))
(KNwumpus-at p2-9)
(not (wumpus-at p2-10))
(KNwumpus-at p2-10)
(not (wumpus-at p3-1))
(KNwumpus-at p3-1)
(not (wumpus-at p3-3))
(KNwumpus-at p3-3)
(not (wumpus-at p3-5))
(KNwumpus-at p3-5)
(not (wumpus-at p3-6))
(KNwumpus-at p3-6)
(not (wumpus-at p3-7))
(KNwumpus-at p3-7)
(not (wumpus-at p3-8))
(KNwumpus-at p3-8)
(not (wumpus-at p3-9))
(KNwumpus-at p3-9)
(not (wumpus-at p3-10))
(KNwumpus-at p3-10)
(not (wumpus-at p4-1))
(KNwumpus-at p4-1)
(not (wumpus-at p4-2))
(KNwumpus-at p4-2)
(not (wumpus-at p4-4))
(KNwumpus-at p4-4)
(not (wumpus-at p4-6))
(KNwumpus-at p4-6)
(not (wumpus-at p4-7))
(KNwumpus-at p4-7)
(not (wumpus-at p4-8))
(KNwumpus-at p4-8)
(not (wumpus-at p4-9))
(KNwumpus-at p4-9)
(not (wumpus-at p4-10))
(KNwumpus-at p4-10)
(not (wumpus-at p5-1))
(KNwumpus-at p5-1)
(not (wumpus-at p5-2))
(KNwumpus-at p5-2)
(not (wumpus-at p5-3))
(KNwumpus-at p5-3)
(not (wumpus-at p5-5))
(KNwumpus-at p5-5)
(not (wumpus-at p5-7))
(KNwumpus-at p5-7)
(not (wumpus-at p5-8))
(KNwumpus-at p5-8)
(not (wumpus-at p5-9))
(KNwumpus-at p5-9)
(not (wumpus-at p5-10))
(KNwumpus-at p5-10)
(not (wumpus-at p6-1))
(KNwumpus-at p6-1)
(not (wumpus-at p6-2))
(KNwumpus-at p6-2)
(not (wumpus-at p6-3))
(KNwumpus-at p6-3)
(not (wumpus-at p6-4))
(KNwumpus-at p6-4)
(not (wumpus-at p6-6))
(KNwumpus-at p6-6)
(not (wumpus-at p6-8))
(KNwumpus-at p6-8)
(not (wumpus-at p6-9))
(KNwumpus-at p6-9)
(not (wumpus-at p6-10))
(KNwumpus-at p6-10)
(not (wumpus-at p7-1))
(KNwumpus-at p7-1)
(not (wumpus-at p7-2))
(KNwumpus-at p7-2)
(not (wumpus-at p7-3))
(KNwumpus-at p7-3)
(not (wumpus-at p7-4))
(KNwumpus-at p7-4)
(not (wumpus-at p7-5))
(KNwumpus-at p7-5)
(not (wumpus-at p7-7))
(KNwumpus-at p7-7)
(not (wumpus-at p7-9))
(KNwumpus-at p7-9)
(not (wumpus-at p7-10))
(KNwumpus-at p7-10)
(not (wumpus-at p8-1))
(KNwumpus-at p8-1)
(not (wumpus-at p8-2))
(KNwumpus-at p8-2)
(not (wumpus-at p8-3))
(KNwumpus-at p8-3)
(not (wumpus-at p8-4))
(KNwumpus-at p8-4)
(not (wumpus-at p8-5))
(KNwumpus-at p8-5)
(not (wumpus-at p8-6))
(KNwumpus-at p8-6)
(not (wumpus-at p8-8))
(KNwumpus-at p8-8)
(not (wumpus-at p8-10))
(KNwumpus-at p8-10)
(not (wumpus-at p9-1))
(KNwumpus-at p9-1)
(not (wumpus-at p9-2))
(KNwumpus-at p9-2)
(not (wumpus-at p9-3))
(KNwumpus-at p9-3)
(not (wumpus-at p9-4))
(KNwumpus-at p9-4)
(not (wumpus-at p9-5))
(KNwumpus-at p9-5)
(not (wumpus-at p9-6))
(KNwumpus-at p9-6)
(not (wumpus-at p9-7))
(KNwumpus-at p9-7)
(not (wumpus-at p9-9))
(KNwumpus-at p9-9)
(not (wumpus-at p10-1))
(KNwumpus-at p10-1)
(not (wumpus-at p10-2))
(KNwumpus-at p10-2)
(not (wumpus-at p10-3))
(KNwumpus-at p10-3)
(not (wumpus-at p10-4))
(KNwumpus-at p10-4)
(not (wumpus-at p10-5))
(KNwumpus-at p10-5)
(not (wumpus-at p10-6))
(KNwumpus-at p10-6)
(not (wumpus-at p10-7))
(KNwumpus-at p10-7)
(not (wumpus-at p10-8))
(KNwumpus-at p10-8)
(not (wumpus-at p10-10))
(KNwumpus-at p10-10)
(not (stench p1-1))
(KNstench p1-1)
(not (stench p1-2))
(KNstench p1-2)
(not (stench p1-4))
(KNstench p1-4)
(not (stench p1-5))
(KNstench p1-5)
(not (stench p1-6))
(KNstench p1-6)
(not (stench p1-7))
(KNstench p1-7)
(not (stench p1-8))
(KNstench p1-8)
(not (stench p1-9))
(KNstench p1-9)
(not (stench p1-10))
(KNstench p1-10)
(not (stench p2-1))
(KNstench p2-1)
(not (stench p2-3))
(KNstench p2-3)
(not (stench p2-5))
(KNstench p2-5)
(not (stench p2-6))
(KNstench p2-6)
(not (stench p2-7))
(KNstench p2-7)
(not (stench p2-8))
(KNstench p2-8)
(not (stench p2-9))
(KNstench p2-9)
(not (stench p2-10))
(KNstench p2-10)
(not (stench p3-2))
(KNstench p3-2)
(not (stench p3-4))
(KNstench p3-4)
(not (stench p3-6))
(KNstench p3-6)
(not (stench p3-7))
(KNstench p3-7)
(not (stench p3-8))
(KNstench p3-8)
(not (stench p3-9))
(KNstench p3-9)
(not (stench p3-10))
(KNstench p3-10)
(not (stench p4-1))
(KNstench p4-1)
(not (stench p4-3))
(KNstench p4-3)
(not (stench p4-5))
(KNstench p4-5)
(not (stench p4-7))
(KNstench p4-7)
(not (stench p4-8))
(KNstench p4-8)
(not (stench p4-9))
(KNstench p4-9)
(not (stench p4-10))
(KNstench p4-10)
(not (stench p5-1))
(KNstench p5-1)
(not (stench p5-2))
(KNstench p5-2)
(not (stench p5-4))
(KNstench p5-4)
(not (stench p5-6))
(KNstench p5-6)
(not (stench p5-8))
(KNstench p5-8)
(not (stench p5-9))
(KNstench p5-9)
(not (stench p5-10))
(KNstench p5-10)
(not (stench p6-1))
(KNstench p6-1)
(not (stench p6-2))
(KNstench p6-2)
(not (stench p6-3))
(KNstench p6-3)
(not (stench p6-5))
(KNstench p6-5)
(not (stench p6-7))
(KNstench p6-7)
(not (stench p6-9))
(KNstench p6-9)
(not (stench p6-10))
(KNstench p6-10)
(not (stench p7-1))
(KNstench p7-1)
(not (stench p7-2))
(KNstench p7-2)
(not (stench p7-3))
(KNstench p7-3)
(not (stench p7-4))
(KNstench p7-4)
(not (stench p7-6))
(KNstench p7-6)
(not (stench p7-8))
(KNstench p7-8)
(not (stench p7-10))
(KNstench p7-10)
(not (stench p8-1))
(KNstench p8-1)
(not (stench p8-2))
(KNstench p8-2)
(not (stench p8-3))
(KNstench p8-3)
(not (stench p8-4))
(KNstench p8-4)
(not (stench p8-5))
(KNstench p8-5)
(not (stench p8-7))
(KNstench p8-7)
(not (stench p8-9))
(KNstench p8-9)
(not (stench p9-1))
(KNstench p9-1)
(not (stench p9-2))
(KNstench p9-2)
(not (stench p9-3))
(KNstench p9-3)
(not (stench p9-4))
(KNstench p9-4)
(not (stench p9-5))
(KNstench p9-5)
(not (stench p9-6))
(KNstench p9-6)
(not (stench p9-8))
(KNstench p9-8)
(not (stench p9-10))
(KNstench p9-10)
(not (stench p10-1))
(KNstench p10-1)
(not (stench p10-2))
(KNstench p10-2)
(not (stench p10-3))
(KNstench p10-3)
(not (stench p10-4))
(KNstench p10-4)
(not (stench p10-5))
(KNstench p10-5)
(not (stench p10-6))
(KNstench p10-6)
(not (stench p10-7))
(KNstench p10-7)
(not (stench p10-9))
(KNstench p10-9)
(not (gold-at p1-1))
(not (gold-at p1-2))
(not (gold-at p1-3))
(not (gold-at p1-4))
(not (gold-at p1-5))
(not (gold-at p1-6))
(not (gold-at p1-7))
(not (gold-at p1-8))
(not (gold-at p1-9))
(not (gold-at p1-10))
(not (gold-at p2-1))
(not (gold-at p2-2))
(not (gold-at p2-3))
(not (gold-at p2-4))
(not (gold-at p2-5))
(not (gold-at p2-6))
(not (gold-at p2-7))
(not (gold-at p2-8))
(not (gold-at p2-9))
(not (gold-at p2-10))
(not (gold-at p3-1))
(not (gold-at p3-2))
(not (gold-at p3-3))
(not (gold-at p3-4))
(not (gold-at p3-5))
(not (gold-at p3-6))
(not (gold-at p3-7))
(not (gold-at p3-8))
(not (gold-at p3-9))
(not (gold-at p3-10))
(not (gold-at p4-1))
(not (gold-at p4-2))
(not (gold-at p4-3))
(not (gold-at p4-4))
(not (gold-at p4-5))
(not (gold-at p4-6))
(not (gold-at p4-7))
(not (gold-at p4-8))
(not (gold-at p4-9))
(not (gold-at p4-10))
(not (gold-at p5-1))
(not (gold-at p5-2))
(not (gold-at p5-3))
(not (gold-at p5-4))
(not (gold-at p5-5))
(not (gold-at p5-6))
(not (gold-at p5-7))
(not (gold-at p5-8))
(not (gold-at p5-9))
(not (gold-at p5-10))
(not (gold-at p6-1))
(not (gold-at p6-2))
(not (gold-at p6-3))
(not (gold-at p6-4))
(not (gold-at p6-5))
(not (gold-at p6-6))
(not (gold-at p6-7))
(not (gold-at p6-8))
(not (gold-at p6-9))
(not (gold-at p6-10))
(not (gold-at p7-1))
(not (gold-at p7-2))
(not (gold-at p7-3))
(not (gold-at p7-4))
(not (gold-at p7-5))
(not (gold-at p7-6))
(not (gold-at p7-7))
(not (gold-at p7-8))
(not (gold-at p7-9))
(not (gold-at p7-10))
(not (gold-at p8-1))
(not (gold-at p8-2))
(not (gold-at p8-3))
(not (gold-at p8-4))
(not (gold-at p8-5))
(not (gold-at p8-6))
(not (gold-at p8-7))
(not (gold-at p8-8))
(not (gold-at p8-9))
(not (gold-at p8-10))
(not (gold-at p9-1))
(not (gold-at p9-2))
(not (gold-at p9-3))
(not (gold-at p9-4))
(not (gold-at p9-5))
(not (gold-at p9-6))
(not (gold-at p9-7))
(not (gold-at p9-8))
(not (gold-at p9-9))
(not (gold-at p9-10))
(not (gold-at p10-1))
(not (gold-at p10-2))
(not (gold-at p10-3))
(not (gold-at p10-4))
(not (gold-at p10-5))
(not (gold-at p10-6))
(not (gold-at p10-7))
(not (gold-at p10-8))
(not (gold-at p10-9))
(not (got-the-treasure ))
(not (breeze p1-1))
(KNbreeze p1-1)
(not (breeze p1-2))
(KNbreeze p1-2)
(not (breeze p1-4))
(KNbreeze p1-4)
(not (breeze p1-5))
(KNbreeze p1-5)
(not (breeze p1-6))
(KNbreeze p1-6)
(not (breeze p1-7))
(KNbreeze p1-7)
(not (breeze p1-8))
(KNbreeze p1-8)
(not (breeze p1-9))
(KNbreeze p1-9)
(not (breeze p1-10))
(KNbreeze p1-10)
(not (breeze p2-1))
(KNbreeze p2-1)
(not (breeze p2-3))
(KNbreeze p2-3)
(not (breeze p2-5))
(KNbreeze p2-5)
(not (breeze p2-6))
(KNbreeze p2-6)
(not (breeze p2-7))
(KNbreeze p2-7)
(not (breeze p2-8))
(KNbreeze p2-8)
(not (breeze p2-9))
(KNbreeze p2-9)
(not (breeze p2-10))
(KNbreeze p2-10)
(not (breeze p3-2))
(KNbreeze p3-2)
(not (breeze p3-4))
(KNbreeze p3-4)
(not (breeze p3-6))
(KNbreeze p3-6)
(not (breeze p3-7))
(KNbreeze p3-7)
(not (breeze p3-8))
(KNbreeze p3-8)
(not (breeze p3-9))
(KNbreeze p3-9)
(not (breeze p3-10))
(KNbreeze p3-10)
(not (breeze p4-1))
(KNbreeze p4-1)
(not (breeze p4-3))
(KNbreeze p4-3)
(not (breeze p4-5))
(KNbreeze p4-5)
(not (breeze p4-7))
(KNbreeze p4-7)
(not (breeze p4-8))
(KNbreeze p4-8)
(not (breeze p4-9))
(KNbreeze p4-9)
(not (breeze p4-10))
(KNbreeze p4-10)
(not (breeze p5-1))
(KNbreeze p5-1)
(not (breeze p5-2))
(KNbreeze p5-2)
(not (breeze p5-4))
(KNbreeze p5-4)
(not (breeze p5-6))
(KNbreeze p5-6)
(not (breeze p5-8))
(KNbreeze p5-8)
(not (breeze p5-9))
(KNbreeze p5-9)
(not (breeze p5-10))
(KNbreeze p5-10)
(not (breeze p6-1))
(KNbreeze p6-1)
(not (breeze p6-2))
(KNbreeze p6-2)
(not (breeze p6-3))
(KNbreeze p6-3)
(not (breeze p6-5))
(KNbreeze p6-5)
(not (breeze p6-7))
(KNbreeze p6-7)
(not (breeze p6-9))
(KNbreeze p6-9)
(not (breeze p6-10))
(KNbreeze p6-10)
(not (breeze p7-1))
(KNbreeze p7-1)
(not (breeze p7-2))
(KNbreeze p7-2)
(not (breeze p7-3))
(KNbreeze p7-3)
(not (breeze p7-4))
(KNbreeze p7-4)
(not (breeze p7-6))
(KNbreeze p7-6)
(not (breeze p7-8))
(KNbreeze p7-8)
(not (breeze p7-10))
(KNbreeze p7-10)
(not (breeze p8-1))
(KNbreeze p8-1)
(not (breeze p8-2))
(KNbreeze p8-2)
(not (breeze p8-3))
(KNbreeze p8-3)
(not (breeze p8-4))
(KNbreeze p8-4)
(not (breeze p8-5))
(KNbreeze p8-5)
(not (breeze p8-7))
(KNbreeze p8-7)
(not (breeze p8-9))
(KNbreeze p8-9)
(not (breeze p9-1))
(KNbreeze p9-1)
(not (breeze p9-2))
(KNbreeze p9-2)
(not (breeze p9-3))
(KNbreeze p9-3)
(not (breeze p9-4))
(KNbreeze p9-4)
(not (breeze p9-5))
(KNbreeze p9-5)
(not (breeze p9-6))
(KNbreeze p9-6)
(not (breeze p9-8))
(KNbreeze p9-8)
(not (breeze p9-10))
(KNbreeze p9-10)
(not (breeze p10-1))
(KNbreeze p10-1)
(not (breeze p10-2))
(KNbreeze p10-2)
(not (breeze p10-3))
(KNbreeze p10-3)
(not (breeze p10-4))
(KNbreeze p10-4)
(not (breeze p10-5))
(KNbreeze p10-5)
(not (breeze p10-6))
(KNbreeze p10-6)
(not (breeze p10-7))
(KNbreeze p10-7)
(not (breeze p10-9))
(KNbreeze p10-9)
(not (pit-at p1-1))
(KNpit-at p1-1)
(not (pit-at p1-2))
(KNpit-at p1-2)
(not (pit-at p1-3))
(KNpit-at p1-3)
(not (pit-at p1-4))
(KNpit-at p1-4)
(not (pit-at p1-5))
(KNpit-at p1-5)
(not (pit-at p1-6))
(KNpit-at p1-6)
(not (pit-at p1-7))
(KNpit-at p1-7)
(not (pit-at p1-8))
(KNpit-at p1-8)
(not (pit-at p1-9))
(KNpit-at p1-9)
(not (pit-at p1-10))
(KNpit-at p1-10)
(not (pit-at p2-1))
(KNpit-at p2-1)
(not (pit-at p2-2))
(KNpit-at p2-2)
(not (pit-at p2-4))
(KNpit-at p2-4)
(not (pit-at p2-5))
(KNpit-at p2-5)
(not (pit-at p2-6))
(KNpit-at p2-6)
(not (pit-at p2-7))
(KNpit-at p2-7)
(not (pit-at p2-8))
(KNpit-at p2-8)
(not (pit-at p2-9))
(KNpit-at p2-9)
(not (pit-at p2-10))
(KNpit-at p2-10)
(not (pit-at p3-1))
(KNpit-at p3-1)
(not (pit-at p3-3))
(KNpit-at p3-3)
(not (pit-at p3-5))
(KNpit-at p3-5)
(not (pit-at p3-6))
(KNpit-at p3-6)
(not (pit-at p3-7))
(KNpit-at p3-7)
(not (pit-at p3-8))
(KNpit-at p3-8)
(not (pit-at p3-9))
(KNpit-at p3-9)
(not (pit-at p3-10))
(KNpit-at p3-10)
(not (pit-at p4-1))
(KNpit-at p4-1)
(not (pit-at p4-2))
(KNpit-at p4-2)
(not (pit-at p4-4))
(KNpit-at p4-4)
(not (pit-at p4-6))
(KNpit-at p4-6)
(not (pit-at p4-7))
(KNpit-at p4-7)
(not (pit-at p4-8))
(KNpit-at p4-8)
(not (pit-at p4-9))
(KNpit-at p4-9)
(not (pit-at p4-10))
(KNpit-at p4-10)
(not (pit-at p5-1))
(KNpit-at p5-1)
(not (pit-at p5-2))
(KNpit-at p5-2)
(not (pit-at p5-3))
(KNpit-at p5-3)
(not (pit-at p5-5))
(KNpit-at p5-5)
(not (pit-at p5-7))
(KNpit-at p5-7)
(not (pit-at p5-8))
(KNpit-at p5-8)
(not (pit-at p5-9))
(KNpit-at p5-9)
(not (pit-at p5-10))
(KNpit-at p5-10)
(not (pit-at p6-1))
(KNpit-at p6-1)
(not (pit-at p6-2))
(KNpit-at p6-2)
(not (pit-at p6-3))
(KNpit-at p6-3)
(not (pit-at p6-4))
(KNpit-at p6-4)
(not (pit-at p6-6))
(KNpit-at p6-6)
(not (pit-at p6-8))
(KNpit-at p6-8)
(not (pit-at p6-9))
(KNpit-at p6-9)
(not (pit-at p6-10))
(KNpit-at p6-10)
(not (pit-at p7-1))
(KNpit-at p7-1)
(not (pit-at p7-2))
(KNpit-at p7-2)
(not (pit-at p7-3))
(KNpit-at p7-3)
(not (pit-at p7-4))
(KNpit-at p7-4)
(not (pit-at p7-5))
(KNpit-at p7-5)
(not (pit-at p7-7))
(KNpit-at p7-7)
(not (pit-at p7-9))
(KNpit-at p7-9)
(not (pit-at p7-10))
(KNpit-at p7-10)
(not (pit-at p8-1))
(KNpit-at p8-1)
(not (pit-at p8-2))
(KNpit-at p8-2)
(not (pit-at p8-3))
(KNpit-at p8-3)
(not (pit-at p8-4))
(KNpit-at p8-4)
(not (pit-at p8-5))
(KNpit-at p8-5)
(not (pit-at p8-6))
(KNpit-at p8-6)
(not (pit-at p8-8))
(KNpit-at p8-8)
(not (pit-at p8-10))
(KNpit-at p8-10)
(not (pit-at p9-1))
(KNpit-at p9-1)
(not (pit-at p9-2))
(KNpit-at p9-2)
(not (pit-at p9-3))
(KNpit-at p9-3)
(not (pit-at p9-4))
(KNpit-at p9-4)
(not (pit-at p9-5))
(KNpit-at p9-5)
(not (pit-at p9-6))
(KNpit-at p9-6)
(not (pit-at p9-7))
(KNpit-at p9-7)
(not (pit-at p9-9))
(KNpit-at p9-9)
(not (pit-at p10-1))
(KNpit-at p10-1)
(not (pit-at p10-2))
(KNpit-at p10-2)
(not (pit-at p10-3))
(KNpit-at p10-3)
(not (pit-at p10-4))
(KNpit-at p10-4)
(not (pit-at p10-5))
(KNpit-at p10-5)
(not (pit-at p10-6))
(KNpit-at p10-6)
(not (pit-at p10-7))
(KNpit-at p10-7)
(not (pit-at p10-8))
(KNpit-at p10-8)
(not (pit-at p10-10))
(KNpit-at p10-10)
(stench p8-10)
(Kstench p8-10)
(not (breeze p8-10))
(KNbreeze p8-10)
(not (pit-at p8-9))
(KNpit-at p8-9)
(not (pit-at p9-10))
(KNpit-at p9-10)
(stench p7-9)
(Kstench p7-9)
(breeze p7-9)
(Kbreeze p7-9)
(pit-at p7-8)
(Kpit-at p7-8)
(not (safe p7-8))
(KNsafe p7-8)
(breeze p6-8)
(Kbreeze p6-8)
(breeze p7-7)
(Kbreeze p7-7)
(breeze p8-8)
(Kbreeze p8-8)
(safe p8-7)
(Ksafe p8-7)
(not (wumpus-at p8-7))
(KNwumpus-at p8-7)
(not (pit-at p8-7))
(KNpit-at p8-7)
(stench p5-7)
(Kstench p5-7)
(not (breeze p5-7))
(KNbreeze p5-7)
(not (pit-at p5-6))
(KNpit-at p5-6)
(not (pit-at p6-7))
(KNpit-at p6-7)
(stench p4-6)
(Kstench p4-6)
(breeze p4-6)
(Kbreeze p4-6)
(pit-at p4-5)
(Kpit-at p4-5)
(not (safe p4-5))
(KNsafe p4-5)
(breeze p3-5)
(Kbreeze p3-5)
(breeze p4-4)
(Kbreeze p4-4)
(breeze p5-5)
(Kbreeze p5-5)
(safe p5-4)
(Ksafe p5-4)
(not (wumpus-at p5-4))
(KNwumpus-at p5-4)
(not (pit-at p5-4))
(KNpit-at p5-4)
(stench p2-4)
(Kstench p2-4)
(not (breeze p2-4))
(KNbreeze p2-4)
(not (pit-at p2-3))
(KNpit-at p2-3)
(not (pit-at p3-4))
(KNpit-at p3-4)
(not (breeze p1-3))
(KNbreeze p1-3)
(safe p2-3)
(not (safe p3-2))
(not (wumpus-at p2-3))
(not (stench p1-3))
(wumpus-at p3-4)
(not (safe p3-4))
(stench p3-3)
(stench p3-5)
(stench p4-4)
(safe p4-3)
(not (wumpus-at p4-3))
(not (pit-at p4-3))
(not (stench p5-3))
(not (breeze p5-3))
(safe p5-6)
(not (safe p6-5))
(not (wumpus-at p5-6))
(wumpus-at p4-5)
(wumpus-at p6-7)
(stench p5-5)
(not (safe p6-7))
(stench p6-6)
(stench p6-8)
(stench p7-7)
(safe p7-6)
(not (wumpus-at p7-6))
(not (pit-at p7-6))
(not (stench p8-6))
(not (breeze p8-6))
(safe p8-9)
(not (safe p9-8))
(not (wumpus-at p8-9))
(wumpus-at p7-8)
(wumpus-at p9-10)
(stench p8-8)
(not (safe p9-10))
(stench p9-9)
(stench p10-10)
(safe p10-9)
(not (wumpus-at p10-9))
(not (pit-at p10-9))
(not (breeze p10-10))
(wumpus-at p3-2)
(stench p3-1)
(stench p2-2)
(stench p4-2)
(pit-at p3-2)
(breeze p3-1)
(breeze p2-2)
(breeze p4-2)
(breeze p3-3)
(wumpus-at p6-5)
(stench p6-4)
(stench p7-5)
(pit-at p6-5)
(breeze p6-4)
(breeze p7-5)
(breeze p6-6)
(wumpus-at p9-8)
(stench p9-7)
(stench p10-8)
(pit-at p9-8)
(breeze p9-7)
(breeze p10-8)
(breeze p9-9)
)
(:goal 
(and (got-the-treasure ) (alive )))
)
