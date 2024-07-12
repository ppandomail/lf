% MT Estrategia 1
% Ejemplo:
% ?- compute([1,1,0,1], Out).
% Out = [□,1, 0, 1, 0, 1, 0, 1, □]

% Estado inicial
start(q0).

% Transiciones de la máquina de Turing
% t(state, read, write, move, nextState).

% Generación de P3 (d2, d3, d4)
t(q0, 0, #, l, q1).
t(q0, 1, #, l, q2).

t(q1, □, 0, r, q3).
t(q2, □, 1, r, q4).

t(q3, #, #, r, q5).
t(q4, #, #, r, q6).

t(q5, 0, 0, r, q7).
t(q5, 1, 1, r, q8).

t(q6, 0, 0, r, q8).
t(q6, 1, 1, r, q7).

t(q7, 0, 0, r, q9).
t(q7, 1, 1, r, q9).

t(q8, 1, 1, r, q10).
t(q8, 0, 0, r, q10).

t(q9, 0, 0, r, q11).
t(q9, 1, 1, r, q12).

t(q10, 0, 0, r, q12).
t(q10, 1, 1, r, q11).

t(q11, □, □, l, q11).

t(q12, □, □, l, q12).

t(q11, 0, 0, l, q13).
t(q11, 1, 1, l, q13).

t(q12, 0, 0, l, q14).
t(q12, 1, 1,l, q14).

t(q13, 0, 0, l, q13).
t(q13, 1, 1, l, q13).
t(q13, #, #, l, q13).

% Generación de P2 (d1, d3, d4)

t(q14, 1, 1, l, q14).
t(q14, 0, 0, l, q14).
t(q14, #, #, l, q14).

t(q13, □, #, l, q15).

t(q14, □, #, l, q16).

t(q15, □, 0, s, q17).

t(q16, □, 1, s, q17).

t(q17, 0, 0, r, q18).
t(q17, 1, 1, r, q18).

t(q18, #, #, r, q19).

t(q19, 0, 0, r, q20).
t(q19, 1, 1, r, q21).

t(q20, #, #, r, q22).

t(q21, #, #, r, q23).

t(q22, 0, 0, r, q24).
t(q22, 1, 1, r, q24).

t(q23, 1, 1, r, q25).
t(q23, 0, 0, r, q25).

t(q24, 0, 0, r, q26).
t(q24, 1, 1, r, q27).

t(q25, 0, 0, r, q27).
t(q25, 1, 1, r, q26).

t(q26, 0, 0, r, q28).
t(q26, 1, 1, r, q29).

% Generación de P1 (d1, d2, d4)
t(q27, 0, 0, r, q29).
t(q27, 1, 1, r, q28).

t(q28, □, □, l, q30).

t(q29, □, □, l, q31).

t(q30, 1, 1, l, q30).
t(q30, 0, 0, l, q30).

t(q31, 1, 1, l, q31).
t(q31, 0, 0, l, q31).

t(q30, #, #, l, q32).
t(q31, #, #, l, q33).

t(q32, 0, 0, l, q34).
t(q32, 1, 1, l, q34).

t(q33, 0, 0, l, q35).
t(q33, 1, 1, l, q35).

t(q34, #, 0, s, q36).

t(q35, #, 1, s, q36).

t(q36, 0, 0, r, q36).
t(q36, 1, 1, r, q36).
t(q36, #, #, r, q37).

t(q37, 0, 0, r, q38).
t(q37, 1, 1, r, q39).

t(q38, 0, 0, r, q40).
t(q38, 1, 1, r, q41).

t(q39, 0, 0, r, q41).
t(q39, 1, 1, r, q40).

t(q40, 0, 0, r, q42).
t(q40, 1, 1, r, q43).

t(q41, 0, 0, r, q43).
t(q41, 1, 1, r, q42).

t(q42,□, □, l, q44).
t(q43, □, □, l, q45).

t(q44, 1, 1, l, q44).
t(q44, 0, 0, l, q44).

t(q45, 1, 1, l, q45).
t(q45, 0, 0, l, q45).

t(q44, #, 0, l, q46).

t(q45, #, 1, l, q46).

t(q46, 1, 1, l, q46).
t(q46, 0, 0, l, q46).
t(q46, □, □, r, q47).

% Implementación de la máquina de Turing en Prolog
compute([], OutTape) :-
    start(I),
    find(I, [], '□', [], OutTape).

compute([Head | Tail], OutTape) :-
    start(I),
    find(I, [], Head, Tail, OutTape).

find(State, Left, Cell, Right, OutTape) :-
    t(State, Cell, Write, Move, Next),
    move(Move, Left, Write, Right, A, B, C),
    continue(Next, A, B, C, OutTape).

continue(State, Left, Cell, Right, OutTape) :-
    (   State = q47  % Verificar si estamos en el estado de aceptación
    ->  reverse(Left, R),
        append(R, [Cell | Right], OutTape)
    ;   find(State, Left, Cell, Right, OutTape)
    ).

move(l, [], Cell, Right, [], '□', [Cell | Right]).
move(l, [Head | Tail], Cell, Right, Tail, Head, [Cell | Right]).
move(s, Left, Cell, Right, Left, Cell, Right).
move(r, Left, Cell, [], [Cell | Left], '□', []).
move(r, Left, Cell, [Head | Tail], [Cell | Left], Head, Tail).