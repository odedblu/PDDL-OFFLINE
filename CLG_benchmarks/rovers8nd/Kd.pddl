(define (domain Krover)
(:requirements :strips :typing)
(:types rover waypoint camera mode lander objective OPTION_TYPE TAG_TYPE VALUE_TYPE)
(:constants
 general - lander
 colour - mode
 high_res - mode
 low_res - mode
 rover0 - rover
 rover0store - store
 waypoint0 - waypoint
 waypoint1 - waypoint
 waypoint2 - waypoint
 waypoint3 - waypoint
 waypoint4 - waypoint
 waypoint5 - waypoint
 waypoint6 - waypoint
 waypoint7 - waypoint
 camera0 - camera
 objective1 - objective
 objective2 - objective
 opt0 - OPTION_TYPE
 opt1 - OPTION_TYPE
 tag0 - TAG_TYPE ; (option opt0) (not (option opt1))
 tag1 - TAG_TYPE ; (not (option opt0)) (option opt1)
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(at ?x - rover ?y - waypoint)
(at_lander ?x - lander ?y - waypoint)
(can_traverse ?r - rover ?x - waypoint ?y - waypoint)
(equipped_for_imaging ?r - rover)
(calibrated ?c - camera ?r - rover ?w - waypoint ?o - objective)
(supports ?c - camera ?m - mode)
(available ?r - rover)
(visible ?w - waypoint ?p - waypoint)
(have_image ?r - rover ?o - objective ?m - mode)
(good_image ?o - objective ?m - mode)
(Kgood_image ?o - objective ?m - mode)
(KNgood_image ?o - objective ?m - mode)
(KGivengood_image ?o - objective ?m - mode ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(communicated_image_data ?o - objective ?m - mode)
(visible_from ?o - objective ?w - waypoint)
(Kvisible_from ?o - objective ?w - waypoint)
(KNvisible_from ?o - objective ?w - waypoint)
(KGivenvisible_from ?o - objective ?w - waypoint ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(calibration_target ?i - camera ?o - objective)
(on_board ?i - camera ?r - rover)
(channel_free ?l - lander)
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
(:action sense_vis-T
:parameters ( ?x - rover ?t - objective ?z - waypoint)
:precondition 
(and (at ?x ?z) (visible_from ?t ?z))
:effect (Kvisible_from ?t ?z)
)
(:action sense_vis-F
:parameters ( ?x - rover ?t - objective ?z - waypoint)
:precondition 
(and (at ?x ?z) (not (visible_from ?t ?z)))
:effect (KNvisible_from ?t ?z)
)
(:action navigate
:parameters ( ?x - rover ?y - waypoint ?z - waypoint ?c - camera ?p - objective)
:precondition 
(and (can_traverse ?x ?y ?z) (available ?x) (at ?x ?y))
:effect 
(and (not (at ?x ?y)) (at ?x ?z) (not (calibrated ?c ?x ?z ?p)))
)
(:action calibrate
:parameters ( ?r - rover ?i - camera ?t - objective ?w - waypoint)
:precondition 
(and (equipped_for_imaging ?r) (calibration_target ?i ?t) (at ?r ?w) (on_board ?i ?r))
:effect 
(and (calibrated ?i ?r ?w ?t))
)
(:action take_image
:parameters ( ?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
:precondition 
(and (calibrated ?i ?r ?p ?o) (on_board ?i ?r) (equipped_for_imaging ?r) (supports ?i ?m) (visible_from ?o ?p) (at ?r ?p) (Kvisible_from ?o ?p))
:effect 
(and (have_image ?r ?o ?m) (not (communicated_image_data ?o ?m)) (not (calibrated ?i ?r ?p ?o)) 
	
	(when (option opt1) (not (good_image ?o ?m)))(not (Kgood_image ?o ?m)) 
	
	(when (KGivenoption opt1 tag0 V_TRUE) (KGivengood_image ?o ?m tag0 V_FALSE))
	
	(when (not (KGivenoption opt1 tag0 V_FALSE)) (not (KGivengood_image ?o ?m tag0 V_TRUE)))
	
	(when (KGivenoption opt1 tag1 V_TRUE) (KGivengood_image ?o ?m tag1 V_FALSE))
	
	(when (not (KGivenoption opt1 tag1 V_FALSE)) (not (KGivengood_image ?o ?m tag1 V_TRUE)))
	
	(when (option opt0) (good_image ?o ?m))(not (KNgood_image ?o ?m)) 
	
	(when (KGivenoption opt0 tag0 V_TRUE) (KGivengood_image ?o ?m tag0 V_TRUE))
	
	(when (not (KGivenoption opt0 tag0 V_FALSE)) (not (KGivengood_image ?o ?m tag0 V_FALSE)))
	
	(when (KGivenoption opt0 tag1 V_TRUE) (KGivengood_image ?o ?m tag1 V_TRUE))
	
	(when (not (KGivenoption opt0 tag1 V_FALSE)) (not (KGivengood_image ?o ?m tag1 V_FALSE))))
)
(:action communicate_image_data
:parameters ( ?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
:precondition 
(and (at ?r ?x) (at_lander ?l ?y) (have_image ?r ?o ?m) (visible ?x ?y))
:effect 
(and (communicated_image_data ?o ?m) (not (have_image ?r ?o ?m)))
)
(:action wait-response-T
:parameters ( ?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
:precondition 
(and (at ?r ?x) (at_lander ?l ?y) (communicated_image_data ?o ?m) (visible ?x ?y) (good_image ?o ?m))
:effect (Kgood_image ?o ?m)
)
(:action wait-response-F
:parameters ( ?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
:precondition 
(and (at ?r ?x) (at_lander ?l ?y) (communicated_image_data ?o ?m) (visible ?x ?y) (not (good_image ?o ?m)))
:effect (KNgood_image ?o ?m)
)
(:action Merge-good_image
:parameters ( ?o - objective ?m - mode ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood_image ?o ?m)) 
	(or (KGivengood_image ?o ?m tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood_image ?o ?m tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood_image ?o ?m))
)

(:action RefuteT-good_image
:parameters ( ?o - objective ?m - mode ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood_image ?o ?m ?TAG_PARAM V_TRUE) (KNgood_image ?o ?m) (not (good_image ?o ?m)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good_image
:parameters ( ?o - objective ?m - mode ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood_image ?o ?m ?TAG_PARAM V_FALSE) (Kgood_image ?o ?m) (good_image ?o ?m))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-visible_from
:parameters ( ?o - objective ?w - waypoint ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kvisible_from ?o ?w)) 
	(or (KGivenvisible_from ?o ?w tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenvisible_from ?o ?w tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kvisible_from ?o ?w))
)

(:action RefuteT-visible_from
:parameters ( ?o - objective ?w - waypoint ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenvisible_from ?o ?w ?TAG_PARAM V_TRUE) (KNvisible_from ?o ?w) (not (visible_from ?o ?w)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-visible_from
:parameters ( ?o - objective ?w - waypoint ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenvisible_from ?o ?w ?TAG_PARAM V_FALSE) (Kvisible_from ?o ?w) (visible_from ?o ?w))
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
