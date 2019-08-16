`include "wtm.v"

module fpm(input [15:0]a, input [15:0]b, output[15:0]out);
wire [10:0]temp1,temp2;
wire checksign;
wire [15:0] temp3, temp4;
wire [32:0] wallaceoutput;

assign checksign = a[15]==b[15] ? 1 : 0;
assign out[15] = !checksign ? 1 : a[15];
assign {temp1[9:0], temp2[9:0]} = {a[9:0], b[9:0]};

assign temp1[10] = 1;
assign temp2[10] = 1;
assign temp3 = temp1;
assign temp4 = temp2;

wallacemultiplier obj(temp3, temp4, wallaceoutput);
assign out[14:10] = a[14:10] + b[14:10] - 15 -21 + $clog2(wallaceoutput)  ;

assign out[9:0] = wallaceoutput[21]==1 ? wallaceoutput[20:11] : wallaceoutput[19:10];
endmodule
