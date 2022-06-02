(define 
(problem Omelette-2)
(:domain Omelette-2)
(:goal (and (eggs-in bowl1 v2) (good bowl1)))
(:init
(and
(plus v0 v0 v0)
(plus v0 v1 v1)
(plus v1 v0 v1)
(plus v1 v1 v2)
(eggs-in bowl1 v0)
(good bowl1)
(different bowl1 bowl2)
(eggs-in bowl2 v0)
(good bowl2)
(different bowl2 bowl1)
)
)
)
