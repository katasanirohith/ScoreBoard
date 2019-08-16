module fpa_tb();

reg temper,sign1,sign2;
reg [15:0] temp1,temp2;
reg[31:0] temp3, temp4;
real int1,float1,int2,float2;
integer iter,index1=-1,index2=-1,idk1,idk2;
real fin;
integer inpu,countz=9,podistionof = 31,indw1,indw2,flaa=1;
reg [15:0] finalans1,finalans2;
wire [15:0] finaloutput;

fpa obj(
.a(finalans1),
.b(finalans2),
.out(finaloutput)
);

initial begin
      sign1 = 0;     int1 = 3;     float1 = 0.5;       
      sign2 = 0;     int2 = 4;     float2 = 0.5;      
if(sign1==sign2)
  if(int1 + int2 + float1 + float2 >=65536) begin
    if(!sign1)
      $display("Out Of Range +ve");
    else
      $display("Out of Range -ve");
    $finish;
    end
end

initial begin
if(int1==0 && float1==0) begin
   if(sign2) begin
     $display("-%fin",int2+float2);
     $finish;
   end
   else begin
     $display("+%fin",int2+float2);
     $finish;
   end
end
else if(int2==0 && float2==0) begin
    if(sign1) begin
     $display("-%fin",int1+float1);
     $finish;
   end
   else begin
     $display("+%fin",int1+float1);
     $finish;
    end
end
end

initial begin
    inpu = int1;
  for(iter=0;iter<=15;iter=iter+1)    begin
    temper = inpu % 2;
  if(temper)
    index1 = iter;
    temp1[iter] = temper;
    inpu = inpu/2;
  end
  fin = float1;
  for(iter=31;iter>=0;iter=iter-1) begin
    fin = fin * 2;
   if(fin >= 1) begin
    temp3[iter] = 1;
    if(flaa)
     idk1 = iter-32;
     fin = fin - 1;
     flaa = 0;
    end
   else
    temp3[iter] = 0;
   end
  inpu = int2;
  for(iter=0;iter<=15;iter=iter+1)    begin
      temper = inpu % 2;
      if(temper)
        index2 = iter;
        temp2[iter] = temper;
        inpu = inpu/2;
      end
  fin = float2; flaa = 1;
  for(iter=31;iter>=0;iter=iter-1) begin
      fin = fin * 2;
      if(fin >= 1) begin
        temp4[iter] = 1;
       if(flaa)
         idk2 = iter-32;
         fin = fin - 1;
         flaa = 0;
       end
      else
         temp4[iter] = 0;
      end
      finalans1[15] = sign1;  finalans2[15] = sign2;
  if(index1 == -1)
     finalans1[14:10] = 15 + idk1;
  else
     finalans1[14:10] = 15+index1;
  if(index2 == -1)
     finalans2[14:10] = 15 + idk2;
  else
     finalans2[14:10] = 15+index2;
     indw1 = index1-1;    indw2 = index2-1;
  if(index1 >= 0) begin
  while(countz >= 0 && indw1>=0) begin
     finalans1[countz] = temp1[indw1];
     indw1 = indw1 - 1;
     countz = countz - 1;
  end
  end
  if(index1<0)
     podistionof = 31+idk1;
     while(countz >= 0) begin
     finalans1[countz] = temp3[podistionof];
     podistionof = podistionof - 1;
     countz = countz - 1;
  end
     countz = 9; podistionof = 31;
  if(index2 >=0) begin
    while(countz > 0 && indw2>=0) begin
     finalans2[countz] = temp2[indw2];
     indw2 = indw2 - 1;
     countz = countz - 1;
   end
 end
  if(index2 < 0)
     podistionof = 31+idk2;
  while(countz >= 0) begin
   finalans2[countz] = temp4[podistionof];
   podistionof = podistionof - 1;
   countz = countz - 1;
  end
end
initial begin
#5;
   #1;
   $display("ans fpa: %b %d %d",finaloutput,int2,float2);
end
initial begin
#7;
end
endmodule

