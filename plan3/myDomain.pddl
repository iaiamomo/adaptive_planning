(define (domain myDomain)
(:requirements :strips :equality :typing)
(:types 
Service - Thing
Capability
Object - Thing
Location
Boolean
State
ServiceRobot2 ServiceHeater ServiceProcessor ServiceCooler ServiceConverter ServiceRobot1 - Service
)
(:predicates 
(provides ?srv - Service ?c - Capability) 
(heated ?o - Object ?b - Boolean)
(processed ?o - Object ?b - Boolean)
(cooled ?o - Object ?b - Boolean)
(movable ?o - Object ?b - Boolean)
(loaded ?o - Object ?b - Boolean)
(at ?o - Object ?l - Location)
(at ?s - Service ?l - Location)
(status ?s - Service ?s - State)
)
(:functions (total-cost))
(:action load2
:parameters (?srv - ServiceRobot2 ?o - Object ?l - Location)
:precondition (and (provides ?srv loading) (loaded ?o false) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (loaded ?o true) (not(loaded ?o false)) (increase (total-cost) 1))
)
(:action unload2
:parameters (?srv - ServiceRobot2 ?o - Object ?l - Location)
:precondition (and (provides ?srv unloading) (loaded ?o true) (movable ?o true) (at ?srv ?l) (status ?srv available) )
:effect (and (loaded ?o false) (at ?o ?l) (not(loaded ?o true)) (increase (total-cost) 1))
)
(:action move2
:parameters (?srv - ServiceRobot2 ?l1 - Location ?l2 - Location)
:precondition (and (provides ?srv moving) (at ?srv ?l1) (status ?srv available) )
:effect (and (at ?srv ?l2) (not(at ?srv ?l1)) (increase (total-cost) 1))
)
(:action heat
:parameters (?srv - ServiceHeater ?o - Object ?l - Location)
:precondition (and (provides ?srv heating) (loaded ?o false) (heated ?o false) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (heated ?o true) (not(heated ?o false)) (increase (total-cost) 1))
)
(:action process
:parameters (?srv - ServiceProcessor ?o - Object ?l - Location)
:precondition (and (provides ?srv processing) (heated ?o true) (loaded ?o false) (processed ?o false) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (processed ?o true) (not(processed ?o false)) (increase (total-cost) 1))
)
(:action cool
:parameters (?srv - ServiceCooler ?o - Object ?l - Location)
:precondition (and (provides ?srv cooling) (loaded ?o false) (processed ?o true) (cooled ?o false) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (cooled ?o true) (not(cooled ?o false)) (increase (total-cost) 1))
)
(:action convert
:parameters (?srv - ServiceConverter ?o - Object ?l - Location)
:precondition (and (provides ?srv converting) (loaded ?o false) (heated ?o false) (cooled ?o false) (cooled ?o false) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (heated ?o true) (cooled ?o true) (cooled ?o true) (not(heated ?o false)) (not(cooled ?o false)) (not(cooled ?o false)) (increase (total-cost) 1))
)
(:action load1
:parameters (?srv - ServiceRobot1 ?o - Object ?l - Location)
:precondition (and (provides ?srv loading) (loaded ?o false) (movable ?o true) (at ?o ?l) (at ?srv ?l) (status ?srv available) )
:effect (and (loaded ?o true) (not(loaded ?o false)) (increase (total-cost) 1))
)
(:action unload1
:parameters (?srv - ServiceRobot1 ?o - Object ?l - Location)
:precondition (and (provides ?srv unloading) (loaded ?o true) (movable ?o true) (at ?srv ?l) (status ?srv available) )
:effect (and (loaded ?o false) (at ?o ?l) (not(loaded ?o true)) (increase (total-cost) 1))
)
(:action move1
:parameters (?srv - ServiceRobot1 ?l1 - Location ?l2 - Location)
:precondition (and (provides ?srv moving) (at ?srv ?l1) (status ?srv available) )
:effect (and (at ?srv ?l2) (not(at ?srv ?l1)) (increase (total-cost) 1))
)

)