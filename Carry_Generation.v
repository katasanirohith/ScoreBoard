`include "Generator.v"

module Carry_Generation(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,
                        o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,o32);

input [1:0] c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;
output [1:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,o32;
wire [1:0] r11,r12,r13,r14,r15,r16,r17,r18,r19,r110,r111,r112,r113,r114,r115,r116,r117,r118,r119,r120,r121,r122,r123,r124,r125,r126,r127,r128,r129,r130,r131,
           r21,r22,r23,r24,r25,r26,r27,r28,r29,r210,r211,r212,r213,r214,r215,r216,r217,r218,r219,r220,r221,r222,r223,r224,r225,r226,r227,r228,r229,r230,
		   r31,r32,r33,r34,r35,r36,r37,r38,r39,r310,r311,r312,r313,r314,r315,r316,r317,r318,r319,r320,r321,r322,r323,r324,r325,r326,r327,r328,
		   r41,r42,r43,r44,r45,r46,r47,r48,r49,r410,r411,r412,r413,r414,r415,r416,r417,r418,r419,r420,r421,r422,r423,r424,
		   r51,r52,r53,r54,r55,r56,r57,r58,r59,r510,r511,r512,r513,r514,r515,r516
		   ;

//level 1
Generator obj11( c2,c1,r11 );
Generator obj12( c3,c2,r12 );
Generator obj13( c4,c3,r13 );
Generator obj14( c5,c4,r14 );
Generator obj15( c6,c5,r15 );
Generator obj16( c7,c6,r16 );
Generator obj17( c8,c7,r17 );
Generator obj18( c9,c8,r18 );
Generator obj19( c10,c9,r19 );
Generator obj110( c11,c10,r110 );
Generator obj111( c12,c11,r111 );
Generator obj112( c13,c12,r112 );
Generator obj113( c14,c13,r113 );
Generator obj114( c15,c14,r114 );
Generator obj115( c16,c15,r115 );
Generator obj116( c17,c16,r116 );
Generator obj117( c18,c17,r117 );
Generator obj118( c19,c18,r118 ); 
Generator obj119( c20,c19,r119 );
Generator obj120( c21,c20,r120 );
Generator obj121( c22,c21,r121 );
Generator obj122( c23,c22,r122 );
Generator obj123( c24,c23,r123 );
Generator obj124( c25,c24,r124 );
Generator obj125( c26,c25,r125 );
Generator obj126( c27,c26,r126 );
Generator obj127( c28,c27,r127 );
Generator obj128( c29,c28,r128 );
Generator obj129( c30,c29,r129 );
Generator obj130( c31,c30,r130 );
Generator obj131( c32,c31,r131 );

//Level 2
Generator obj21(r13,r11,r21);
Generator obj22( r14,r12,r22);
Generator obj23( r15,r13,r23);
Generator obj24( r16,r14,r24);
Generator obj25( r17,r15,r25);
Generator obj26( r18,r16,r26); 
Generator obj27(r19,r17,r27);
Generator obj28( r110,r18,r28);
Generator obj29( r111,r19,r29);
Generator obj210( r112,r110,r210);
Generator obj211( r113,r111,r211);
Generator obj212( r114,r112,r212); 
Generator obj213( r115,r113,r213);
Generator obj214( r116,r114,r214);
Generator obj215( r117,r115,r215);
Generator obj216( r118,r116,r216);
Generator obj217( r119,r117,r217);
Generator obj218( r120,r118,r218);
Generator obj219( r121,r119,r219);
Generator obj220( r122,r120,r220);
Generator obj221( r123,r121,r221);
Generator obj222( r124,r122,r222);
Generator obj223( r125,r123,r223); 
Generator obj224( r126,r124,r224);
Generator obj225( r127,r125,r225);
Generator obj226( r128,r126,r226);
Generator obj227( r129,r127,r227); 
Generator obj228( r130,r128,r228);
Generator obj229( r131,r129,r229);
Generator obj230( c32,r130,r230); 
 
//Level 3
Generator obj31(r25,r21,r31);
Generator obj32( r26,r22,r32);
Generator obj33( r27,r23,r33);
Generator obj34( r28,r24,r34);
Generator obj35( r29,r25,r35);
Generator obj36( r210,r26,r36); 
Generator obj37(r211,r27,r37);
Generator obj38( r212,r28,r38);
Generator obj39( r213,r29,r39);
Generator obj310( r214,r210,r310);
Generator obj311( r215,r211,r311);
Generator obj312( r216,r212,r312);
Generator obj313( r217,r213,r313);
Generator obj314( r218,r214,r314);
Generator obj315( r219,r215,r315);
Generator obj316( r220,r216,r316);
Generator obj317( r221,r217,r317);
Generator obj318( r222,r218,r318);
Generator obj319( r223,r219,r319);
Generator obj320( r224,r220,r320);
Generator obj321( r225,r221,r321);
Generator obj322( r226,r222,r322);
Generator obj323( r227,r223,r323); 
Generator obj324( r228,r224,r324);
Generator obj325( r229,r225,r325);
Generator obj326( r230,r226,r326);
Generator obj327( r131,r227,r327);
Generator obj328( c32,r228,r328);


//Level 4 
Generator obj41(r39,r31,r41);
Generator obj42( r310,r32,r42);
Generator obj43( r311,r33,r43);
Generator obj44( r312,r34,r44);
Generator obj45( r313,r35,r45);
Generator obj46( r314,r36,r46); 
Generator obj47(r315,r37,r47);
Generator obj48( r316,r38,r48);
Generator obj49(r317,r39,r49);
Generator obj410( r318,r310,r410);
Generator obj411( r319,r311,r411);
Generator obj412( r320,r312,r412);
Generator obj413( r321,r313,r413);
Generator obj414( r322,r314,r414); 
Generator obj415(r323,r315,r415);
Generator obj416( r324,r316,r416);
Generator obj417(r325,r317,r417);
Generator obj418( r326,r318,r418);
Generator obj419( r327,r319,r419);
Generator obj420( r328,r320,r420);
Generator obj421( r229,r321,r421);
Generator obj422( r230,r322,r422); 
Generator obj423(r131,r323,r423);
Generator obj424( c32,r324,r424);

//Level 5
Generator obj51(r417,r41,r51);
Generator obj52( r418,r42,r52);
Generator obj53( r419,r43,r53);
Generator obj54( r420,r44,r54);
Generator obj55( r421,r45,r55);
Generator obj56( r422,r46,r56); 
Generator obj57(r423,r47,r57);
Generator obj58( r424,r48,r58);
Generator obj59(r325,r49,r59);
Generator obj510( r326,r410,r510);
Generator obj511( r327,r411,r511);
Generator obj512( r328,r412,r512);
Generator obj513( r229,r413,r513);
Generator obj514( r230,r414,r514); 
Generator obj515(r131,r415,r515);
Generator obj516( c32,r416,r516);

assign o1 = r51[0] | r51[1]; 
assign o2 = r52[0] | r52[1]; 
assign o3 = r53[0] | r53[1];
assign o4 = r54[0] | r54[1];
assign o5 = r55[0] | r55[1]; 
assign o6 = r56[0] | r56[1];
assign o7 = r57[0] | r57[1];
assign o8 = r58[0] | r58[1];
assign o9 = r59[0] | r59[1]; 
assign o10 = r510[0] | r510[1]; 
assign o11 = r511[0] | r511[1];
assign o12 = r512[0] | r512[1];
assign o13 = r513[0] | r513[1]; 
assign o14 = r514[0] | r514[1];
assign o15 = r515[0] | r515[1];
assign o16 = r516[0] | r516[1];
assign o17 = r417[0] | r417[1]; 
assign o18 = r418[0] | r418[1]; 
assign o19 = r419[0] | r419[1];
assign o20 = r420[0] | r420[1];
assign o21 = r421[0] | r421[1]; 
assign o22 = r422[0] | r422[1];
assign o23 = r423[0] | r423[1];
assign o24 = r424[0] | r424[1];
assign o25 = r325[0] | r325[1]; 
assign o26 = r326[0] | r326[1]; 
assign o27 = r327[0] | r327[1];
assign o28 = r328[0] | r328[1];
assign o29 = r229[0] | r229[1]; 
assign o30 = r230[0] | r230[1];
assign o31 = r131[0] | r131[1];
assign o32 = c32[0] | c32[1];

 
endmodule