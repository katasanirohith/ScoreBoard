`include "cla_fpa.v"

module fpa(input [15:0] a, input [15:0]b, output [15:0]out);

wire [4:0] temper,tempvar;
wire [10:0]x1arr,x2arr,x3arr,c3arr,c4arr;
wire condition1,condition2;
wire [15:0] x4arr, x5arr;
wire [16:0] ot_cla, ot_cla1;
wire [11:0] c1arr,c2arr;
assign condition1 = a[15]==b[15] ? 1 : 0;
assign condition2 = a[14:10]==b[14:10] ? 1 : 0;
assign out[15] = (a[14:10]==b[14:10] && condition1==0)? (a[9:0] >= b[9:0]? a[15] : b[15]) : (a[14:10] > b[14:10] ? a[15] : b[15]);
assign temper = a[14:10] > b[14:10] ? a[14:10] - b[14:10] : b[14:10] - a[14:10];
assign x1arr[9:0] = a[14:10] > b[14:10] ? b[9:0] : a[9:0];
assign x1arr[10] = 1;
assign x2arr = x1arr>>temper;
assign x3arr[9:0] = a[14:10] > b[14:10] ? a[9:0] : b[9:0];
assign x3arr[10] = 1;
maininv f1(x2arr,c1arr);
maininv f2(x3arr,c2arr);
assign x4arr = !condition1 ? (a[15]==1 ? c1arr : x2arr) : x2arr;
assign x5arr = !condition1 ? (b[15]==1 ? c2arr : x3arr) : x3arr;

cla obj(x4arr,x5arr,ot_cla);

inverter f3(ot_cla[10:0], c3arr);

assign c4arr = (condition1==0 && out[15]==1) ? (c3arr) : (ot_cla[10:0]);


assign tempvar = c4arr[10]?0:c4arr[9]?1:c4arr[8]?2:c4arr[7]?3:c4arr[6]?4:c4arr[5]?5:c4arr[4]?6:c4arr[3]?7:c4arr[2]?8:c4arr[1]?9:c4arr[0]?10:11;


assign out[14:10] = ((condition1==1) ? (ot_cla[11] == 1 ? (a[14:10] > b[14:10] ? a[14:10] : b[14:10]) + 1 :(a[14:10] > b[14:10] ? a[14:10] : b[14:10])) : (a[14:10] == b[14:10] ? (5'b0): ((a[14:10] > b[14:10] ? a[14:10] : b[14:10])-tempvar) ));

assign ot_cla1 = (ot_cla[11] == 1 && condition1==1) ? ot_cla>>1 : ot_cla;
assign out[9:0] = (condition1==0) ? (c4arr<<tempvar) : (ot_cla1[9:0]);

endmodule

module inverter(input [10:0]mvar, output[10:0]compareout);
      wire [10:0]ttemp;
      assign ttemp = mvar-1;
      assign compareout = ~ttemp;
endmodule


module maininv(input [10:0]mvar, output[11:0]compareout);
      wire [10:0]ttemp;
      assign ttemp = ~mvar;
      assign compareout = ttemp+1;
endmodule


