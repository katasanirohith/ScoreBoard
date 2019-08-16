module cla_sim;

reg  a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,
      b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
wire  o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;

cla cladd(
 
 .a1(a1),
 .a2(a2),
 .a3(a3),
 .a4(a4),
 .a5(a5),
 .a6(a6),
 .a7(a7),
 .a8(a8),
 .a9(a9),
 .a10(a10),
 .a11(a11),
 .a12(a12),
 .a13(a13),
 .a14(a14),
 .a15(a15),
 .a16(a16),
 .b1(b1),
 .b2(b2),
 .b3(b3),
 .b4(b4),
 .b5(b5),
 .b6(b6),
 .b7(b7),
 .b8(b8),
 .b9(b9),
 .b10(b10),
 .b11(b11),
 .b12(b12),
 .b13(b13),
 .b14(b14),
 .b15(b15),
 .b16(b16),
 .o1(o1),
 .o2(o2),
 .o3(o3),
 .o4(o4),
 .o5(o5),
 .o6(o6),
 .o7(o7),
 .o8(o8),
 .o9(o9),
 .o10(o10),
 .o11(o11),
 .o12(o12),
 .o13(o13),
 .o14(o14),
 .o15(o15),
 .o16(o16)
);

initial begin

 a1 =  0;
 a2 =  0;
 a3 =  0;
 a4 =  0;
 a5 =  0;
 a6 =  0;
 a7 =  0;
 a8 =  0;
 a9 =  0;
 a10 =  1;
 a11 =  1;
 a12 =  1;
 a13 =  1;
 a14 =  0;
 a15 =  1;
 a16 =  1;  	  
 b1 =   0;
 b2 =   0;
 b3 =   0;
 b4 =   0;
 b5 =   0;
 b6 =   0;
 b7 =   0;
 b8 =   0;
 b9 =   0;
 b10 =  1;
 b11 =  1;
 b12 =  0;
 b13 =  0;
 b14 =  1;
 b15 =  0;
 b16 =  0;
 #5 $finish;
end

initial begin
$monitor(" %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16);
end


endmodule
    