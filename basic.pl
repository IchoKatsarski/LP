member(X,[X|_]).
member(X,[_|T]):-member(X,T).

first(X,[X|_]).

last(X,[X]).
last(X,[_|T]):-last(X,T).

element_at(X,[X|_],1).
element_at(X,[_|T],R):- R1 is R - 1, element_at(X,T,R1).

append(X,[],X).
append([],X,X).
append([H|T],X,[H|Res]):- append(T,X,Res).



remove(X,[X|XS],XS).
remove(X,[H|T],[H|Res]):- remove(X,T,Res).

perm([X,Y],Z):- perm(Y,W), remove(X,Z,W).
perm([],[]).

reverse([],X,X).
reverse([X|Y],Z,W):-reverse(Y,[X,Z],W).

naiverev([],[]). 
naiverev([H|T],Res):- append(RevT,[H],Res),  naiverev(T,RevT).

pallindrome(L):-naiverev(L,L).
  

sublist([],_).
sublist([X|T],[X|S]):- sublist(T,S).
sublist(X,[_|T]):-sublist(X,T).

%sublist(S,L):-append(X,_,L), append(_,S,X).

union([X|Y],Z,W) :- member(X,Z),  union(Y,Z,W).
union([X|Y],Z,[X|W]) :- \+ member(X,Z), union(Y,Z,W).
union([],Z,Z).
 
intersection([X|Y],M,[X|Z]) :- member(X,M), intersection(Y,M,Z).
intersection([X|Y],M,Z) :- \+ member(X,M), intersection(Y,M,Z).
intersection([],_,[]).

myunion([X|T],Y,Z):-member(X,Y), myunion(T,Y,Z).
myunion([X|T],Y,[X|Z]):- member(X,Y), myunion(T,Y,Z).
myunion([],X,X).

len(0,[]).
len(X,[_|T]):- len(X1,T), X is X1 + 1 .

mysubset([H|T],[H|R]):- subset(T,R).
mysubset([_|T],R):-subset(T,R).
mysubset([],[]).

sum(Res,[H|T]):- sum(Res1,T), Res is Res1 + H.
sum(0,[]).

merge(A,[],A).
merge([],A,A).
merge([A|Ra],[B|Rb],[A|Res]):- A < B, merge(Ra,[B|Rb],Res).
merge([A|Ra],[B|Rb],[B|Res]):- A > B, merge([A|Ra],Rb,Res).

%generators
n(0).
n(X):-n(X1), X is X1 + 1. 

mybetween(A,A,B):- A =< B.
mybetween(X,A,B):- A < B, A1 is A + 1, mybetween(X,A1,B).

sum1000(Res):-mybetween(X,0,32), mybetween(Y,0,32), Res is (X*X) + (Y*Y), X < 1000.

%factorial(0,F,F). 
%factorial(N,A,F) :-   N > 0,  A1 is N*A,  N1 is N -1, factorial(N1,A1,F). 

factorial(0,1). 
factorial(N,F) :- N>0, N1 is N-1,  factorial(N1,F1), F is N * F1.

pow(_,0,1).
pow(X,Y,Z) :- Y1 is Y - 1, pow(X,Y1,Z1), Z is Z1*X.
%[1 2 3] = 123

q([],0).
q([H|T],Res):- len(X,T), q(T,Res1) ,pow(10,X,Z), B is  H * Z, Res is B + Res1.

p([],[],0).
p(L,S,Z):- q(L,X), q(S,Y), Z is X+ Y.


my_flatten(X,[X]):- \+ is_list(X).
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).






















