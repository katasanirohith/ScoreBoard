`include "cla32.v"

module fulladde(inte1,inte2,inte3,anssum,anscout);
input inte1,inte2,inte3;
output anssum,anscout;
assign anssum=inte1^inte2^inte3;
assign anscout=(inte1&inte2)|(inte2&inte3)|(inte1&inte3);
endmodule

module generation(temp1,temp2,temp3,temper1,temper2);
input [31:0] temp1,temp2,temp3;
output [31:0] temper1,temper2;
genvar iter;
generate
for(iter=0;iter<31;iter=iter+1)
begin
fulladde obj(temp1[iter],temp2[iter],temp3[iter],temper1[iter],temper2[iter+1]);
end
endgenerate
assign temper2[0] =0;
assign temper1[31] = temp1[31] ^ temp2[31] ^ temp3[31];
endmodule

module wallace(a,b,y);
input [15:0] a,b;
output [31:0] y;
wire [31:0] val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14;
wire [31:0] outpu1,outpu2,outpu3,outpu4,outpu5,outpu6,outpu7,outpu8,outpu9,outpu10,outpu11,outpu12,outpu13,outpu14;
reg [31:0] mainarr [15:0];

integer iter,jter;
always @(a or b) begin
for(iter=0;iter<16;iter=iter+1)
begin
mainarr[iter] = 0;
end
end

integer kint=0;
always @( a or b) begin
for(iter=0;iter<16;iter=iter+1)
begin
for(jter=0;jter<16;jter=jter+1)
begin
mainarr[iter][jter+kint]=b[iter] & a[jter];
end
kint = kint+1;
end
end

generation obj1(mainarr[0],mainarr[1],mainarr[2],val1,outpu1);
generation obj2(mainarr[3],mainarr[4],mainarr[5],val2,outpu2);
generation obj3(mainarr[6],mainarr[7],mainarr[8],val3,outpu3);
generation obj4(mainarr[9],mainarr[10],mainarr[11],val4,outpu4);
generation obj5(mainarr[12],mainarr[13],mainarr[14],val5,outpu5);

generation obj6(val1,outpu1,val2,val6,outpu6);
generation obj7(outpu2,val3,outpu3,val7,outpu7);
generation obj8(val4,outpu4,val5,val8,outpu8);

generation obj9(val6,outpu6,val7,val9,outpu9);
generation obj10(outpu7,val8,outpu8,val10,outpu10);

generation obj11(val9,outpu9,val10,val11,outpu11);
generation obj12(outpu10,outpu5,mainarr[15],val12,outpu12);

generation obj13(val11,outpu11,val12,val13,outpu13);

generation obj14(val13,outpu13,outpu12,val14,outpu14);
assign y = val14+outpu14;

endmodule