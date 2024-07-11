% Definición de los estados finales
final(q8).

% Definición de las transiciones
trans(q0, 0, q9, 0, right).
trans(q0, 1, q1, 1, right).
trans(q1, 1, q2, 1, right).
trans(q1, 0, q17, 1, right).
trans(q2, 1, q3, 1, right).
trans(q2, 0, q16, 1, right).
trans(q3, b, q4, 1, right).
trans(q4, b, q5, 1, right).
trans(q5, b, q6, 1, right).
trans(q6, b, q7, 1, right).
trans(q7, b, q8, b, stay).
trans(q9, 0, q10, 0, right).
trans(q10, 1, q13, 1, right).
trans(q10, 0, q12, 0, right).
trans(q11, 0, q14, 1, right).
trans(q11, 1, q15, 1, right).
trans(q12, b, q8, b, stay).
trans(q13, b, q8, b, stay).
trans(q14, b, q8, b, stay).
trans(q15, b, q7, 1, right).
trans(q16, b, q5, 1, right).
trans(q17, 1, q19, 1, right).
trans(q17, 0, q18, 1, right).
trans(q18, b, q7, 1, right).
trans(q19, b, q6, 1, right).

% Movimiento en la cinta
turing(Tape0, Tape) :-
    perform(q0, [], Ls, Tape0, Rs),
    reverse(Ls, Ls1),
    append(Ls1, Rs, Tape).

% Ejecuta las transiciones de la máquina de Turing
perform(Q, Ls, Ls, Rs, Rs) :- final(Q), !.
perform(Q0, Ls0, Ls, Rs0, Rs) :-
    symbol(Rs0, Sym, RsRest),
    trans(Q0, Sym, Q1, NewSym, Action),
    action(Action, Ls0, Ls1, [NewSym|RsRest], Rs1),
    perform(Q1, Ls1, Ls, Rs1, Rs).

% Lee un símbolo de la cinta
symbol([], b, []).
symbol([Sym|Rs], Sym, Rs).

% Realiza una acción (mover la cabeza de la cinta)
action(stay, Ls, Ls, Rs, Rs).
action(right, Ls0, [Sym|Ls0], [Sym|Rs], Rs).