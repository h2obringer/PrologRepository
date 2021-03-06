male(jerry). %grandpa
male(dick). %grandpa
male(mark). %father
male(paul). %uncle
male(alan). %uncle
male(randy). %myself
male(doug). %brother
male(matt). %brother
male(nathan). %cousin
male(nick). %cousin
male(zack). %cousin
male(dilon). %cousin
male(ryan). %cousin
male(anthony). %cousin


female(carolyn). %grandmother
female(mary). %grandmother
female(annette). %mother
female(anne). %aunt
female(jackie). %aunt
female(marie). %aunt
female(sarah). %cousin
female(jessica). %cousin
female(bethany). %cousin
female(michelle). %cousin
female(rachel). %sister


parent_of(carolyn,mark). 
parent_of(carolyn,paul). 
parent_of(carolyn,anne). 
parent_of(carolyn,marie).
parent_of(jerry,mark). 
parent_of(jerry,paul). 
parent_of(jerry,anne). 
parent_of(jerry,marie).
 
parent_of(mary,annette). 
parent_of(mary,alan). 
parent_of(mary,john). 
parent_of(mary,jackie). 
parent_of(dick,annette). 
parent_of(dick,alan). 
parent_of(dick,john). 
parent_of(dick,jackie).



parent_of(mark,randy). 
parent_of(mark,doug). 
parent_of(mark,matt). 
parent_of(mark,rachel). 
parent_of(annette,randy). 
parent_of(annette,doug). 
parent_of(annette,matt). 
parent_of(annette,rachel). 

parent_of(alan,zack). 
parent_of(john,jessica). 
parent_of(john,sarah). 
parent_of(jackie,anthony). 

parent_of(anne,nathan). 
parent_of(anne,dilon). 
parent_of(anne,michelle). 
parent_of(anne,bethany). 
parent_of(anne,ryan). 
parent_of(marie,nick). 



mother_of(X,Y):-
	female(X),parent_of(X,Y).
father_of(X,Y):-
	male(X),parent_of(X,Y).
child_of(X,Y):-
	parent_of(Y,X).
daughter_of(X,Y):-
	female(X),child_of(X,Y).
son_of(X,Y):-
	male(X),child_of(X,Y).
sibling(X,Y):-
	parent_of(Z,Y),parent_of(Z,X),X\==Y.
sibling(Y,X):-
	parent_of(Z,Y),parent_of(Z,X),X\==Y.
grandparent_of(X,Y):-
	parent_of(X,Z),parent_of(Z,Y).
grandfather_of(X,Y):-
	male(X),grandparent_of(X,Y).
grandmother_of(X,Y):-
	female(X),grandparent_of(X,Y).
aunt_of(X,Y):-
	female(X),parent_of(Z,Y),sibling(Z,X).
uncle_of(X,Y):-
	male(X),parent_of(Z,Y),sibling(Z,X).
cousin(X,Y):-
	aunt_of(Z,X),child_of(Y,Z).
cousin(Y,X):-
	aunt_of(Z,X),child_of(Y,Z). %adding got sarah and jessica to come 
up as an answer which is correct. 
cousin(X,Y):-
	uncle_of(Z,X),child_of(Y,Z).
cousin(Y,X):-
	uncle_of(Z,X),child_of(Y,Z). %adding got sarah and jessica to come 
up as an answer which is correct.


writelist([]).
writelist([H|T]):-writeonce(H,T),writelist(T).
writeonce(H,T):-member(H,T).
writeonce(H,T):-not(member(H,T)),write(H),nl.
