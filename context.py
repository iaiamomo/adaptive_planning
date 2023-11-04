from translator import *

instances = {"Object":["o1"],
             "Location":["l00","l01","l02","l03","l04","l05","l06",
                         "l10","l11","l12","l13","l14","l15","l16",
                         "l20","l21","l22","l23","l24","l25","l26",
                         "l30","l31","l32","l33","l34","l35","l36"],
             "Boolean":["true","false"]}

# predicates
atomicTerms = [atomicTerm("heated","o - Object", "b - Boolean"),
               atomicTerm("processed","o - Object", "b - Boolean"),
               atomicTerm("cooled","o - Object", "b - Boolean"),
               atomicTerm("movable","o - Object", "b - Boolean")]

groundAtomicTerms = [groundAtomicTerm("at","o1","l00"),
                     groundAtomicTerm("movable","o1","true")]

# strips: strips style
# equality: "=" as built-in predicate
# typing: allow types names in declaration of variables
requirements = ["strips","equality","typing"]

# plan goal
goal = [groundAtomicTerm("at","o1","l36"),
        groundAtomicTerm("cooled","o1","true")]
