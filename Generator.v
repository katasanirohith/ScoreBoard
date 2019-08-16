module Generator(c1,c2,o);

input [1:0] c1,c2;
output [1:0] o;
reg [1:0] o;

always @(c1 or c2)
begin
o[0] = (!c1[1]) & c1[0] & (!(c2[1])) & c2[0];
o[1] = ((c1[1] & (!c1[0])) & (c2[1] ^ c2[0])) | (c2[1] & (!c2[0]) & (!c1[1])) ;  
end
endmodule


