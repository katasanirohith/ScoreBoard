module adder(a,b,c);

input a,b;
output [1:0] c;
reg [1:0] c;

always @(a or b)
begin
 c[0] = a^b;
 c[1] = a&b;
end



endmodule