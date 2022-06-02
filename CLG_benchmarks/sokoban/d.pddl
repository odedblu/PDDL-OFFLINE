(define (domain sokoban-sequential)
(:requirements :strips :typing)
  (:types location direction player stone)
  (:predicates (clear ?l - location)
	       (at ?p - player ?l - location)
		   (at-stone ?s - stone ?l - location)
	       (at-goal ?s - stone)
	       (IS-GOAL ?l - location)
	       (IS-NONGOAL ?l - location)
               (MOVE-DIR ?from - location ?to - location ?dir - direction))

  (:action move
   :parameters (?p - player ?from - location ?to - location ?dir - direction)
   :precondition (and (at ?p ?from)
                      (clear ?to)
                      (MOVE-DIR ?from ?to ?dir)
                      )
   :effect       (and (not (at ?p ?from))
                      (not (clear ?to))
                      (at ?p ?to)
                      (clear ?from)
                      )
   )
   

  (:action push-to-nongoal
   :parameters (?p - player ?s - stone
                ?ppos - location ?from - location ?to - location
                ?dir - direction)
   :precondition (and (at ?p ?ppos)
                      (at-stone ?s ?from)
                      (clear ?to)
                      (MOVE-DIR ?ppos ?from ?dir)
                      (MOVE-DIR ?from ?to ?dir)
                      (IS-NONGOAL ?to)
                      )
   :effect       (and (not (at ?p ?ppos))
                      (not (at-stone ?s ?from))
                      (not (clear ?to))
                      (at ?p ?from)
                      (at-stone ?s ?to)
                      (clear ?ppos)
                      (not (at-goal ?s))
                      )
   )

  (:action push-to-goal
   :parameters (?p - player ?s - stone
                ?ppos - location ?from - location ?to - location
                ?dir - direction)
   :precondition (and (at ?p ?ppos)
                      (at-stone ?s ?from)
                      (clear ?to)
                      (MOVE-DIR ?ppos ?from ?dir)
                      (MOVE-DIR ?from ?to ?dir)
                      (IS-GOAL ?to)
                      )
   :effect       (and (not (at ?p ?ppos))
                      (not (at-stone ?s ?from))
                      (not (clear ?to))
                      (at ?p ?from)
                      (at-stone ?s ?to)
                      (clear ?ppos)
                      (at-goal ?s)
                      )
   )
   
   
   
    (:action observeStone
   :parameters (?p - player ?s - stone
                ?ppos - location ?from - location
                ?dir - direction)
   :precondition (and (at ?p ?ppos)
                      (MOVE-DIR ?ppos ?from ?dir)
                      )
	:observe  (at-stone ?s ?from)
   )
)
