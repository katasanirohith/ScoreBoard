`include "cla_fpm.v"

module wallacemultiplier(input [15:0]a, input [15:0]b, output [32:0]out);

reg [30:0] inarray[0:15];
wire [30:0] xarray[14:0];
wire [31:0] yarray[14:0];
reg [31:0] temparray;

integer iter,jter;
genvar dter,oter;

initial begin
  for(iter=0; iter<=15; iter=iter+1) begin
    inarray[iter]=0;
  end
end

always @ ( * ) begin
  for(iter=0; iter<=15; iter=iter+1) begin
   for(jter=0; jter<=15; jter=jter+1) begin
     inarray[iter][jter+iter] = a[jter] && b[iter];
    end
      end
end

generate    
  for(dter=0; dter<=14; dter=dter+1) begin
    assign yarray[dter][0] = 0;
   end
endgenerate

generate    
  for(oter=0; oter<15; oter=oter+3) begin
   for(dter=0; dter<=30; dter=dter+1) begin
     famo f(inarray[oter][dter],inarray[oter+1][dter],inarray[oter+2][dter],xarray[oter][dter],yarray[oter][dter+1]);
    end
  end
endgenerate

generate    
  for(dter=0; dter<=30; dter=dter+1) begin
    famo f(xarray[0][dter],yarray[0][dter],xarray[3][dter],xarray[1][dter],yarray[1][dter+1]);
   end
endgenerate

generate    
  for(dter=0; dter<=30; dter=dter+1) begin
   famo f(xarray[6][dter],yarray[6][dter],yarray[3][dter],xarray[2][dter],yarray[2][dter+1]);
  end
endgenerate

generate    
  for(dter=0; dter<=30; dter=dter+1) begin
   famo f(xarray[9][dter],yarray[9][dter],xarray[12][dter],xarray[4][dter],yarray[4][dter+1]);
  end
endgenerate
generate    
  for(dter=0; dter<=30; dter=dter+1) begin
   famo f(xarray[1][dter],yarray[1][dter],xarray[2][dter],xarray[5][dter],yarray[5][dter+1]);
  end
endgenerate

generate    
  for(dter=0; dter<=30; dter=dter+1) begin
   famo f(xarray[4][dter],yarray[4][dter],yarray[2][dter],xarray[7][dter],yarray[7][dter+1]);
  end
endgenerate
generate    
   for(dter=0; dter<=30; dter=dter+1) begin
    famo f(xarray[5][dter],yarray[5][dter],xarray[7][dter],xarray[8][dter],yarray[8][dter+1]);
   end
endgenerate

generate    
   for(dter=0; dter<=30; dter=dter+1) begin
    famo f(inarray[15][dter],yarray[12][dter],yarray[7][dter],xarray[10][dter],yarray[10][dter+1]);
    end
endgenerate
generate    
   for(dter=0; dter<=30; dter=dter+1) begin
    famo f(xarray[8][dter],yarray[8][dter],xarray[10][dter],xarray[11][dter],yarray[11][dter+1]);
   end
endgenerate

generate    
   for(dter=0; dter<=30; dter=dter+1) begin
    famo f(xarray[11][dter],yarray[11][dter],yarray[10][dter],xarray[13][dter],yarray[13][dter+1]);
   end
endgenerate

initial begin
  #5;
    for(iter=0; iter<=30; iter=iter+1) begin
      temparray[iter] = xarray[13][iter];
    end
  temparray[31]=0;
end

cladder obj(.a(temparray),.b(yarray[13]),.out(out));
endmodule

module famo(input a,input b, input c, output s,output oter);
      xor(temp1,a,b);      
	  xor(temp2,c,temp1);
assign s = temp2;
      and(temp3,a,b);      
	  and(temp4,b,c);      
	  and(temp5,a,c);
      or(w6,temp3,temp4);     
	  or(w7,w6,temp5);
assign oter = w7;
endmodule
