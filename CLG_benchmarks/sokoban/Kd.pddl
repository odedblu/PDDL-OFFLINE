(define (domain Ksokoban-sequential)
(:requirements :strips :typing)
(:types location direction player stone TAG_TYPE VALUE_TYPE)
(:constants
 dir-down - direction
 dir-left - direction
 dir-right - direction
 dir-up - direction
 player-01 - player
 pos-01-01 - location
 pos-01-02 - location
 pos-01-03 - location
 pos-01-04 - location
 pos-01-05 - location
 pos-01-06 - location
 pos-01-07 - location
 pos-01-08 - location
 pos-01-09 - location
 pos-02-01 - location
 pos-02-02 - location
 pos-02-03 - location
 pos-02-04 - location
 pos-02-05 - location
 pos-02-06 - location
 pos-02-07 - location
 pos-02-08 - location
 pos-02-09 - location
 pos-03-01 - location
 pos-03-02 - location
 pos-03-03 - location
 pos-03-04 - location
 pos-03-05 - location
 pos-03-06 - location
 pos-03-07 - location
 pos-03-08 - location
 pos-03-09 - location
 pos-04-01 - location
 pos-04-02 - location
 pos-04-03 - location
 pos-04-04 - location
 pos-04-05 - location
 pos-04-06 - location
 pos-04-07 - location
 pos-04-08 - location
 pos-04-09 - location
 pos-05-01 - location
 pos-05-02 - location
 pos-05-03 - location
 pos-05-04 - location
 pos-05-05 - location
 pos-05-06 - location
 pos-05-07 - location
 pos-05-08 - location
 pos-05-09 - location
 pos-06-01 - location
 pos-06-02 - location
 pos-06-03 - location
 pos-06-04 - location
 pos-06-05 - location
 pos-06-06 - location
 pos-06-07 - location
 pos-06-08 - location
 pos-06-09 - location
 pos-07-01 - location
 pos-07-02 - location
 pos-07-03 - location
 pos-07-04 - location
 pos-07-05 - location
 pos-07-06 - location
 pos-07-07 - location
 pos-07-08 - location
 pos-07-09 - location
 pos-08-01 - location
 pos-08-02 - location
 pos-08-03 - location
 pos-08-04 - location
 pos-08-05 - location
 pos-08-06 - location
 pos-08-07 - location
 pos-08-08 - location
 pos-08-09 - location
 pos-09-01 - location
 pos-09-02 - location
 pos-09-03 - location
 pos-09-04 - location
 pos-09-05 - location
 pos-09-06 - location
 pos-09-07 - location
 pos-09-08 - location
 pos-09-09 - location
 stone-01 - stone
 stone-02 - stone
 stone-03 - stone
 dir-down - direction
 dir-left - direction
 dir-right - direction
 dir-up - direction
 player-01 - player
 pos-01-02 - location
 pos-01-03 - location
 pos-01-04 - location
 pos-01-05 - location
 pos-01-06 - location
 pos-01-07 - location
 pos-01-08 - location
 pos-01-09 - location
 pos-02-01 - location
 pos-02-02 - location
 pos-02-03 - location
 pos-02-04 - location
 pos-02-05 - location
 pos-02-06 - location
 pos-02-07 - location
 pos-02-08 - location
 pos-02-09 - location
 pos-03-01 - location
 pos-03-02 - location
 pos-03-03 - location
 pos-03-04 - location
 pos-03-05 - location
 pos-03-06 - location
 pos-03-07 - location
 pos-03-08 - location
 pos-03-09 - location
 pos-04-01 - location
 pos-04-02 - location
 pos-04-03 - location
 pos-04-04 - location
 pos-04-05 - location
 pos-04-06 - location
 pos-04-07 - location
 pos-04-08 - location
 pos-04-09 - location
 pos-05-01 - location
 pos-05-02 - location
 pos-05-03 - location
 pos-05-04 - location
 pos-05-05 - location
 pos-05-06 - location
 pos-05-07 - location
 pos-05-08 - location
 pos-05-09 - location
 pos-06-01 - location
 pos-06-02 - location
 pos-06-03 - location
 pos-06-04 - location
 pos-06-05 - location
 pos-06-06 - location
 pos-06-07 - location
 pos-06-08 - location
 pos-06-09 - location
 pos-07-01 - location
 pos-07-02 - location
 pos-07-03 - location
 pos-07-04 - location
 pos-07-05 - location
 pos-07-06 - location
 pos-07-07 - location
 pos-07-08 - location
 pos-07-09 - location
 pos-08-01 - location
 pos-08-02 - location
 pos-08-03 - location
 pos-08-04 - location
 pos-08-05 - location
 pos-08-06 - location
 pos-08-07 - location
 pos-08-08 - location
 pos-08-09 - location
 pos-09-01 - location
 pos-09-02 - location
 pos-09-03 - location
 pos-09-04 - location
 pos-09-05 - location
 pos-09-06 - location
 pos-09-07 - location
 pos-09-08 - location
 pos-09-09 - location
 stone-01 - stone
 stone-02 - stone
 tag0 - TAG_TYPE ; (at-stone stone-02 pos-01-02) (not (at-stone stone-02 pos-01-03)) (not (clear pos-01-02)) (clear pos-01-03) (at-stone stone-03 pos-04-05) (not (at-stone stone-03 pos-02-06)) (not (clear pos-04-05)) (clear pos-02-06)
 tag1 - TAG_TYPE ; (not (at-stone stone-02 pos-01-02)) (at-stone stone-02 pos-01-03) (clear pos-01-02) (not (clear pos-01-03)) (not (at-stone stone-03 pos-04-05)) (at-stone stone-03 pos-02-06) (clear pos-04-05) (not (clear pos-02-06))
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(clear ?l - location)
(Kclear ?l - location)
(KNclear ?l - location)
(KGivenclear ?l - location ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(at ?p - player ?l - location)
(at-stone ?s - stone ?l - location)
(Kat-stone ?s - stone ?l - location)
(KNat-stone ?s - stone ?l - location)
(KGivenat-stone ?s - stone ?l - location ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(at-goal ?s - stone)
(is-goal ?l - location)
(is-nongoal ?l - location)
(move-dir ?from - location ?to - location ?dir - direction)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action move
:parameters ( ?p - player ?from - location ?to - location ?dir - direction)
:precondition 
(and (at ?p ?from) (clear ?to) (move-dir ?from ?to ?dir) (Kclear ?to) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (not (at ?p ?from)) (not (clear ?to)) (at ?p ?to) (clear ?from) (KNclear ?to) (not (Kclear ?to)) (KGivenclear ?to tag0 V_FALSE) (not (KGivenclear ?to tag0 V_TRUE)) (KGivenclear ?to tag1 V_FALSE) (not (KGivenclear ?to tag1 V_TRUE)) (Kclear ?from) (not (KNclear ?from)) (KGivenclear ?from tag0 V_TRUE) (not (KGivenclear ?from tag0 V_FALSE)) (KGivenclear ?from tag1 V_TRUE) (not (KGivenclear ?from tag1 V_FALSE)))
)
(:action push-to-nongoal
:parameters ( ?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction)
:precondition 
(and (at ?p ?ppos) (at-stone ?s ?from) (clear ?to) (move-dir ?ppos ?from ?dir) (move-dir ?from ?to ?dir) (is-nongoal ?to) (Kat-stone ?s ?from) (Kclear ?to) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (not (at ?p ?ppos)) (not (at-stone ?s ?from)) (not (clear ?to)) (at ?p ?from) (at-stone ?s ?to) (clear ?ppos) (not (at-goal ?s)) (KNat-stone ?s ?from) (not (Kat-stone ?s ?from)) (KGivenat-stone ?s ?from tag0 V_FALSE) (not (KGivenat-stone ?s ?from tag0 V_TRUE)) (KGivenat-stone ?s ?from tag1 V_FALSE) (not (KGivenat-stone ?s ?from tag1 V_TRUE)) (KNclear ?to) (not (Kclear ?to)) (KGivenclear ?to tag0 V_FALSE) (not (KGivenclear ?to tag0 V_TRUE)) (KGivenclear ?to tag1 V_FALSE) (not (KGivenclear ?to tag1 V_TRUE)) (Kat-stone ?s ?to) (not (KNat-stone ?s ?to)) (KGivenat-stone ?s ?to tag0 V_TRUE) (not (KGivenat-stone ?s ?to tag0 V_FALSE)) (KGivenat-stone ?s ?to tag1 V_TRUE) (not (KGivenat-stone ?s ?to tag1 V_FALSE)) (Kclear ?ppos) (not (KNclear ?ppos)) (KGivenclear ?ppos tag0 V_TRUE) (not (KGivenclear ?ppos tag0 V_FALSE)) (KGivenclear ?ppos tag1 V_TRUE) (not (KGivenclear ?ppos tag1 V_FALSE)))
)
(:action push-to-goal
:parameters ( ?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction)
:precondition 
(and (at ?p ?ppos) (at-stone ?s ?from) (clear ?to) (move-dir ?ppos ?from ?dir) (move-dir ?from ?to ?dir) (is-goal ?to) (Kat-stone ?s ?from) (Kclear ?to) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (not (at ?p ?ppos)) (not (at-stone ?s ?from)) (not (clear ?to)) (at ?p ?from) (at-stone ?s ?to) (clear ?ppos) (at-goal ?s) (KNat-stone ?s ?from) (not (Kat-stone ?s ?from)) (KGivenat-stone ?s ?from tag0 V_FALSE) (not (KGivenat-stone ?s ?from tag0 V_TRUE)) (KGivenat-stone ?s ?from tag1 V_FALSE) (not (KGivenat-stone ?s ?from tag1 V_TRUE)) (KNclear ?to) (not (Kclear ?to)) (KGivenclear ?to tag0 V_FALSE) (not (KGivenclear ?to tag0 V_TRUE)) (KGivenclear ?to tag1 V_FALSE) (not (KGivenclear ?to tag1 V_TRUE)) (Kat-stone ?s ?to) (not (KNat-stone ?s ?to)) (KGivenat-stone ?s ?to tag0 V_TRUE) (not (KGivenat-stone ?s ?to tag0 V_FALSE)) (KGivenat-stone ?s ?to tag1 V_TRUE) (not (KGivenat-stone ?s ?to tag1 V_FALSE)) (Kclear ?ppos) (not (KNclear ?ppos)) (KGivenclear ?ppos tag0 V_TRUE) (not (KGivenclear ?ppos tag0 V_FALSE)) (KGivenclear ?ppos tag1 V_TRUE) (not (KGivenclear ?ppos tag1 V_FALSE)))
)
(:action observestone-T
:parameters ( ?p - player ?s - stone ?ppos - location ?from - location ?dir - direction)
:precondition 
(and (at ?p ?ppos) (move-dir ?ppos ?from ?dir) (at-stone ?s ?from) (not (Kat-stone ?s ?from)) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect (Kat-stone ?s ?from)
)
(:action observestone-F
:parameters ( ?p - player ?s - stone ?ppos - location ?from - location ?dir - direction)
:precondition 
(and (at ?p ?ppos) (move-dir ?ppos ?from ?dir) (not (at-stone ?s ?from)) (not (KNat-stone ?s ?from)) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect (KNat-stone ?s ?from)
)
(:action Merge-clear
:parameters ( ?l - location ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kclear ?l)) 
	(or (KGivenclear ?l tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenclear ?l tag1 ?V_PARAM) (KNot tag1))(not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (Kclear ?l))
)

(:action RefuteT-clear
:parameters ( ?l - location ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenclear ?l ?TAG_PARAM V_TRUE) (KNclear ?l) (not (clear ?l)) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-clear
:parameters ( ?l - location ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenclear ?l ?TAG_PARAM V_FALSE) (Kclear ?l) (clear ?l) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-at-stone
:parameters ( ?s - stone ?l - location ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kat-stone ?s ?l)) 
	(or (KGivenat-stone ?s ?l tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenat-stone ?s ?l tag1 ?V_PARAM) (KNot tag1))(not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (Kat-stone ?s ?l))
)

(:action RefuteT-at-stone
:parameters ( ?s - stone ?l - location ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenat-stone ?s ?l ?TAG_PARAM V_TRUE) (KNat-stone ?s ?l) (not (at-stone ?s ?l)) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-at-stone
:parameters ( ?s - stone ?l - location ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenat-stone ?s ?l ?TAG_PARAM V_FALSE) (Kat-stone ?s ?l) (at-stone ?s ?l) (not (at-stone stone-01 pos-09-09)) (not (at-stone stone-02 pos-01-09)))
:effect 
(and (KNot ?TAG_PARAM))
)

)
