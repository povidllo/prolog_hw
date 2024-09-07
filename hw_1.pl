/*
 * Logical puzzle.
 *
 * Butsie is a brown cat, Cornie is a black cat, Mac is a red cat.
 * Flash, Rover and Spot are dogs. Flash is a spotted dog, Rover
 * is a red dog and Spot is a white dog. Fluffy is a black dog.
 *
 * Tom owns any pet that is either brown or black. Kate owns all
 * non-white dogs, not belonging to Tom.
 *
 * All pets Kate or Tom owns are pedigree animals.
 *
 * Alan owns Mac if Kate does not own Butsie and Spot is not a pedigree
 * animal.
 *
 * Write a Prolog program that answers, which animals do not have an owner.
*/

%P - person, A - animal, T - type of animal, C - Color
%\+ - not

animal('cat', 'brown', 'Butsie').
animal('cat', 'black', 'Cornie').
animal('cat', 'red', 'Mac').
animal('dog', 'spotted', 'Flash').
animal('dog', 'red', 'Rover').
animal('dog', 'white', 'Spot').
animal('dog', 'black', 'Fluffy').

person('Tom').
person('Kate').
person('Alan').


own('Tom', A) :- animal(_, 'brown', A); animal(_, 'black', A).
own('Kate', A) :- animal('dog', C, A), dif(C, 'white'), \+ own('Tom', A).
own('Alan', 'Mac') :- \+ own('Kate', 'Butsie'), \+ pedigree('Spot').

pedigree(A) :- own(P, A), dif(P, 'Alan').

answer(A) :- animal(_, _, A), \+ own('Tom', A), \+ own('Kate', A), \+ own('Alan', A).
