/*`include "cxor.v"
`include "cand.v"
`include "cnot.v"
`include "cor.v"
*/
module hadd(a,b,s,c);
input a,b;
output s,c;
assign s = a^b;
assign c = a&b;
endmodule 