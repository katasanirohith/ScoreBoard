`include "hadd.v"
//`include "cxor.v"
//`include "cand.v"
//`include "cnot.v"
//`include "cor.v"
`include "parallel.v"

module cla(a1,a2,a3,a4,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16);
input a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
output o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
wire  [1:0]r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16;
wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;

//hadd add1(a1,b1,r1[0],r1[1]);
hadd add2(a2,b2,r2[0],r2[1]);
hadd add3(a3,b3,r3[0],r3[1]);
hadd add4(a4,b4,r4[0],r4[1]);
hadd add5(a5,b5,r5[0],r5[1]);
hadd add6(a6,b6,r6[0],r6[1]);
hadd add7(a7,b7,r7[0],r7[1]);
hadd add8(a8,b8,r8[0],r8[1]);
hadd add9(a9,b9,r9[0],r9[1]);
hadd add10(a10,b10,r10[0],r10[1]);
hadd add11(a11,b11,r11[0],r11[1]);
hadd add12(a12,b12,r12[0],r12[1]);
hadd add13(a13,b13,r13[0],r13[1]);
hadd add14(a14,b14,r14[0],r14[1]);
hadd add15(a15,b15,r15[0],r15[1]);
hadd add16(a16,b16,r16[0],r16[1]);
assign r1 = 0;

parallel padd(r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r1,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16);
assign o1 = a1^b1^s1;
assign o2 = a2^b2^s2;
assign o3 = a3^b3^s3;
assign o4 = a4^b4^s4;
assign o5 = a5^b5^s5;
assign o6 = a6^b6^s6;
assign o7 = a7^b7^s7;
assign o8 = a8^b8^s8;
assign o9 = a9^b9^s9;
assign o10 = a10^b10^s10;
assign o11 = a11^b11^s11;
assign o12 = a12^b12^s12;
assign o13 = a13^b13^s13;
assign o14 = a14^b14^s14;
assign o15 = a15^b15^s15;
assign o16 = a16^b16^s16;

endmodule