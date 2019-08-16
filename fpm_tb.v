module fpm_tb();

reg temper,sign1,sign2;
reg [15:0] arr1,arr2;
reg[31:0] arr3, arr4;
real int1,float1,int2,float2;
integer iter,indexi1=-1,indexi2=-1,nameindex1,nameindex2;

real realnum;
integer zap,curret_poss=9,posit = 31,inde1,inde2,fla=1;

reg [15:0] answer1,answer2;
wire [15:0] finaloutput;

fpm obj(
.a(answer1),
.b(answer2),
.out(finaloutput)
);


initial begin
    sign1 = 0;     
	int1 = 3;     
	float1 = 0.5;       
    sign2 = 0;     
	int2 = 4;     
	float2 = 0.5;  
end

initial begin
  if((int1==0 && float1==0) || (int2==0 && float2==0)) begin
    $display("%b",16'b0);
    $finish;
  end
  if((int1 + float1)*(int2 + float2) >=65536) begin
    $display("Out Of Range");
    $finish;
  end
end

initial begin
    zap = int1;
  for(iter=0;iter<=15;iter=iter+1) begin
    temper = zap % 2;
    if(temper)
     indexi1 = iter;
     arr1[iter] = temper;
     zap = zap/2;
    end
     realnum = float1;
  for(iter=31;iter>=0;iter=iter-1) begin
     realnum = realnum * 2;
    if(realnum >= 1) begin
     arr3[iter] = 1;
    if(fla)
     nameindex1 = iter-32;
     realnum = realnum - 1;
     fla = 0;
    end
   else
    arr3[iter] = 0;
    end
    zap = int2;
  for(iter=0;iter<=15;iter=iter+1)    begin
    temper = zap % 2;
    if(temper)
      indexi2 = iter;
      arr2[iter] = temper;
      zap = zap/2;
    end
      realnum = float2; fla = 1;
  for(iter=31;iter>=0;iter=iter-1) begin
    realnum = realnum * 2;
  if(realnum >= 1) begin
     arr4[iter] = 1;
    if(fla)
      nameindex2 = iter-32;
      realnum = realnum - 1;
      fla = 0;
    end
   else
     arr4[iter] = 0;
  end
  answer1[15] = sign1;  answer2[15] = sign2;
   if(indexi1 == -1)
     answer1[14:10] = 15 + nameindex1;
   else
     answer1[14:10] = 15+indexi1;
   if(indexi2 == -1)
     answer2[14:10] = 15 + nameindex2;
   else
     answer2[14:10] = 15+indexi2;
     inde1 = indexi1-1;    
	 inde2 = indexi2-1;
   if(indexi1 >= 0) begin
     while(curret_poss >= 0 && inde1>=0) begin
       answer1[curret_poss] = arr1[inde1];
       inde1 = inde1 - 1;
       curret_poss = curret_poss - 1;
    end
   end
   if(indexi1<0)
       posit = 31+nameindex1;
   while(curret_poss >= 0) begin
     answer1[curret_poss] = arr3[posit];
     posit = posit - 1;
     curret_poss = curret_poss - 1;
    end
     curret_poss = 9; posit = 31;
  if(indexi2 >=0) begin
    while(curret_poss > 0 && inde2>=0) begin
      answer2[curret_poss] = arr2[inde2];
      inde2 = inde2 - 1;
      curret_poss = curret_poss - 1;
    end
   end
  if(indexi2 < 0)
      posit = 31+nameindex2;
  while(curret_poss >= 0) begin
      answer2[curret_poss] = arr4[posit];
      posit = posit - 1;
      curret_poss = curret_poss - 1;
   end
end

initial begin
#6;
#16;
$display("a * b = %b",finaloutput);
end

initial begin
#30;

end

endmodule

    