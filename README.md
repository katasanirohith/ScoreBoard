# ScoreBoard 
    Clone the entire repository and execute verilogitegration.py. This code calls the verilog codes internally. 
 
 The scoreboard is a method used to schedule a pipeline dynamically so that the
instructions can be executed out of order without any conflicts. We try to avoid the data
dependencies in data while scheduling the instruction. Instructions are processed in five
stages.

# Overview
  <b>1. Issue :</b> We check whether we have the functional unit is free or not. We check WAWWrite after write dependency at this level. <br/>
&nbsp;&nbsp; &nbsp;Structural hazard - Lack of Functional Units: <br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ADD R0,R1,R2 <br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ADD R3,R4,R5 <br/>
&nbsp;&nbsp; &nbsp;Write after write Hazards- <br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ADD R1,R2,R3 <br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;MULT R1,R2,R3 <br/>
<b>2. Read:</b> In this level, we check whether we can read the CORRECT data or not. I.e. no other instruction above should be writing into the registers which we are using now to read. In this way, we can say that we are reading the data from the registers that have the latest data in it, so there is no dirty read problem. In this phase we avoid RAW- Read After Write hazard.<br/>
&nbsp;&nbsp; &nbsp;Read After Write Hazard-<br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ADD R0,R1,R2<br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  &nbsp;MULT R1,R0,R2<br/>
<b>3. Execute:</b> At this phase, we send the registers that we have read from the previous level to the ALU to complete the opperation in the scoreboad approach we should consider for the parallel execution of all the instructions at exec. There is no type of data hazard checking in this phase. <br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; R0 = R1 + R2<br/>
<b>4. WriteBack:</b> Here we check for any type of WAR- Write after Read dependencies. Which means we should complete the previous instruction's read before writing into the later instruction's write register.<br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ADD R0,R1,R2<br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;MULT R2,R3,R4<br/>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R2 Read in add should be done before R2 in MULT is written<br/>

# Specifications
We run the whole loop of Issue, Read, Exec, WriteBack for a clock cycle. A detailed explanation of how the code works: <br/>
### Issue:
We will issue the instruction only if the instruction is not issued yet. <br/>
&nbsp;&nbsp; &nbsp;● And we check the functional unit status if it is busy then ins is not issued else it is issued. <br/>
&nbsp;&nbsp; &nbsp;● To avoid the WAW we check the functional unit of destination register if it is free then only we will issue the instruction. <br/>
&nbsp;&nbsp; &nbsp;● In order fetching as the fetching should be done in order. If an instruction is not executed due to any of the above-mentioned reasons then we are supposed to wait till it has been fetched.<br/>
&nbsp;&nbsp; &nbsp;● We assign the values yes or no the register here can be fetched or not here itself.<br/>
&nbsp;&nbsp; &nbsp;● And then we lock the destination register.<br/>
&nbsp;&nbsp; &nbsp;● This is done to avoid deadlock.<br/>

### Read:
Check all the instructions and append the instructions that should be in read phase.<br/>
&nbsp;&nbsp; &nbsp;● This is done by the check of a loop through the instructions whose fetch is not none and read is none.  <br/>
&nbsp;&nbsp; &nbsp;● Read is checked by seeing the register status of the source registers if they are free then we can read the registers. <br/>
&nbsp;&nbsp; &nbsp;● There is no in order to read. Whichever instruction can read at a given time then it can take the registers and no instruction should write into the registers that have been kept on hold. <br/>
&nbsp;&nbsp; &nbsp;● In this way we can avoid RAW hazard here. <br/>
### Execute:
We traverse all the instructions again and see if the instruction has completed its read phase then we can start executing the instruction. <br/>
&nbsp;&nbsp; &nbsp;● Parallel execution is allowed as there are different ALUs for different functional units. <br/>
&nbsp;&nbsp; &nbsp;● We maintain a stack of the instructions that are in execute time and consider the time of its executions. If the clock reaches the time (Initial time + execution time) then we write the exec time. <br/>
&nbsp;&nbsp; &nbsp;● After completion the executions we write the value into the table <br/>
### WriteBack:
After completion of execution, we then write back into the destination register. <br/>
&nbsp;&nbsp; &nbsp;● We check for WAR dependency. <br/>
&nbsp;&nbsp; &nbsp;● It is achieved by checking the read status of the register which means if any register is being read then we assign high flag for it and in writer back we check for that flag. <br/>
&nbsp;&nbsp; &nbsp;● If the flag turns out to be high then some instruction is making use of that register so we should no write into that register. <br/>
&nbsp;&nbsp; &nbsp;● And in this phase, we release the whole functional unit. We this the entire object in this phase.<br/>

# Verilog integration:
&nbsp;&nbsp; &nbsp; 1. Import the Verilog file with the line import vfiles as veri <br/>
&nbsp;&nbsp; &nbsp; 2. In the execution phase we call the desired function if it is add then we call CLA, mult then Wallace, fadd then FPA sand if it is fmul then FPM. <br/>
&nbsp;&nbsp; &nbsp; 3. CLA returns a 16-bit binary. So a converter is written to convert into a decimal number. <br/>
&nbsp;&nbsp; &nbsp; 4. FPA and FPM only accept float values. So int value should be converted into the corresponding float . <br/>
&nbsp;&nbsp; &nbsp; 5. In FPA and FPM we separate the values of decimal and integer and convert then into normalized IEEE form. <br/>

## Functional Units Involved:
ADD - Normal adder - Uses CLA <br/>
FADD - Floating point adder - Uses FPA <br/>
MULT - Normal multiplies - Uses Wallace Multiplier <br/>
FMUL- Floating point multiplier - Uses FPM <br/>
 
# Requirements: <br/>
&nbsp;  python>3.0  <br/>
&nbsp; iverilog  <br/>

## Example Containing all the hazards:
add r0,r2,r3 <br/>
fadd r1,r0,r3 <br/>
fadd r7,r8,r9 <br/>
fmul r7,r8,r9 <br/>
add r7,r4,r5 <br/>

## Legend:<br/>
&nbsp;   cla - Carry Look ahed Addrer <br/>
&nbsp;   fpa - Floating Point Adder <br/>
&nbsp;   fpm - Floating Point Multiplier <br/>
&nbsp;   wtm - Wallace Tree Multiplier <br/>
