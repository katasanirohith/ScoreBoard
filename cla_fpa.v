module cla(input [15:0]a, input [15:0]b,output [16:0]out);
reg [16:0]out;
integer zap;
wire [1:0]warr[0:16], x1arr[0:15], x2arr[0:15], x3arr[0:15], x4arr[0:15];
wire level[15:0];
genvar vari;
generate    
   for(vari=0; vari<=15; vari=vari+1) begin
    status s(.a(a[vari]),.b(b[vari]),.t(warr[vari+1]));
   end
endgenerate
assign warr[0] = 0;

generate    
	for(vari=0;vari<=14;vari=vari+1) begin
	  kgpgener l(.s(warr[15-vari]),.f(warr[14-vari]),.o(x1arr[vari]));
    end
endgenerate

assign x1arr[15] = warr[0];

generate    
   for(vari=0;vari<=13;vari=vari+1) begin
     kgpgener l(.s(x1arr[vari]),.f(x1arr[vari+2]),.o(x2arr[vari]));
   end
endgenerate

assign x2arr[14] = x1arr[14];
assign x2arr[15] = x1arr[15];

generate    
   for(vari=0;vari<=11;vari=vari+1) begin
     kgpgener l(.s(x2arr[vari]),.f(x2arr[vari+4]),.o(x3arr[vari]));
   end
endgenerate

assign {x3arr[12], x3arr[13], x3arr[14], x3arr[15]} = {x2arr[12], x2arr[13], x2arr[14], x2arr[15]};

generate    
   for(vari=0;vari<=7;vari=vari+1) begin
      kgpgener l(.s(x3arr[vari]),.f(x3arr[vari+8]),.o(x4arr[vari]));
    end
endgenerate

generate    
  for(vari=8;vari<=15;vari=vari+1) begin
    assign x4arr[vari] = x3arr[vari];
  end
endgenerate

generate    
  for(vari=0;vari<=15;vari=vari+1) begin
    assign level[vari] = a[vari] ^ b[vari] ^ x4arr[15-vari][0];
  end
endgenerate

always @(*) begin
   for(zap=0; zap<=15; zap=zap+1) begin
     out[zap] = level[zap];
   end
     out[16] = warr[0];
end
endmodule

module status(input a,input b,output [1:0]t);
      assign {t[0],t[1]} = {a || b , a && b};
endmodule

module kgpgener(input [1:0]s, input [1:0]f,output [1:0]o);
wire [1:0]o;
      assign o[1] = (s[1] & s[0] & !f[1]) | (s[0] & f[1] & f[0]);
      assign o[0] = (s[1] & s[0] & !f[1] & !f[0]) | (f[0] & s[0]);
endmodule
