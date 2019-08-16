module pp(a,b,o);
input [1:0]a;
input [1:0]b;
output [1:0]o;
wire [1:0]o;
assign o[0]=(~b[1] & b[0] & ~a[1] & a[0]);
assign o[1]=((a[1] & ~a[0]) | (b[1] & ~b[0] & a[0] & ~a[1]));
endmodule

module add(t,a,b,s);
input [1:0]t;
input a,b;
output s;
assign s= t[1]^a^b;
endmodule

module kgp(a,b,d);
input a,b;
output [1:0]d;
assign d[0]=a ^ b;
assign d[1]=a & b;
endmodule

module cla_adder1(a,b,s);
input [31:0]a;
input [31:0]b;
output [31:0]s;
wire [32:0][1:0]k,t,t1,t2,t3,t4,t5;
assign k[0]=0;
genvar i;
generate
for(i=0;i<32;i=i+1) begin: g1
  kgp kgp1(a[i],b[i],k[i+1]);
end
assign t[0]=k[0];
for(i=1;i<=32;i=i+1) begin: g2
  pp pp1(k[i],k[i-1],t[i]);
end

for(i=0;i<2;i=i+1) begin
  assign t1[i]=t[i];
end

for(i=2;i<=32;i=i+1) begin: g3
  pp pp2(t[i],t[i-2],t1[i]);
end

for(i=0;i<4;i=i+1) begin
  assign t2[i]=t1[i];
end

for(i=4;i<=32;i=i+1) begin: g4
  pp pp3(t1[i],t1[i-4],t2[i]);
end

for(i=0;i<8;i=i+1) begin
  assign t3[i]=t2[i];
end

for(i=8;i<=32;i=i+1) begin: g5
  pp pp4(t2[i],t2[i-8],t3[i]);
end

for(i=0;i<16;i=i+1) begin
  assign t4[i]=t3[i];
end

for(i=16;i<=32;i=i+1) begin: g6
  pp pp5(t3[i],t3[i-16],t4[i]);
end

for(i=0;i<32;i=i+1) begin
  assign t5[i]=t4[i];
end

for(i=32;i<=32;i=i+1) begin: g7
  pp pp6(t4[i],t4[i-32],t5[i]);
end

for(i=0;i<32;i=i+1) begin: g8
  add adder(t5[i],a[i],b[i],s[i]);
end
endgenerate
endmodule
