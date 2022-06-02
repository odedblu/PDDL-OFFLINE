(define (domain Kmyworld)
(:requirements :strips :typing)
(:types grid blow rocket patha d_plaunch TAG_TYPE VALUE_TYPE)
(:constants
 turn - turn
 blown - blow
 a - rocket
 d - rocket
 a1 - patha
 a2 - patha
 a3 - patha
 a4 - patha
 a5 - patha
 n0 - grid
 n1 - grid
 n2 - grid
 n3 - grid
 n4 - grid
 n5 - grid
 n6 - grid
 n7 - grid
 n8 - grid
 n9 - grid
 n10 - grid
 n11 - grid
 n12 - grid
 n13 - grid
 n14 - grid
 d1 - d_plaunch
 d2 - d_plaunch
 tag0 - TAG_TYPE ; (pathselected a1) (not (pathselected a2))
 tag1 - TAG_TYPE ; (not (pathselected a1)) (pathselected a2)
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(atx ?r - rocket ?x - grid)
(Katx ?r - rocket ?x - grid)
(KNatx ?r - rocket ?x - grid)
(KGivenatx ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(aty ?r - rocket ?y - grid)
(Katy ?r - rocket ?y - grid)
(KNaty ?r - rocket ?y - grid)
(KGivenaty ?r - rocket ?y - grid ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(atz ?r - rocket ?z - grid)
(Katz ?r - rocket ?z - grid)
(KNatz ?r - rocket ?z - grid)
(KGivenatz ?r - rocket ?z - grid ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(turn ?r - rocket)
(Kturn ?r - rocket)
(KNturn ?r - rocket)
(KGiventurn ?r - rocket ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(adj ?x - grid ?y - grid)
(eq ?x - grid ?y - grid)
(isblown ?x - blow)
(d_launchfromx ?r - d_plaunch ?x - grid)
(d_launchfromy ?r - d_plaunch ?y - grid)
(d_launchfromz ?r - d_plaunch ?z - grid)
(blurlocation ?r - rocket)
(Kblurlocation ?r - rocket)
(KNblurlocation ?r - rocket)
(KGivenblurlocation ?r - rocket ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(initlocation ?r - rocket)
(Kinitlocation ?r - rocket)
(KNinitlocation ?r - rocket)
(KGiveninitlocation ?r - rocket ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(blurpath ?r - rocket)
(pathselected ?p - patha)
(Kpathselected ?p - patha)
(KNpathselected ?p - patha)
(KGivenpathselected ?p - patha ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action launchd
:parameters ( ?x - grid ?y - grid ?z - grid ?pd - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?pd ?x) (d_launchfromy ?pd ?y) (d_launchfromz ?pd ?z) (blurlocation d) (Kturn d) (Kblurlocation d))
:effect 
(and (atx d ?x) (aty d ?y) (atz d ?z) (not (blurlocation d)) (Katx d ?x) (not (KNatx d ?x)) (KGivenatx d ?x tag0 V_TRUE) (not (KGivenatx d ?x tag0 V_FALSE)) (KGivenatx d ?x tag1 V_TRUE) (not (KGivenatx d ?x tag1 V_FALSE)) (Katy d ?y) (not (KNaty d ?y)) (KGivenaty d ?y tag0 V_TRUE) (not (KGivenaty d ?y tag0 V_FALSE)) (KGivenaty d ?y tag1 V_TRUE) (not (KGivenaty d ?y tag1 V_FALSE)) (Katz d ?z) (not (KNatz d ?z)) (KGivenatz d ?z tag0 V_TRUE) (not (KGivenatz d ?z tag0 V_FALSE)) (KGivenatz d ?z tag1 V_TRUE) (not (KGivenatz d ?z tag1 V_FALSE)) (KNblurlocation d) (not (Kblurlocation d)) (KGivenblurlocation d tag0 V_FALSE) (not (KGivenblurlocation d tag0 V_TRUE)) (KGivenblurlocation d tag1 V_FALSE) (not (KGivenblurlocation d tag1 V_TRUE)))
)
(:action waitbeforelaunchd
:precondition 
(and (turn d) (blurlocation d) (Kturn d) (Kblurlocation d))
:effect 
(and (not (turn d)) (turn a) (KNturn d) (not (Kturn d)) (KGiventurn d tag0 V_FALSE) (not (KGiventurn d tag0 V_TRUE)) (KGiventurn d tag1 V_FALSE) (not (KGiventurn d tag1 V_TRUE)) (Kturn a) (not (KNturn a)) (KGiventurn a tag0 V_TRUE) (not (KGiventurn a tag0 V_FALSE)) (KGiventurn a tag1 V_TRUE) (not (KGiventurn a tag1 V_FALSE)))
)
(:action moved
:parameters ( ?x_from - grid ?y_from - grid ?z_from - grid ?x_to - grid ?y_to - grid ?z_to - grid)
:precondition 
(and (atx d ?x_from) (aty d ?y_from) (atz d ?z_from) (turn d) (adj ?x_from ?x_to) (adj ?y_from ?y_to) (adj ?z_from ?z_to) (Katx d ?x_from) (Katy d ?y_from) (Katz d ?z_from) (Kturn d))
:effect 
(and (not (atx d ?x_from)) (not (aty d ?y_from)) (not (atz d ?z_from)) (atx d ?x_to) (aty d ?y_to) (atz d ?z_to) (not (turn d)) (turn a) (KNatx d ?x_from) (not (Katx d ?x_from)) (KGivenatx d ?x_from tag0 V_FALSE) (not (KGivenatx d ?x_from tag0 V_TRUE)) (KGivenatx d ?x_from tag1 V_FALSE) (not (KGivenatx d ?x_from tag1 V_TRUE)) (KNaty d ?y_from) (not (Katy d ?y_from)) (KGivenaty d ?y_from tag0 V_FALSE) (not (KGivenaty d ?y_from tag0 V_TRUE)) (KGivenaty d ?y_from tag1 V_FALSE) (not (KGivenaty d ?y_from tag1 V_TRUE)) (KNatz d ?z_from) (not (Katz d ?z_from)) (KGivenatz d ?z_from tag0 V_FALSE) (not (KGivenatz d ?z_from tag0 V_TRUE)) (KGivenatz d ?z_from tag1 V_FALSE) (not (KGivenatz d ?z_from tag1 V_TRUE)) (Katx d ?x_to) (not (KNatx d ?x_to)) (KGivenatx d ?x_to tag0 V_TRUE) (not (KGivenatx d ?x_to tag0 V_FALSE)) (KGivenatx d ?x_to tag1 V_TRUE) (not (KGivenatx d ?x_to tag1 V_FALSE)) (Katy d ?y_to) (not (KNaty d ?y_to)) (KGivenaty d ?y_to tag0 V_TRUE) (not (KGivenaty d ?y_to tag0 V_FALSE)) (KGivenaty d ?y_to tag1 V_TRUE) (not (KGivenaty d ?y_to tag1 V_FALSE)) (Katz d ?z_to) (not (KNatz d ?z_to)) (KGivenatz d ?z_to tag0 V_TRUE) (not (KGivenatz d ?z_to tag0 V_FALSE)) (KGivenatz d ?z_to tag1 V_TRUE) (not (KGivenatz d ?z_to tag1 V_FALSE)) (KNturn d) (not (Kturn d)) (KGiventurn d tag0 V_FALSE) (not (KGiventurn d tag0 V_TRUE)) (KGiventurn d tag1 V_FALSE) (not (KGiventurn d tag1 V_TRUE)) (Kturn a) (not (KNturn a)) (KGiventurn a tag0 V_TRUE) (not (KGiventurn a tag0 V_FALSE)) (KGiventurn a tag1 V_TRUE) (not (KGiventurn a tag1 V_FALSE)))
)
(:action launcha
:precondition 
(and (turn a) (blurlocation a) (Kturn a) (Kblurlocation a))
:effect 
(and 
	
	(when (pathselected a1) 
		(and (atx a n1) (aty a n0) (atz a n0) (initlocation a) (not (blurlocation a))))
	
	(when (Kpathselected a1) 
		(and (Katx a n1) (not (KNatx a n1)) (Katy a n0) (not (KNaty a n0)) (Katz a n0) (not (KNatz a n0)) (Kinitlocation a) (not (KNinitlocation a)) (KNblurlocation a) (not (Kblurlocation a))))
	
	(when (not (KNpathselected a1)) 
		(and (not (KNatx a n1)) (not (KNaty a n0)) (not (KNatz a n0)) (not (KNinitlocation a)) (not (Kblurlocation a))))
	
	(when (KGivenpathselected a1 tag0 V_TRUE) 
		(and (KGivenatx a n1 tag0 V_TRUE) (KGivenaty a n0 tag0 V_TRUE) (KGivenatz a n0 tag0 V_TRUE) (KGiveninitlocation a tag0 V_TRUE) (KGivenblurlocation a tag0 V_FALSE)))
	
	(when (not (KGivenpathselected a1 tag0 V_FALSE)) 
		(and (not (KGivenatx a n1 tag0 V_FALSE)) (not (KGivenaty a n0 tag0 V_FALSE)) (not (KGivenatz a n0 tag0 V_FALSE)) (not (KGiveninitlocation a tag0 V_FALSE)) (not (KGivenblurlocation a tag0 V_TRUE))))
	
	(when (KGivenpathselected a1 tag1 V_TRUE) 
		(and (KGivenatx a n1 tag1 V_TRUE) (KGivenaty a n0 tag1 V_TRUE) (KGivenatz a n0 tag1 V_TRUE) (KGiveninitlocation a tag1 V_TRUE) (KGivenblurlocation a tag1 V_FALSE)))
	
	(when (not (KGivenpathselected a1 tag1 V_FALSE)) 
		(and (not (KGivenatx a n1 tag1 V_FALSE)) (not (KGivenaty a n0 tag1 V_FALSE)) (not (KGivenatz a n0 tag1 V_FALSE)) (not (KGiveninitlocation a tag1 V_FALSE)) (not (KGivenblurlocation a tag1 V_TRUE))))
	
	(when (pathselected a2) 
		(and (atx a n1) (aty a n5) (atz a n0) (initlocation a) (not (blurlocation a))))
	
	(when (Kpathselected a2) 
		(and (Katx a n1) (not (KNatx a n1)) (Katy a n5) (not (KNaty a n5)) (Katz a n0) (not (KNatz a n0)) (Kinitlocation a) (not (KNinitlocation a)) (KNblurlocation a) (not (Kblurlocation a))))
	
	(when (not (KNpathselected a2)) 
		(and (not (KNatx a n1)) (not (KNaty a n5)) (not (KNatz a n0)) (not (KNinitlocation a)) (not (Kblurlocation a))))
	
	(when (KGivenpathselected a2 tag0 V_TRUE) 
		(and (KGivenatx a n1 tag0 V_TRUE) (KGivenaty a n5 tag0 V_TRUE) (KGivenatz a n0 tag0 V_TRUE) (KGiveninitlocation a tag0 V_TRUE) (KGivenblurlocation a tag0 V_FALSE)))
	
	(when (not (KGivenpathselected a2 tag0 V_FALSE)) 
		(and (not (KGivenatx a n1 tag0 V_FALSE)) (not (KGivenaty a n5 tag0 V_FALSE)) (not (KGivenatz a n0 tag0 V_FALSE)) (not (KGiveninitlocation a tag0 V_FALSE)) (not (KGivenblurlocation a tag0 V_TRUE))))
	
	(when (KGivenpathselected a2 tag1 V_TRUE) 
		(and (KGivenatx a n1 tag1 V_TRUE) (KGivenaty a n5 tag1 V_TRUE) (KGivenatz a n0 tag1 V_TRUE) (KGiveninitlocation a tag1 V_TRUE) (KGivenblurlocation a tag1 V_FALSE)))
	
	(when (not (KGivenpathselected a2 tag1 V_FALSE)) 
		(and (not (KGivenatx a n1 tag1 V_FALSE)) (not (KGivenaty a n5 tag1 V_FALSE)) (not (KGivenatz a n0 tag1 V_FALSE)) (not (KGiveninitlocation a tag1 V_FALSE)) (not (KGivenblurlocation a tag1 V_TRUE)))))
)
(:action blowup
:parameters ( ?x - grid ?y - grid ?z - grid ?b - blow)
:precondition 
(and (atx a ?x) (atx d ?x) (aty a ?y) (aty d ?y) (atz a ?z) (atz d ?z) (Katx a ?x) (Katx d ?x) (Katy a ?y) (Katy d ?y) (Katz a ?z) (Katz d ?z))
:effect 
(and (isblown ?b))
)
(:action observex-T
:parameters ( ?x - grid)
:precondition 
(and (turn d) (Kturn d) (atx a ?x))
:effect (Katx a ?x)
)
(:action observex-F
:parameters ( ?x - grid)
:precondition 
(and (turn d) (Kturn d) (not (atx a ?x)))
:effect (KNatx a ?x)
)
(:action observey-T
:parameters ( ?y - grid)
:precondition 
(and (turn d) (Kturn d) (aty a ?y))
:effect (Katy a ?y)
)
(:action observey-F
:parameters ( ?y - grid)
:precondition 
(and (turn d) (Kturn d) (not (aty a ?y)))
:effect (KNaty a ?y)
)
(:action observez-T
:parameters ( ?z - grid)
:precondition 
(and (turn d) (Kturn d) (atz a ?z))
:effect (Katz a ?z)
)
(:action observez-F
:parameters ( ?z - grid)
:precondition 
(and (turn d) (Kturn d) (not (atz a ?z)))
:effect (KNatz a ?z)
)
(:action movea
:precondition 
(and (turn a) (Kturn a))
:effect 
(and 
	
	(when 
		(and (pathselected a1) (atx a n1) (aty a n0) (atz a n0))
		(and (not (aty a n0)) (not (atz a n0)) (aty a n1) (atz a n1) (not (turn a)) (turn d)))
	
	(when 
		(and (Kpathselected a1) (Katx a n1) (Katy a n0) (Katz a n0))
		(and (KNaty a n0) (not (Katy a n0)) (KNatz a n0) (not (Katz a n0)) (Katy a n1) (not (KNaty a n1)) (Katz a n1) (not (KNatz a n1)) (KNturn a) (not (Kturn a)) (Kturn d) (not (KNturn d))))
	
	(when 
		(and (not (KNpathselected a1)) (not (KNatx a n1)) (not (KNaty a n0)) (not (KNatz a n0)))
		(and (not (Katy a n0)) (not (Katz a n0)) (not (KNaty a n1)) (not (KNatz a n1)) (not (Kturn a)) (not (KNturn d))))
	
	(when 
		(and (KGivenpathselected a1 tag0 V_TRUE) (KGivenatx a n1 tag0 V_TRUE) (KGivenaty a n0 tag0 V_TRUE) (KGivenatz a n0 tag0 V_TRUE))
		(and (KGivenaty a n0 tag0 V_FALSE) (KGivenatz a n0 tag0 V_FALSE) (KGivenaty a n1 tag0 V_TRUE) (KGivenatz a n1 tag0 V_TRUE) (KGiventurn a tag0 V_FALSE) (KGiventurn d tag0 V_TRUE)))
	
	(when 
		(and (not (KGivenpathselected a1 tag0 V_FALSE)) (not (KGivenatx a n1 tag0 V_FALSE)) (not (KGivenaty a n0 tag0 V_FALSE)) (not (KGivenatz a n0 tag0 V_FALSE)))
		(and (not (KGivenaty a n0 tag0 V_TRUE)) (not (KGivenatz a n0 tag0 V_TRUE)) (not (KGivenaty a n1 tag0 V_FALSE)) (not (KGivenatz a n1 tag0 V_FALSE)) (not (KGiventurn a tag0 V_TRUE)) (not (KGiventurn d tag0 V_FALSE))))
	
	(when 
		(and (KGivenpathselected a1 tag1 V_TRUE) (KGivenatx a n1 tag1 V_TRUE) (KGivenaty a n0 tag1 V_TRUE) (KGivenatz a n0 tag1 V_TRUE))
		(and (KGivenaty a n0 tag1 V_FALSE) (KGivenatz a n0 tag1 V_FALSE) (KGivenaty a n1 tag1 V_TRUE) (KGivenatz a n1 tag1 V_TRUE) (KGiventurn a tag1 V_FALSE) (KGiventurn d tag1 V_TRUE)))
	
	(when 
		(and (not (KGivenpathselected a1 tag1 V_FALSE)) (not (KGivenatx a n1 tag1 V_FALSE)) (not (KGivenaty a n0 tag1 V_FALSE)) (not (KGivenatz a n0 tag1 V_FALSE)))
		(and (not (KGivenaty a n0 tag1 V_TRUE)) (not (KGivenatz a n0 tag1 V_TRUE)) (not (KGivenaty a n1 tag1 V_FALSE)) (not (KGivenatz a n1 tag1 V_FALSE)) (not (KGiventurn a tag1 V_TRUE)) (not (KGiventurn d tag1 V_FALSE)))))
)
(:action Merge-atx
:parameters ( ?r - rocket ?x - grid ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Katx ?r ?x)) 
	(or (KGivenatx ?r ?x tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenatx ?r ?x tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Katx ?r ?x))
)

(:action RefuteT-atx
:parameters ( ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenatx ?r ?x ?TAG_PARAM V_TRUE) (KNatx ?r ?x) (not (atx ?r ?x)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-atx
:parameters ( ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenatx ?r ?x ?TAG_PARAM V_FALSE) (Katx ?r ?x) (atx ?r ?x))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-aty
:parameters ( ?r - rocket ?y - grid ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Katy ?r ?y)) 
	(or (KGivenaty ?r ?y tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenaty ?r ?y tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Katy ?r ?y))
)

(:action RefuteT-aty
:parameters ( ?r - rocket ?y - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenaty ?r ?y ?TAG_PARAM V_TRUE) (KNaty ?r ?y) (not (aty ?r ?y)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-aty
:parameters ( ?r - rocket ?y - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenaty ?r ?y ?TAG_PARAM V_FALSE) (Katy ?r ?y) (aty ?r ?y))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-atz
:parameters ( ?r - rocket ?z - grid ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Katz ?r ?z)) 
	(or (KGivenatz ?r ?z tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenatz ?r ?z tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Katz ?r ?z))
)

(:action RefuteT-atz
:parameters ( ?r - rocket ?z - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenatz ?r ?z ?TAG_PARAM V_TRUE) (KNatz ?r ?z) (not (atz ?r ?z)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-atz
:parameters ( ?r - rocket ?z - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenatz ?r ?z ?TAG_PARAM V_FALSE) (Katz ?r ?z) (atz ?r ?z))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-turn
:parameters ( ?r - rocket ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kturn ?r)) 
	(or (KGiventurn ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGiventurn ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kturn ?r))
)

(:action RefuteT-turn
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiventurn ?r ?TAG_PARAM V_TRUE) (KNturn ?r) (not (turn ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-turn
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiventurn ?r ?TAG_PARAM V_FALSE) (Kturn ?r) (turn ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-blurlocation
:parameters ( ?r - rocket ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kblurlocation ?r)) 
	(or (KGivenblurlocation ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenblurlocation ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kblurlocation ?r))
)

(:action RefuteT-blurlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenblurlocation ?r ?TAG_PARAM V_TRUE) (KNblurlocation ?r) (not (blurlocation ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-blurlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenblurlocation ?r ?TAG_PARAM V_FALSE) (Kblurlocation ?r) (blurlocation ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-initlocation
:parameters ( ?r - rocket ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kinitlocation ?r)) 
	(or (KGiveninitlocation ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGiveninitlocation ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kinitlocation ?r))
)

(:action RefuteT-initlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiveninitlocation ?r ?TAG_PARAM V_TRUE) (KNinitlocation ?r) (not (initlocation ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-initlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiveninitlocation ?r ?TAG_PARAM V_FALSE) (Kinitlocation ?r) (initlocation ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-pathselected
:parameters ( ?p - patha ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kpathselected ?p)) 
	(or (KGivenpathselected ?p tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenpathselected ?p tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kpathselected ?p))
)

(:action RefuteT-pathselected
:parameters ( ?p - patha ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpathselected ?p ?TAG_PARAM V_TRUE) (KNpathselected ?p) (not (pathselected ?p)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-pathselected
:parameters ( ?p - patha ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpathselected ?p ?TAG_PARAM V_FALSE) (Kpathselected ?p) (pathselected ?p))
:effect 
(and (KNot ?TAG_PARAM))
)

)
