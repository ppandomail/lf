//-------CONFIGURATION
name: Binario a Unario 3bits
init: q0
accept: q8

//Transiciones
q0,1
q1,1,>

q1,1
q2,1,>

q2,1
q3,1,>

q3,_
q4,1,>

q4,_
q5,1,>

q5,_
q6,1,>

q6,_
q7,1,>

q7,_
q8,_,-

//De q2 a q16
q2,0
q16,1,>

q16,_
q5,1,>

//De q1 a q17
q1,0
q17,1,>

//De q17 a q19
q17,1
q19,1,>

q19,_
q6, 1, >

//De q17 a q18
q17,0
q18,1,>

q18,_
q7,1,>

//De q0 a q9
q0,0
q9,0,>

//De q9 a q11
q9,1
q11,1,>

//De q11 a q15
q11,1
q15,1,>

q15,_
q7,1,>

//De q11 a q14
q11,0
q14,1,>

q14,_
q8,_,-

//De q9 a q10
q9,0
q10,0,>

q10,1
q13,1,>

q13,_
q8,_,-

//de q10 a q12
q10,0
q12,0,>

q12,_
q8,_,-
