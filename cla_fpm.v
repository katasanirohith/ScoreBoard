module cladder(input [31:0]a, input [31:0]b,output [32:0]out);
reg [32:0]out;
integer iter;
assign a[31] = 0;
wire [1:0]arrayy[0:32], x1arr[0:31], x2arr[0:31], x3arr[0:31], x4arr[0:31],x5arr[0:31];
wire x6arr[31:0];

genvar zap;
generate  
  for(zap=0; zap<=31; zap=zap+1) begin
    status s(.a(a[zap]),.b(b[zap]),.tt(arrayy[zap+1]));
  end
endgenerate

assign arrayy[0] = 0;

generate    
   for(zap=0;zap<=30;zap=zap+1) begin
     kgpgener l(.saa(arrayy[31-zap]),.faa(arrayy[30-zap]),.outt(x1arr[zap]));
    end
endgenerate

assign x1arr[31] = arrayy[0];

generate    
   for(zap=0;zap<=29;zap=zap+1) begin
     kgpgener l(.saa(x1arr[zap]),.faa(x1arr[zap+2]),.outt(x2arr[zap]));
    end
endgenerate

assign x2arr[30] = x1arr[30];
assign x2arr[31] = x1arr[31];

generate    
   for(zap=0;zap<=27;zap=zap+1) begin
     kgpgener l(.saa(x2arr[zap]),.faa(x2arr[zap+4]),.outt(x3arr[zap]));
    end
endgenerate

assign {x3arr[28], x3arr[29], x3arr[30], x3arr[31]} = {x2arr[27], x2arr[28], x2arr[30], x2arr[31]};

generate    
for(zap=0;zap<=23;zap=zap+1) begin
    kgpgener l(.saa(x3arr[zap]),.faa(x3arr[zap+8]),.outt(x4arr[zap]));
    end
endgenerate

generate    
  for(zap=24;zap<=31;zap=zap+1) begin
    assign x4arr[zap] = x3arr[zap];
  end
endgenerate

generate    
 for(zap=0;zap<=15;zap=zap+1) begin
   kgpgener l(.saa(x4arr[zap]),.faa(x4arr[zap+16]),.outt(x5arr[zap]));
 end
endgenerate

generate    
 for(zap=16;zap<=31;zap=zap+1) begin
   assign x5arr[zap] = x4arr[zap];
 end
endgenerate

generate    
 for(zap=0;zap<=31;zap=zap+1) begin
   assign x6arr[zap] = a[zap] ^ b[zap] ^ x5arr[31-zap][0];
 end
endgenerate

always @(*) begin
   for(iter=0; iter<=31; iter=iter+1) begin
      out[iter] = x6arr[iter];
   end
      out[32] = arrayy[0];
end
endmodule

module kgpgener(input [1:0]saa, input [1:0]faa,output [1:0]outt);
wire [1:0]outt;
      assign outt[1] = (saa[1] & saa[0] & !faa[1]) | (saa[0] & faa[1] & faa[0]);
      assign outt[0] = (saa[1] & saa[0] & !faa[1] & !faa[0]) | (faa[0] & saa[0]);
endmodule

module status(input a,input b,output [1:0]tt);
      assign {tt[0],tt[1]} = {a || b , a && b};
endmodule


