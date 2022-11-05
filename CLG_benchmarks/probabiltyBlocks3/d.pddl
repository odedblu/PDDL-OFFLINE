(define (domain probblocksworld)
(:requirements :conditional-effects :probabilistic-effects)
(:predicates (clear ?x)
             (on-table ?x)
             (on ?x ?y))



  (:action senseON
   :parameters (?b1 ?b2)
   :observe (on ?b1 ?b2))

  (:action senseCLEAR
   :parameters (?b1)
   :observe (clear ?b1))

  (:action senseONTABLE	
   :parameters (?b1)
   :observe (on-table ?b1))

(:action move-b-to-b
  :parameters (?bm ?bf ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on ?bm ?bf))
  :effect (probabilistic 0.8 (and (not (clear ?bt)) (not (on ?bm ?bf))
               (on ?bm ?bt) (clear ?bf))))

(:action move-to-t
  :parameters (?b ?bf)
  :precondition (and (clear ?b) (on ?b ?bf))
  :effect (probabilistic 0.8 (and (on-table ?b) (not (on ?b ?bf)) (clear ?bf))))

(:action move-t-to-b
  :parameters (?bm ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on-table ?bm))
  :effect (probabilistic 0.8 (and (not (clear ?bt)) (not (on-table ?bm))
               (on ?bm ?bt)))))

