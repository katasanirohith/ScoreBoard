`include "kgp.v"
module parallel(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16);

input [1:0]r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16;
wire [1:0]m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m110,m111,m112,m113,m114,m115;
wire [1:0]m21,m22,m23,m24,m25,m26,m27,m28,m29,m210,m211,m212,m213,m214;
wire [1:0]m31,m32,m33,m34,m35,m36,m37,m38,m39,m310,m311,m312;
wire [1:0]m41,m42,m43,m44,m45,m46,m47,m48;

output s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;


kgp f1(r2,r1,m11);
kgp f2(r3,r2,m12);
kgp f3(r4,r3,m13);
kgp f4(r5,r4,m14);
kgp f5(r6,r5,m15);
kgp f6(r7,r6,m16);
kgp f7(r8,r7,m17);
kgp f8(r9,r8,m18);
kgp f9(r10,r9,m19);
kgp f10(r11,r10,m110);
kgp f11(r12,r11,m111);
kgp f12(r13,r12,m112);
kgp f13(r14,r13,m113);
kgp f14(r15,r14,m114);
kgp f15(r16,r15,m115);


kgp f16(m13,m11,m21);
kgp f17(m14,m12,m22);
kgp f18(m15,m13,m23);
kgp f19(m16,m14,m24);
kgp f20(m17,m15,m25);
kgp f21(m18,m16,m26);
kgp f22(m19,m17,m27);
kgp f23(m110,m18,m28);
kgp f24(m111,m19,m29);
kgp f25(m112,m110,m210);
kgp f26(m113,m111,m211);
kgp f27(m114,m112,m212);
kgp f28(m115,m113,m213);
kgp f200(r16,m114,m214);


kgp f29(m25,m21,m31);
kgp f30(m26,m22,m32);
kgp f31(m27,m23,m33);
kgp f32(m28,m24,m34);
kgp f33(m29,m25,m35);
kgp f34(m210,m26,m36);
kgp f35(m211,m27,m37);
kgp f36(m212,m28,m38);
kgp f37(m213,m29,m39);
kgp f38(m214,m210,m310);
kgp f39(m115,m211,m311);
kgp f40(r16,m212,m312);

kgp f41(m39,m31,m41);
kgp f42(m310,m32,m42);
kgp f43(m311,m33,m43);
kgp f44(m312,m34,m44);
kgp f45(m213,m35,m45);
kgp f46(m214,m36,m46);
kgp f47(m115,m37,m47);
kgp f48(r16,m38,m48);

assign s1 = m41[0] | m41[1];
assign s2 = m42[0] | m42[1];
assign s3 = m43[0] | m43[1];
assign s4 = m44[0] | m44[1];
assign s5 = m45[0] | m45[1];
assign s6 = m46[0] | m46[1];
assign s7 = m47[0] | m47[1];
assign s8 = m48[0] | m48[1];
assign s9 = m39[0] | m39[1];
assign s10 = m310[0] | m310[1];
assign s11 = m311[0] | m311[1];
assign s12 = m312[0] | m312[1];
assign s13 = m213[0] | m213[1];
assign s14 = m214[0] | m214[1];
assign s15 = m115[0] | m115[1];
assign s16 = r16[0] | r16[1];

endmodule