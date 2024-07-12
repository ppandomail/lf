% MT Estrategia 2
% Ejemplo:
% ?- compute([1,1,0,1], Out)
% Out = [1, 0, 1, 0, 1, 0, 1, □]

start(0).

% t(state, read, write, move, nextState).
t(0,1,#,l,1).
t(0,0,#,l,2).
t(1,□,1,r,3).
t(2,□,0,r,4).
t(3,#,#,r,5).
t(4,#,#,r,5).
t(5,0,0,r,6).
t(5,1,1,r,7).
t(6,0,0,r,8).
t(6,1,1,r,9).
t(7,0,0,r,9).
t(7,1,1,r,8).
t(8,0,0,r,10).
t(8,1,1,r,11).
t(9,0,0,r,11).
t(9,1,1,r,10).
t(10,□,□,l,10).
t(11,□,□,l,11).
t(10,0,0,l,12).
t(10,1,1,l,12).
t(11,0,0,l,13).
t(11,1,1,l,13).
t(12,1,1,l,12).
t(12,0,0,l,12).
t(13,1,1,l,13).
t(13,0,0,l,13).
t(12,#,0,l,14).
t(13,#,1,l,14).
t(14,0,0,r,15).
t(14,1,1,r,16).
t(15,0,0,r,17).
t(15,1,1,r,17).
t(16,0,0,r,18).
t(16,1,1,r,18).
t(17,0,0,r,19).
t(17,1,1,r,19).
t(18,0,0,r,20).
t(18,1,1,r,20).
t(19,0,0,r,21).
t(19,1,1,r,22).
t(20,0,0,r,22).
t(20,1,1,r,21).
t(21,0,0,r,23).
t(21,1,1,r,24).
t(22,0,0,r,24).
t(22,1,1,r,23).
t(23,□,□,l,25).
t(24,□,□,l,26).
t(25,0,0,l,25).
t(25,1,1,l,25).
t(26,0,0,l,26).
t(26,1,1,l,26).
t(25,□,0,s,27).
t(26,□,1,s,27).
t(27,0,0,r,28).
t(27,1,1,r,28).
t(28,0,0,r,29).
t(28,1,1,r,30).
t(29,0,0,r,31).
t(29,1,1,r,31).
t(30,0,0,r,32).
t(30,1,1,r,32).
t(31,0,0,r,33).
t(31,1,1,r,34).
t(32,0,0,r,34).
t(32,1,1,r,33).
t(33,0,0,r,35).
t(33,1,1,r,35).
t(34,0,0,r,36).
t(34,1,1,r,36).
t(35,0,0,r,37).
t(35,1,1,r,38).
t(36,0,0,r,38).
t(36,1,1,r,37).
t(37,□,□,l,37).
t(38,□,□,l,38).
t(37,0,0,l,39).
t(37,1,1,l,39).
t(38,0,0,l,40).
t(38,1,1,l,40).
t(39,0,0,l,39).
t(39,1,1,l,39).
t(40,0,0,l,40).
t(40,1,1,l,40).
t(39,□,0,s,halt).
t(40,□,1,s,halt).

% Implementación de MT en ProLog.
% https://samples.jbpub.com/9780763772062/PrologLabBook09.pdf
% Página: 106

% caso base
compute([ ], OutTape) :- 
% start definido en estado 0.
    start(I), 
    find(I, [ ], □, [ ], OutTape).
%            |   |   | Cinta a la Derecha
%            |   | Cabezal
%            | Cinta a la Izq. 

% caso recursivo
compute([Head|Tail], OutTape) :- 
    start(I), 
    find(I, [ ], Head, Tail, OutTape).

find(State, Left, Cell, Right, OutTape) :- 
    t(State, Cell, Write, Move, Next), 
    move(Move, Left, Write, Right, A, B, C), 
    continue(Next, A, B, C, OutTape).

continue(halt, Left, Cell, Right, OutTape) :- 
    reverse(Left, R), 
    append(R, [Cell|Right], OutTape).

continue(State, Left, Cell, Right, OutTape) :- 
    find(State, Left, Cell, Right, OutTape).

move(l, [ ], Cell, Right, [ ], □, [Cell|Right]).
move(l, [Head|Tail], Cell, Right, Tail, Head, [Cell|Right]).
move(s, Left, Cell, Right, Left, Cell, Right).
move(r, Left, Cell, [ ], [Cell|Left], □, [ ]).
move(r, Left, Cell, [Head|Tail], [Cell|Left], Head, Tail).