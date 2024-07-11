% Estado final
final(q13).

% Transiciones
trans(q0, 1, q0, 1, right).
trans(q0, 0, q0, 0, right).
trans(q0, b, q1, b, left).
trans(q1, 0, q2, 0, left).
trans(q1, 1, q2, a, left).
trans(q2, 0, q3, 0, left).
trans(q2, 1, q3, b, left).
trans(q2, b, qf, b, stay).
trans(q3, 1, q4, c, left).
trans(q3, 0, q4, 0, left).
trans(q4, b, q5, b, right).
trans(q5, c, q6, 1, right).
trans(q5, 0, q24, 0, right).
trans(q6, b, q7, 1, right).
trans(q6, 0, q9, 1, right).
trans(q7, a, q8, 1, right).
trans(q7, 0, q18, 1, right).
trans(q8, b, q16, 1, right).
trans(q9, a, q10, 1, right).
trans(q9, 0, q11, 1, right).
trans(q10, b, q14, 1, right).
trans(q11, b, q12, 1, right).
trans(q12, b, q13, b, stay).
trans(q14, b, q15, 1, right).
trans(q15, b, q13, b, stay).
trans(q16, b, q17, 1, right).
trans(q17, b, q22, 1, right).
trans(q18, b, q19, 1, right).
trans(q19, b, q20, 1, right).
trans(q20, b, q21, 1, right).
trans(q21, b, q13, b, stay).
trans(q22, b, q23, 1, right).
trans(q23, b, q13, b, stay).
trans(q24, b, q25, 1, right).
trans(q24, 0, q26, 0, right).
trans(q25, 0, q28, 1, right).
trans(q25, a, q29, 1, right).
trans(q26, a, q27, 1, right).
trans(q26, 0, q31, 0, right).
trans(q27, b, q13, b, stay).
trans(q28, b, q13, b, stay).
trans(q29, b, q30, 1, right).
trans(q30, b, q13, b, stay).
trans(q31, b, q13, b, stay).

% Predicado principal para ejecutar la máquina de Turing
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
action(left, Ls0, Ls, Rs0, Rs) :- left(Ls0, Ls, Rs0, Rs).
action(stay, Ls, Ls, Rs, Rs).
action(right, Ls0, [Sym|Ls0], [Sym|Rs], Rs).

% Mueve la cabeza de la cinta a la izquierda
left([], [], Rs0, [b|Rs0]).
left([L|Ls], Ls, Rs, [L|Rs]).

% Ejemplo de uso
% ?- turing([1, 1, 1], Ts).
% Ts = [1, 1, 1, 1, 1, 1, 1].