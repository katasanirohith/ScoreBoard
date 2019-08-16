`include "Carry_Generation.v"
`include "adder.v"

module CLA(
      a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,
      b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,
      o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,o32
	  );

input a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,
      b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32;
output o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,o32; 
wire [1:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32,
           s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32;

adder obj1(a2,b2,r1);
adder obj2(a3,b3,r2);
adder obj3(a4,b4,r3);
adder obj4(a5,b5,r4);
adder obj5(a6,b6,r5);
adder obj6(a7,b7,r6);
adder obj7(a8,b8,r7);
adder obj8(a9,b9,r8);
adder obj9(a10,b10,r9);
adder obj10(a11,b11,r10);
adder obj11(a12,b12,r11);
adder obj12(a13,b13,r12);
adder obj13(a14,b14,r13);
adder obj14(a15,b15,r14);
adder obj15(a16,b16,r15);
adder obj16(a17,b17,r16);
adder obj17(a18,b18,r17);
adder obj18(a19,b19,r18);
adder obj19(a20,b20,r19);
adder obj20(a21,b21,r20);
adder obj21(a22,b22,r21);
adder obj22(a23,b23,r22);
adder obj23(a24,b24,r23);
adder obj24(a25,b25,r24);
adder obj25(a26,b26,r25);
adder obj26(a27,b27,r26);
adder obj27(a28,b28,r27);
adder obj28(a29,b29,r28);
adder obj29(a30,b30,r29);
adder obj30(a31,b31,r30);
adder obj31(a32,b32,r31);
assign r32 = 0;
		   
Carry_Generation obj(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32,
                     s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32);

assign o1 =   a1^b1^s1;
assign o2 =  a2^b2^s2;
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
assign o17 = a17^b17^s17;
assign o18 = a18^b18^s18;
assign o19 = a19^b19^s19;
assign o20 = a20^b20^s20;
assign o21 = a21^b21^s21;
assign o22 = a22^b22^s22;
assign o23 = a23^b23^s23;
assign o24 = a24^b24^s24;
assign o25 = a25^b25^s25;
assign o26 = a26^b26^s26;
assign o27 = a27^b27^s27;
assign o28 = a28^b28^s28;
assign o29 = a29^b29^s29;
assign o30 = a30^b30^s30;
assign o31 = a31^b31^s31;
assign o32 = a32^b32^s32;

endmodule