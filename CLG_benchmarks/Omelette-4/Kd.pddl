(define (domain Komelette-4)
(:requirements :strips :typing)
(:types bowl value OPTION_TYPE TAG_TYPE VALUE_TYPE)
(:constants
 bowl1 - bowl
 bowl2 - bowl
 v0 - value
 v1 - value
 v2 - value
 v3 - value
 v4 - value
 v5 - value
 v6 - value
 v7 - value
 v8 - value
 opt0 - OPTION_TYPE
 opt1 - OPTION_TYPE
 tag0 - TAG_TYPE ; (get-egg_option_0 ) (not (get-egg_option_1 )) (get-egg_option_2 ) (get-egg_option_3 ) (get-egg_option_4 ) (get-egg_option_5 ) (not (get-egg_option_6 )) (option opt0) (not (option opt1))
 tag1 - TAG_TYPE ; (not (get-egg_option_0 )) (not (get-egg_option_2 )) (not (get-egg_option_3 )) (not (get-egg_option_4 )) (not (get-egg_option_5 )) (not (option opt0)) (option opt1) (get-egg_option_1 ) (get-egg_option_6 )
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(plus ?v1 - value ?v2 - value ?v3 - value)
(good ?i - bowl)
(Kgood ?i - bowl)
(KNgood ?i - bowl)
(KGivengood ?i - bowl ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(eggs-in ?i - bowl ?j - value)
(different ?i - bowl ?j - bowl)
(holding-egg)
(bad-egg)
(Kbad-egg)
(KNbad-egg)
(KGivenbad-egg ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(option ?o - OPTION_TYPE)
(Koption ?o - OPTION_TYPE)
(KNoption ?o - OPTION_TYPE)
(KGivenoption ?o - OPTION_TYPE ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action AdvanceOptions
:effect 
(and 
	
	(when (option opt0) 
		(and (not (option opt0)) (option opt1)))
	
	(when (KGivenoption opt0 tag0 V_TRUE) 
		(and (KGivenoption opt0 tag0 V_FALSE) (KGivenoption opt1 tag0 V_TRUE)))
	
	(when (not (KGivenoption opt0 tag0 V_FALSE)) 
		(and (not (KGivenoption opt0 tag0 V_TRUE)) (not (KGivenoption opt1 tag0 V_FALSE))))
	
	(when (KGivenoption opt0 tag1 V_TRUE) 
		(and (KGivenoption opt0 tag1 V_FALSE) (KGivenoption opt1 tag1 V_TRUE)))
	
	(when (not (KGivenoption opt0 tag1 V_FALSE)) 
		(and (not (KGivenoption opt0 tag1 V_TRUE)) (not (KGivenoption opt1 tag1 V_FALSE))))
	
	(when (option opt1) 
		(and (not (option opt1)) (option opt0)))
	
	(when (KGivenoption opt1 tag0 V_TRUE) 
		(and (KGivenoption opt1 tag0 V_FALSE) (KGivenoption opt0 tag0 V_TRUE)))
	
	(when (not (KGivenoption opt1 tag0 V_FALSE)) 
		(and (not (KGivenoption opt1 tag0 V_TRUE)) (not (KGivenoption opt0 tag0 V_FALSE))))
	
	(when (KGivenoption opt1 tag1 V_TRUE) 
		(and (KGivenoption opt1 tag1 V_FALSE) (KGivenoption opt0 tag1 V_TRUE)))
	
	(when (not (KGivenoption opt1 tag1 V_FALSE)) 
		(and (not (KGivenoption opt1 tag1 V_TRUE)) (not (KGivenoption opt0 tag1 V_FALSE)))))
)
(:action get-egg
:precondition 
(and (not (holding-egg )))
:effect 
(and (holding-egg ) 
	
	(when (option opt1) (bad-egg ))(not (KNbad-egg)) 
	
	(when (KGivenoption opt1 tag0 V_TRUE) (KGivenbad-egg tag0 V_TRUE))
	
	(when (not (KGivenoption opt1 tag0 V_FALSE)) (not (KGivenbad-egg tag0 V_FALSE)))
	
	(when (KGivenoption opt1 tag1 V_TRUE) (KGivenbad-egg tag1 V_TRUE))
	
	(when (not (KGivenoption opt1 tag1 V_FALSE)) (not (KGivenbad-egg tag1 V_FALSE)))
	
	(when (option opt0) (not (bad-egg )))(not (Kbad-egg)) 
	
	(when (KGivenoption opt0 tag0 V_TRUE) (KGivenbad-egg tag0 V_FALSE))
	
	(when (not (KGivenoption opt0 tag0 V_FALSE)) (not (KGivenbad-egg tag0 V_TRUE)))
	
	(when (KGivenoption opt0 tag1 V_TRUE) (KGivenbad-egg tag1 V_FALSE))
	
	(when (not (KGivenoption opt0 tag1 V_FALSE)) (not (KGivenbad-egg tag1 V_TRUE))))
)
(:action break-egg
:parameters ( ?i - bowl ?v1 - value ?v2 - value)
:precondition 
(and (holding-egg ) (eggs-in ?i ?v1) (plus ?v1 v1 ?v2))
:effect 
(and (not (eggs-in ?i ?v1)) (eggs-in ?i ?v2) (not (holding-egg )) (bad-egg ) (Kbad-egg) (not (KNbad-egg)) (KGivenbad-egg tag0 V_TRUE) (not (KGivenbad-egg tag0 V_FALSE)) (KGivenbad-egg tag1 V_TRUE) (not (KGivenbad-egg tag1 V_FALSE)) 
	
	(when (bad-egg ) (not (good ?i)))
	
	(when (Kbad-egg) 
		(and (KNgood ?i) (not (Kgood ?i))))
	
	(when (not (KNbad-egg)) (not (Kgood ?i)))
	
	(when (KGivenbad-egg tag0 V_TRUE) (KGivengood ?i tag0 V_FALSE))
	
	(when (not (KGivenbad-egg tag0 V_FALSE)) (not (KGivengood ?i tag0 V_TRUE)))
	
	(when (KGivenbad-egg tag1 V_TRUE) (KGivengood ?i tag1 V_FALSE))
	
	(when (not (KGivenbad-egg tag1 V_FALSE)) (not (KGivengood ?i tag1 V_TRUE))))
)
(:action pour
:parameters ( ?i - bowl ?j - bowl ?v1 - value ?v2 - value ?v3 - value)
:precondition 
(and (different ?i ?j) (eggs-in ?i ?v1) (eggs-in ?j ?v2) (plus ?v1 ?v2 ?v3))
:effect 
(and (not (eggs-in ?i ?v1)) (not (eggs-in ?j ?v2)) (eggs-in ?i v0) (eggs-in ?j ?v3) (good ?i) (Kgood ?i) (not (KNgood ?i)) (KGivengood ?i tag0 V_TRUE) (not (KGivengood ?i tag0 V_FALSE)) (KGivengood ?i tag1 V_TRUE) (not (KGivengood ?i tag1 V_FALSE)) 
	
	(when (not (good ?i)) (not (good ?j)))
	
	(when (KNgood ?i) 
		(and (KNgood ?j) (not (Kgood ?j))))
	
	(when (not (Kgood ?i)) (not (Kgood ?j)))
	
	(when (KGivengood ?i tag0 V_FALSE) (KGivengood ?j tag0 V_FALSE))
	
	(when (not (KGivengood ?i tag0 V_TRUE)) (not (KGivengood ?j tag0 V_TRUE)))
	
	(when (KGivengood ?i tag1 V_FALSE) (KGivengood ?j tag1 V_FALSE))
	
	(when (not (KGivengood ?i tag1 V_TRUE)) (not (KGivengood ?j tag1 V_TRUE))))
)
(:action empty
:parameters ( ?i - bowl)
:effect 
(and (good ?i) (not (eggs-in ?i v1)) (not (eggs-in ?i v2)) (not (eggs-in ?i v3)) (not (eggs-in ?i v4)) (eggs-in ?i v0) (Kgood ?i) (not (KNgood ?i)) (KGivengood ?i tag0 V_TRUE) (not (KGivengood ?i tag0 V_FALSE)) (KGivengood ?i tag1 V_TRUE) (not (KGivengood ?i tag1 V_FALSE)))
)
(:action observe-bowl-T
:parameters ( ?i - bowl)
:precondition 
(and (good ?i))
:effect (Kgood ?i)
)
(:action observe-bowl-F
:parameters ( ?i - bowl)
:precondition 
(and (not (good ?i)))
:effect (KNgood ?i)
)
(:action Merge-good
:parameters ( ?i - bowl ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood ?i)) 
	(or (KGivengood ?i tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood ?i tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood ?i))
)

(:action RefuteT-good
:parameters ( ?i - bowl ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?i ?TAG_PARAM V_TRUE) (KNgood ?i) (not (good ?i)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good
:parameters ( ?i - bowl ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?i ?TAG_PARAM V_FALSE) (Kgood ?i) (good ?i))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-bad-egg
:parameters ( ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kbad-egg)) 
	(or (KGivenbad-egg tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenbad-egg tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kbad-egg))
)

(:action RefuteT-bad-egg
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenbad-egg ?TAG_PARAM V_TRUE) (KNbad-egg) (not (bad-egg )))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-bad-egg
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenbad-egg ?TAG_PARAM V_FALSE) (Kbad-egg) (bad-egg ))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-option
:parameters ( ?o - OPTION_TYPE ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Koption ?o)) 
	(or (KGivenoption ?o tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenoption ?o tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Koption ?o))
)

(:action RefuteT-option
:parameters ( ?o - OPTION_TYPE ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenoption ?o ?TAG_PARAM V_TRUE) (KNoption ?o) (not (option ?o)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-option
:parameters ( ?o - OPTION_TYPE ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenoption ?o ?TAG_PARAM V_FALSE) (Koption ?o) (option ?o))
:effect 
(and (KNot ?TAG_PARAM))
)

)
