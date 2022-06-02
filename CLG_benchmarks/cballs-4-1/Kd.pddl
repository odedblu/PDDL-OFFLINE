(define (domain Kcolorballs)
(:requirements :strips :typing)
;;BestCase
(:types pos obj col gar)
(:constants
 o1 - obj
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 red - col
 blue - col
 purple - col
 green - col
 t1 - gar
 t2 - gar
 t3 - gar
 t4 - gar
)

(:predicates
(Kcolor ?o - obj ?c - col)
(KNcolor ?o - obj ?c - col)
(NotKcolor ?o - obj ?c - col)
(trashed ?o - obj)
(garbage-color ?t - gar ?c - col)
(garbage-at ?t - gar ?p - pos)
(adj ?i - pos ?j - pos)
(at ?i - pos)
(holding ?o - obj)
(Kobj-at ?o - obj ?i - pos)
(KNobj-at ?o - obj ?i - pos)
(NotKobj-at ?o - obj ?i - pos)
)

(:action observe-colorT
 :parameters (?c - col ?o - obj )
 :precondition 
(and (holding ?o) (NotKcolor ?o ?c))
 :effect 
(and (Kcolor ?o ?c) (not (NotKcolor ?o ?c)))
)
(:action observe-colorF
 :parameters (?c - col ?o - obj )
 :precondition 
(and (holding ?o) (NotKcolor ?o ?c))
 :effect 
(and (KNcolor ?o ?c) (not (NotKcolor ?o ?c)))
)
(:action observe-ballT
 :parameters (?pos - pos ?o - obj )
 :precondition 
(and (at ?pos) (NotKobj-at ?o ?pos))
 :effect 
(and (Kobj-at ?o ?pos) (not (NotKobj-at ?o ?pos)))
)
(:action observe-ballF
 :parameters (?pos - pos ?o - obj )
 :precondition 
(and (at ?pos) (NotKobj-at ?o ?pos))
 :effect 
(and (KNobj-at ?o ?pos) (not (NotKobj-at ?o ?pos)))
)
(:action move
 :parameters (?i - pos ?j - pos )
 :precondition 
(and (adj ?i ?j) (at ?i))
 :effect 
(and (not (at ?i)) (at ?j))
)
(:action pickup
 :parameters (?o - obj ?i - pos )
 :precondition 
(and (at ?i) (Kobj-at ?o ?i))
 :effect 
(and (holding ?o) (KNobj-at ?o ?i))
)
(:action trash
 :parameters (?o - obj ?c - col ?t - gar ?p - pos )
 :precondition 
(and (Kcolor ?o ?c) (holding ?o) (garbage-at ?t ?p) (at ?p) (garbage-color ?t ?c))
 :effect (trashed ?o)
)
(:action R0
:precondition (and(Kobj-at o1 p1-2))
:effect (and(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R1
:precondition (and(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p1-2)(not (NotKobj-at o1 p1-2)))
)
(:action R2
:precondition (and(Kobj-at o1 p1-3))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R3
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p1-3)(not (NotKobj-at o1 p1-3)))
)
(:action R4
:precondition (and(Kobj-at o1 p2-1))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R5
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p2-1)(not (NotKobj-at o1 p2-1)))
)
(:action R6
:precondition (and(Kobj-at o1 p2-2))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R7
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p2-2)(not (NotKobj-at o1 p2-2)))
)
(:action R8
:precondition (and(Kobj-at o1 p2-3))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R9
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p2-3)(not (NotKobj-at o1 p2-3)))
)
(:action R10
:precondition (and(Kobj-at o1 p2-4))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R11
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p2-4)(not (NotKobj-at o1 p2-4)))
)
(:action R12
:precondition (and(Kobj-at o1 p3-1))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R13
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p3-1)(not (NotKobj-at o1 p3-1)))
)
(:action R14
:precondition (and(Kobj-at o1 p3-2))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R15
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p3-2)(not (NotKobj-at o1 p3-2)))
)
(:action R16
:precondition (and(Kobj-at o1 p3-3))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R17
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p3-3)(not (NotKobj-at o1 p3-3)))
)
(:action R18
:precondition (and(Kobj-at o1 p3-4))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p4-2))(not (NotKobj-at o1 p4-3)))
)
(:action R19
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p4-2)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p3-4)(not (NotKobj-at o1 p3-4)))
)
(:action R20
:precondition (and(Kobj-at o1 p4-2))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-3)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-3)))
)
(:action R21
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-3))
:effect (and(Kobj-at o1 p4-2)(not (NotKobj-at o1 p4-2)))
)
(:action R22
:precondition (and(Kobj-at o1 p4-3))
:effect (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2)(not (NotKobj-at o1 p1-2))(not (NotKobj-at o1 p1-3))(not (NotKobj-at o1 p2-1))(not (NotKobj-at o1 p2-2))(not (NotKobj-at o1 p2-3))(not (NotKobj-at o1 p2-4))(not (NotKobj-at o1 p3-1))(not (NotKobj-at o1 p3-2))(not (NotKobj-at o1 p3-3))(not (NotKobj-at o1 p3-4))(not (NotKobj-at o1 p4-2)))
)
(:action R23
:precondition (and(KNobj-at o1 p1-2)(KNobj-at o1 p1-3)(KNobj-at o1 p2-1)(KNobj-at o1 p2-2)(KNobj-at o1 p2-3)(KNobj-at o1 p2-4)(KNobj-at o1 p3-1)(KNobj-at o1 p3-2)(KNobj-at o1 p3-3)(KNobj-at o1 p3-4)(KNobj-at o1 p4-2))
:effect (and(Kobj-at o1 p4-3)(not (NotKobj-at o1 p4-3)))
)
(:action R24
:precondition (and(Kcolor o1 red))
:effect (and(KNcolor o1 blue)(KNcolor o1 green)(KNcolor o1 purple)(not (NotKcolor o1 blue))(not (NotKcolor o1 green))(not (NotKcolor o1 purple)))
)
(:action R25
:precondition (and(KNcolor o1 blue)(KNcolor o1 green)(KNcolor o1 purple))
:effect (and(Kcolor o1 red)(not (NotKcolor o1 red)))
)
(:action R26
:precondition (and(Kcolor o1 blue))
:effect (and(KNcolor o1 red)(KNcolor o1 green)(KNcolor o1 purple)(not (NotKcolor o1 red))(not (NotKcolor o1 green))(not (NotKcolor o1 purple)))
)
(:action R27
:precondition (and(KNcolor o1 red)(KNcolor o1 green)(KNcolor o1 purple))
:effect (and(Kcolor o1 blue)(not (NotKcolor o1 blue)))
)
(:action R28
:precondition (and(Kcolor o1 green))
:effect (and(KNcolor o1 red)(KNcolor o1 blue)(KNcolor o1 purple)(not (NotKcolor o1 red))(not (NotKcolor o1 blue))(not (NotKcolor o1 purple)))
)
(:action R29
:precondition (and(KNcolor o1 red)(KNcolor o1 blue)(KNcolor o1 purple))
:effect (and(Kcolor o1 green)(not (NotKcolor o1 green)))
)
(:action R30
:precondition (and(Kcolor o1 purple))
:effect (and(KNcolor o1 red)(KNcolor o1 blue)(KNcolor o1 green)(not (NotKcolor o1 red))(not (NotKcolor o1 blue))(not (NotKcolor o1 green)))
)
(:action R31
:precondition (and(KNcolor o1 red)(KNcolor o1 blue)(KNcolor o1 green))
:effect (and(Kcolor o1 purple)(not (NotKcolor o1 purple)))
)
)
