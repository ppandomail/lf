name: Generador de Codigo Hamming(7,4)
init: q0
accept: q41

// d1,d2,d3,d4 --> [P1],[P2],d1,[P3],d2,d3,d4
//                  P1(d1,d2,d4) 
//                      P2(d1,d3,d4) 
//                               P3(d2,d3,d4)
// In   --> Out
// 0000 --> 000000
// 1101 --> [1][0]1[0]101
// 0010 --> [0][1]0[1]010
// 0011 --> [1][0]0[0]011
// 0100 --> [1][0]0[1]100
// ...
// 0111 --> [0][0]0[1]111
// 1111 --> [1][1]1[1]111
//
// https://en.wikipedia.org/wiki/Hamming(7,4)

// de q0 a q14 primera parte (P3)
// de q14 a q27 segunda parte (P2)
// de q27 a q41 tercera parte (P1)

q0,1
q1,#,<

q0,0
q2,#,<

q1,_
q3,1,>

q2,_
q4,0,>

q3,#
q5,#,>

q4,#
q5,#,>

q5,0
q6,0,>

q5,1
q7,1,>

q6,0
q8,0,>

q6,1
q9,1,>

q7,0
q9,0,>

q7,1
q8,1,>

q8,0
q10,0,>

q8,1
q11,1,>

q9,0
q11,0,>

q9,1
q10,1,>

q10,_
q10,_,<

q11,_
q11,_,<

q10,0
q12,0,<

q10,1
q12,1,<

q11,0
q13,0,<

q11,1
q13,1,<

q12,1
q12,1,<

q12,0
q12,0,<

q13,1
q13,1,<

q13,0
q13,0,<

q12,#
q14,0,<

q13,#
q14,1,<


q14,0
q15,0,>

q14,1
q16,1,>

q15,0
q17,0,>

q15,1
q17,1,>

q16,0
q18,0,>

q16,1
q18,1,>

q17,0
q19,0,>

q17,1
q19,1,>

q18,0
q20,0,>

q18,1
q20,1,>

q19,0
q21,0,>

q19,1
q22,1,>

q20,0
q22,0,>

q20,1
q21,1,>

q21,0
q23,0,>

q21,1
q24,1,>

q22,0
q24,0,>

q22,1
q23,1,>

q23,_
q25,_,<

q24,_
q26,_,<

q25,0
q25,0,<

q25,1
q25,1,<

q26,0
q26,0,<

q26,1
q26,1,<

q25,_
q27,0,-

q26,_
q27,1,-

q27,0
q28,0,>

q27,1
q28,1,>

q28,0
q29,0,>

q28,1
q30,1,>

q29,0
q31,0,>

q29,1
q31,1,>

q30,0
q32,0,>

q30,1
q32,1,>

q31,0
q33,0,>

q31,1
q34,1,>

q32,0
q34,0,>

q32,1
q33,1,>

q33,0
q35,0,>

q33,1
q35,1,>

q34,0
q36,0,>

q34,1
q36,1,>

q35,0
q37,0,>

q35,1
q38,1,>

q36,0
q38,0,>

q36,1
q37,1,>

q37,_
q37,_,<

q38,_
q38,_,<

q37,0
q39,0,<

q37,1
q39,1,<

q38,0
q40,0,<

q38,1
q40,1,<

q39,0
q39,0,<

q39,1
q39,1,<

q40,0
q40,0,<

q40,1
q40,1,<

q39,_
q41,0,-

q40,_
q41,1,-