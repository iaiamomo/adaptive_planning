(define (problem myProblem)
(:domain myDomain)
(:objects 
o1 - Object
l00 - Location
l01 - Location
l02 - Location
l03 - Location
l04 - Location
l05 - Location
l06 - Location
l10 - Location
l11 - Location
l12 - Location
l13 - Location
l14 - Location
l15 - Location
l16 - Location
l20 - Location
l21 - Location
l22 - Location
l23 - Location
l24 - Location
l25 - Location
l26 - Location
l30 - Location
l31 - Location
l32 - Location
l33 - Location
l34 - Location
l35 - Location
l36 - Location
true - Boolean
false - Boolean
available - State
broken - State
loading - Capability
unloading - Capability
moving - Capability
heating - Capability
processing - Capability
cooling - Capability
converting - Capability
rb2 - ServiceRobot2
heater - ServiceHeater
processor - ServiceProcessor
cooler - ServiceCooler
converter - ServiceConverter
rb1 - ServiceRobot1
)
(:init 
(provides rb2 loading)
(provides rb2 unloading)
(provides rb2 moving)
(provides heater heating)
(provides processor processing)
(provides cooler cooling)
(provides converter converting)
(provides rb1 loading)
(provides rb1 unloading)
(provides rb1 moving)
(status rb2 available)
(at rb2 l24)
(status heater available)
(at heater l20)
(loaded o1 false)
(at o1 l00)
(movable o1 true)
(heated o1 false)
(cooled o1 false)
(processed o1 false)
(status processor available)
(at processor l22)
(status cooler available)
(at cooler l22)
(status converter broken)
(at converter l03)
(status rb1 available)
(at rb1 l31)
(= (total-cost) 0)
)
(:goal 
(and 
(at o1 l36)
(cooled o1 true)
)
)
(:metric minimize (total-cost))

)