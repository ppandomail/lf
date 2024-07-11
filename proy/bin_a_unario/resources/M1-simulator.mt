//-------CONFIGURATION
name: Binario a Unario 3bits
init: q0
accept: q13

//Transiciones
q0,0
q0,0,>

q0,1
q0,1,>

q0,_
q1,_,<

q1,0
q2,0,<

q1,1
q2,A,<

q2,1
q3,B,<

q2,0
q3,0,<

q3,1
q4,C,<

q3,0
q4,0,<

q4,_
q5,_,>

//Rama que sale de q5 a q6
q5,C
q6,1,>

q6,0
q9,1,>

//Rama que sale de q9 a q10
q9,A
q10,1,>

q10,_
q14,1,>

q14,_
q15,1,>

q15,_
q13,_,-

//Rama que sale de q9 a q11
q9,0
q11,1,>

q11,_
q12,1,>

q12,_
q13,_,-

//Rama que sale de q6 a q7
q6,B
q7,1,>

//Rama que sale de q7 a q18
q7,0
q18,1,>

q18,_
q19,1,>

q19,_
q20,1,>

q20,_
q21,1,>

q21,_
q13,_,-

//Rama que va de q7 a q8
q7,A
q8,1,>

q8,_
q16,1,>

q16,_
q17,1,>

q17,_
q22,1,>

q22,_
q23,1,>

q23,_
q13,_,-

//Rama que sale de q5 a q24
q5,0
q24,0,>

//Rama que sale de q24 a q26
q24,0
q26,0,>

//Rama que sale de q26 a q31
q26,0
q31,0,>

q31,_
q13,_,-

//Rama que sale de q26 a q27
q26,A
q27,1,>

q27,_
q13,_,-

//Rama que sale de q24 a q25
q24,B
q25,1,>

//Rama que sale de q25 a q29
q25,A
q29,1,>

q29,_
q30,1,>

q30,_
q13,_,-

//Rama que sale de q25 a q28
q25,0
q28,1,>

q28,_
q13,_,-
