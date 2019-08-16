import os


def fpa(a, b):
    if float(a) < 0:
        s1 = str(1)
    else:
        s1 = str(0)
    if float(b) < 0:
        s2 = str(1)
    else:
        s2 = str(0)

    c ,d= str(a).split(sep='.')
    i1 = str(c)
    f1 = str(d)
    f1 = "0." + f1
    e,f = str(b).split(sep='.')
    i2 = str(e)
    f2 = str(f)
    f2 = "0." + f2
    file1 = open("fpa_tb.v", "w")  # creating the tb file
    file1.write('''
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
      sign1 = ''' + s1 + ''';     
	int1 = ''' + i1 + '''; 
	float1 = ''' + f1 + ''';       
    sign2 = ''' + s2 + ''';     
	int2 = ''' + i2 + ''';     
	float2 = ''' + f2 + ''';       
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



''')
    file1.close()  # close the tb file
    # make sure cla_adder1.v and Sample.py are in the same folder as this python script
    os.system(" iverilog fpa.v fpa_tb.v ")  # executing this command gives us the executable "cla"
    os.system("vvp a.out>result.txt")  # direct the output to "result.txt" file

    file = open("result.txt", "r+")  # open "result.txt" file
    out = file.read()
    file.truncate(0)  # print the contents of the file(output)
    file.close()  # close the file "result.txt"
    return out


def cla(a, b):
    # input for arg2
    file1 = open("cla_tb.v", "w")
    print("error", a)
    print("errorb", b)
    a = int(a)
    b = int(b)
    x = bin(a)
    x = list(x[2:])
    arr = []
    arr1 = []
    for i in range(len(x), 16):
        arr.append(0)
    flist = arr + x
    flist = "".join(str(e) for e in flist)
    y = bin(b)
    y = list(y[2:])
    for i in range(len(y), 16):
        arr1.append(0)
    flist1 = arr1 + y
    flist1 = "".join(str(e) for e in flist1)
    print("flist is", flist)
    print("flist1 is", flist1)
    # creating the tb file
    file1.write('''module cla_sim;

reg  a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,
      b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
wire  o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;

cla cladd(
 
 .a1(a1),
 .a2(a2),
 .a3(a3),
 .a4(a4),
 .a5(a5),
 .a6(a6),
 .a7(a7),
 .a8(a8),
 .a9(a9),
 .a10(a10),
 .a11(a11),
 .a12(a12),
 .a13(a13),
 .a14(a14),
 .a15(a15),
 .a16(a16),
 .b1(b1),
 .b2(b2),
 .b3(b3),
 .b4(b4),
 .b5(b5),
 .b6(b6),
 .b7(b7),
 .b8(b8),
 .b9(b9),
 .b10(b10),
 .b11(b11),
 .b12(b12),
 .b13(b13),
 .b14(b14),
 .b15(b15),
 .b16(b16),
 .o1(o1),
 .o2(o2),
 .o3(o3),
 .o4(o4),
 .o5(o5),
 .o6(o6),
 .o7(o7),
 .o8(o8),
 .o9(o9),
 .o10(o10),
 .o11(o11),
 .o12(o12),
 .o13(o13),
 .o14(o14),
 .o15(o15),
 .o16(o16)
);

initial begin

 a1 =  ''' + flist[0] + ''';
 a2 =  ''' + flist[1] + ''';
 a3 =  ''' + flist[2] + ''';
 a4 =  ''' + flist[3] + ''';
 a5 =  ''' + flist[4] + ''';
 a6 =  ''' + flist[5] + ''';
 a7 =  ''' + flist[6] + ''';
 a8 =  ''' + flist[7] + ''';
 a9 =  ''' + flist[8] + ''';
 a10 =  ''' + flist[9] + ''';
 a11 =  ''' + flist[10] + ''';
 a12 =  ''' + flist[11] + ''';
 a13 =  ''' + flist[12] + ''';
 a14 =  ''' + flist[13] + ''';
 a15 =  ''' + flist[14] + ''';
 a16 =  ''' + flist[15] + ''';  	  
 b1 =   ''' + flist1[0] + ''';
 b2 =   ''' + flist1[1] + ''';
 b3 =   ''' + flist1[2] + ''';
 b4 =   ''' + flist1[3] + ''';
 b5 =   ''' + flist1[4] + ''';
 b6 =   ''' + flist1[5] + ''';
 b7 =   ''' + flist1[6] + ''';
 b8 =   ''' + flist1[7] + ''';
 b9 =   ''' + flist1[8] + ''';
 b10 =  ''' + flist1[9] + ''';
 b11 =  ''' + flist1[10] + ''';
 b12 =  ''' + flist1[11] + ''';
 b13 =  ''' + flist1[12] + ''';
 b14 =  ''' + flist1[13] + ''';
 b15 =  ''' + flist1[14] + ''';
 b16 =  ''' + flist1[15] + ''';
 #5 $finish;
end

initial begin
$monitor(" %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16);
end


endmodule
    ''')  # writing the tb file
    file1.close()  # close the tb file
    # make sure cla_adder1.v and Sample.py are in the same folder as this python script
    os.system(" iverilog -o cla cla.v cla_tb.v ")  # executing this command gives us the executable "cla"
    os.system("vvp cla>result.txt")  # direct the output to "result.txt" file

    file = open("result.txt", "r+")  # open "result.txt" file
    out = file.read()
    file.truncate(0)
    # print the contents of the file(output)
    file.close()  # close the file "result.txt"
    return out


def wmul(a, b):
    file1 = open("Wallace_tb.v", "w")  # creating the tb file
    file1.write('''  module wallace16;
    reg[15:0] a;
    reg[15:0]  b;
    wire[31:0]  y;
    wallace  inst(
        .a(a),
    .b(b),
    .y(y)
    );
    initial begin
    a = ''' + a + ''';  
	b = ''' + b + ''';
    end

    initial
    begin
    $monitor("%d", y);
    end
    endmodule''')
    file1.close()  # close the tb file
    # make sure cla_adder1.v and Sample.py are in the same folder as this python script
    os.system(" iverilog Wallace.v Wallace_tb.v ")  # executing this command gives us the executable "cla"
    os.system("vvp a.out>result.txt")  # direct the output to "result.txt" file

    file = open("result.txt", "r+")  # open "result.txt" file
    out = file.read()
    file.truncate(0)  # print the contents of the file(output)
    file.close()  # close the file "result.txt"
    return out

def fpm(a,b):
    if float(a) < 0:
        s1 = str(1)
    else:
        s1 = str(0)
    if float(b) < 0:
        s2 = str(1)
    else:
        s2 = str(0)
    c, d = str(a).split(sep='.')
    i1 = str(c)
    f1 = str(d)
    f1 = "0." + f1
    e, f = str(b).split(sep='.')
    i2 = str(e)
    f2 = str(f)
    f2 = "0." + f2
    file1 = open("fpm_tb.v", "w")  # creating the tb file
    file1.write('''
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
    sign1 = ''' + s1 + ''';     
	int1 = ''' + i1 + '''; 
	float1 = ''' + f1 + ''';       
    sign2 = ''' + s2 + ''';     
	int2 = ''' + i2 + ''';     
	float2 = ''' + f2 + ''';  
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

    

    ''')
    file1.close()  # close the tb file
    # make sure cla_adder1.v and Sample.py are in the same folder as this python script
    os.system(" iverilog fpm.v fpm_tb.v ")  # executing this command gives us the executable "cla"
    os.system("vvp a.out>result.txt")  # direct the output to "result.txt" file

    file = open("result.txt", "r+")  # open "result.txt" file
    out = file.read()
    file.truncate(0)  # print the contents of the file(output)
    file.close()  # close the file "result.txt"
    return out


#print(fpm(str(10.34),str(12.6)))