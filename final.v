`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:15:45 06/26/2024 
// Design Name: 
// Module Name:    final 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//Controller module
module convolution(A,B,X,Y,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,clock,ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13);
input clock,ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13;
input [63:0]X;
input [63:0]Y;
output[63:0]A;//Loaded sample
output[63:0]B;//Loaded sample
output [18:0] C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15;//Convoluted output
wire [7:0] A0,A1,A2,A3,A4,A5,A6,A7;
wire [7:0] B0,B1,B2,B3,B4,B5,B6,B7;
wire [15:0]Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,
Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42,Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63,Z64;
assign A0=A[7:0];
assign A1=A[15:8];
assign A2=A[23:16];
assign A3=A[31:24];
assign A4=A[39:32];
assign A5=A[47:40];
assign A6=A[55:48];
assign A7=A[63:56];

assign B0=B[7:0];
assign B1=B[15:8];
assign B2=B[23:16];
assign B3=B[31:24];
assign B4=B[39:32];
assign B5=B[47:40];
assign B6=B[55:48];
assign B7=B[63:56];
//Call modules to load samples
LOAD S1 (A,X,clock,ldS1);
LOAD S2 (B,Y,clock,ldS2);

//Call Booth multiplier module and adder module to produce desired convoluted output
MULOUT1 M1(Z1,A7,B7,clock,sel1);
CONOUT1 CON1(C1,Z1);
MULOUT2 M2(Z2,Z3,A7,A6,B7,B6,clock,sel2);
CONOUT2 C0N2(C2,Z2,Z3,add1);
MULOUT3 M3(Z4,Z5,Z6,A7,A6,A5,B7,B6,B5,clock,sel3);
CONOUT3 CON3(C3,Z4,Z5,Z6,add2);
MULOUT4 M4(Z7,Z8,Z9,Z10,A7,A6,A5,A4,B7,B6,B5,B4,clock,sel4);
CONOUT4 CON4(C4,Z7,Z8,Z9,Z10,add3);
MULOUT5 M5(Z11,Z12,Z13,Z14,Z15,A7,A6,A5,A4,A3,B7,B6,B5,B4,B3,clock,sel5);
CONOUT5 CON5(C5,Z11,Z12,Z13,Z14,Z15,add4);
MULOUT6 M6(Z16,Z17,Z18,Z19,Z20,Z21,A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2,clock,sel6);
CONOUT6 CON6(C6,Z16,Z17,Z18,Z19,Z20,Z21,add5);
MULOUT7 M7(Z22,Z23,Z24,Z25,Z26,Z27,Z28,A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1,clock,sel7);
CONOUT7 CON7(C7,Z22,Z23,Z24,Z25,Z26,Z27,Z28,add6);
MULOUT8 M8(Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0,clock,sel8);
CONOUT8 CON8(C8,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,add7);
MULOUT9 M9(Z37,Z38,Z39,Z40,Z41,Z42,Z43,A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0,clock,sel9);
CONOUT9 CON9(C9,Z37,Z38,Z39,Z40,Z41,Z42,Z43,add8);
MULOUT10 M10(Z44,Z45,Z46,Z47,Z48,Z49,A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0,clock,sel10);
CONOUT10 CON10(C10,Z44,Z45,Z46,Z47,Z48,Z49,add9);
MULOUT11 M11(Z50,Z51,Z52,Z53,Z54,A4,A3,A2,A1,A0,B4,B3,B2,B1,B0,clock,sel11);
CONOUT11 CON11(C11,Z50,Z51,Z52,Z53,Z54,add10);
MULOUT12 M12(Z55,Z56,Z57,Z58,A3,A2,A1,A0,B3,B2,B1,B0,clock,sel12);
CONOUT12 CON12(C12,Z55,Z56,Z57,Z58,add11);
MULOUT13 M13(Z59,Z60,Z61,A2,A1,A0,B2,B1,B0,clock,sel13);
CONOUT13 CON13(C13,Z59,Z60,Z61,add12);
MULOUT14 M14(Z62,Z63,A1,A0,B1,B0,clock,sel14);
CONOUT14 CON14(C14,Z62,Z63,add13);
MULOUT15 M15(Z64,A0,B0,clock,sel15);
CONOUT15 CON15(C15,Z64);
endmodule
//Load data
module LOAD(data_out,data_in,clock,load);
input clock,load;
input [63:0]data_in;
output reg [63:0]data_out;

reg [2:0] counter; // Counter to control indexing
always @(posedge clock) begin
if(load)
begin
if (counter == 0) begin
data_out[7:0] <= data_in[7:0]; // Load first sample
end 
else begin
data_out[counter*8 +: 8] <= data_in[counter*8 +: 8]; // Load subsequent samples
end
if (counter < 7) begin
counter <= counter + 1; // Increment counter for next sample
end 
else begin
counter <= 0; // Reset counter after loading all samples
end
end
end
endmodule

module MULOUT1 (Z1,A7,B7,clock,sel1);
input clock,sel1;
input [7:0]A7,B7;
output signed [15:0]Z1;
BoothMulti multiply1(Z1,A7,B7,clock,sel1);
endmodule

module CONOUT1(C1,Z1);
input [15:0]Z1;
output signed [18:0]C1;
assign C1=Z1;
endmodule

module MULOUT2 (Z2,Z3,A7,A6,B7,B6,clock,sel2);
input clock,sel2;
input [7:0]A7,A6,B7,B6;
output signed [15:0]Z2,Z3;
BoothMulti multiply2(Z2,A7,B6,clock,sel2);
BoothMulti multiply3(Z3,A6,B7,clock,sel2);
endmodule

module CONOUT2(C2,Z2,Z3,add);
input add;
input [15:0]Z2,Z3;
output signed [18:0]C2;
assign C2 = (add) ? (Z2 + Z3) : 16'hxxxx;
endmodule

module MULOUT3 (Z4,Z5,Z6,A7,A6,A5,B7,B6,B5,clock,sel3);
input clock,sel3;
input [7:0]A7,A6,A5,B7,B6,B5;
output signed [15:0]Z4,Z5,Z6;
BoothMulti multiply4(Z4,A7,B5,clock,sel3);
BoothMulti multiply5(Z5,A6,B6,clock,sel3);
BoothMulti multiply6(Z6,A5,B7,clock,sel3);
endmodule

module CONOUT3(C3,Z4,Z5,Z6,add);
input add;
input [15:0]Z4,Z5,Z6;
output  signed [18:0]C3;
assign C3 = (add) ? (Z4+Z5+Z6) : 16'hxxxx;
endmodule

module MULOUT4(Z7,Z8,Z9,Z10,A7,A6,A5,A4,B7,B6,B5,B4,clock,sel4);
input clock,sel4;
input [7:0]A7,A6,A5,A4,B7,B6,B5,B4;
output signed [15:0]Z7,Z8,Z9,Z10;
BoothMulti multiply7(Z7,A7,B4,clock,sel4);
BoothMulti multiply8(Z8,A6,B5,clock,sel4);
BoothMulti multiply9(Z9,A5,B6,clock,sel4);
BoothMulti multiply10(Z10,A4,B7,clock,sel4);
endmodule

module CONOUT4(C4,Z7,Z8,Z9,Z10,add);
input add;
input [15:0]Z7,Z8,Z9,Z10;
output  signed [18:0]C4;
assign C4 = (add) ? (Z7+Z8+Z9+Z10) : 16'hxxxx;
endmodule

module MULOUT5(Z11,Z12,Z13,Z14,Z15,A7,A6,A5,A4,A3,B7,B6,B5,B4,B3,clock,sel5);
input clock,sel5;
input [7:0]A7,A6,A5,A4,A3,B7,B6,B5,B4,B3;
output signed [15:0]Z11,Z12,Z13,Z14,Z15;
BoothMulti multiply11(Z11,A7,B3,clock,sel5);
BoothMulti multiply12(Z12,A6,B4,clock,sel5);
BoothMulti multiply13(Z13,A5,B5,clock,sel5);
BoothMulti multiply14(Z14,A4,B6,clock,sel5);
BoothMulti multiply15(Z15,A3,B7,clock,sel5);
endmodule

module CONOUT5(C5,Z11,Z12,Z13,Z14,Z15,add);
input add;
input [15:0]Z11,Z12,Z13,Z14,Z15;
output  signed [18:0]C5;
assign C5 = (add) ? (Z11+Z12+Z13+Z14+Z15) : 16'hxxxx;
endmodule

module MULOUT6(Z16,Z17,Z18,Z19,Z20,Z21,A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2,clock,sel6);
input clock,sel6;
input [7:0]A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2;
output signed [15:0]Z16,Z17,Z18,Z19,Z20,Z21;
BoothMulti multiply16(Z16,A7,B2,clock,sel6);
BoothMulti multiply17(Z17,A6,B3,clock,sel6);
BoothMulti multiply18(Z18,A5,B4,clock,sel6);
BoothMulti multiply19(Z19,A4,B5,clock,sel6);
BoothMulti multiply20(Z20,A3,B6,clock,sel6);
BoothMulti multiply21(Z21,A2,B7,clock,sel6);
endmodule

module CONOUT6(C6,Z16,Z17,Z18,Z19,Z20,Z21,add);
input add;
input [15:0]Z16,Z17,Z18,Z19,Z20,Z21;
output  signed [18:0]C6;
assign C6= (add) ? (Z16+Z17+Z18+Z19+Z20+Z21) : 16'hxxxx;
endmodule

module MULOUT7(Z22,Z23,Z24,Z25,Z26,Z27,Z28,A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1,clock,sel7);
input clock,sel7;
input [7:0]A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1;
output signed [15:0]Z22,Z23,Z24,Z25,Z26,Z27,Z28;
BoothMulti multiply22(Z22,A7,B1,clock,sel7);
BoothMulti multiply23(Z23,A6,B2,clock,sel7);
BoothMulti multiply24(Z24,A5,B3,clock,sel7);
BoothMulti multiply25(Z25,A4,B4,clock,sel7);
BoothMulti multiply26(Z26,A3,B5,clock,sel7);
BoothMulti multiply27(Z27,A2,B6,clock,sel7);
BoothMulti multiply28(Z28,A1,B7,clock,sel7);
endmodule

module CONOUT7(C7,Z22,Z23,Z24,Z25,Z26,Z27,Z28,add);
input add;
input [15:0]Z22,Z23,Z24,Z25,Z26,Z27,Z28;
output  signed [18:0]C7;
assign C7= (add) ? (Z22+Z23+Z24+Z25+Z26+Z27+Z28) : 16'hxxxx;
endmodule

module MULOUT8(Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0,clock,sel8);
input clock,sel8;
input [7:0]A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36;
BoothMulti multiply29(Z29,A7,B0,clock,sel8);
BoothMulti multiply30(Z30,A6,B1,clock,sel8);
BoothMulti multiply31(Z31,A5,B2,clock,sel8);
BoothMulti multiply32(Z32,A4,B3,clock,sel8);
BoothMulti multiply33(Z33,A3,B4,clock,sel8);
BoothMulti multiply34(Z34,A2,B5,clock,sel8);
BoothMulti multiply35(Z35,A1,B6,clock,sel8);
BoothMulti multiply36(Z36,A0,B7,clock,sel8);
endmodule

module CONOUT8(C8,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,add);
input add;
input [15:0]Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36;
output  signed [18:0]C8;
assign C8= (add) ? (Z29+Z30+Z31+Z32+Z33+Z34+Z35+Z36) : 16'hxxxx;
endmodule

module MULOUT9(Z37,Z38,Z39,Z40,Z41,Z42,Z43,A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0,clock,sel9);
input clock,sel9;
input [7:0]A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z37,Z38,Z39,Z40,Z41,Z42,Z43;
BoothMulti multiply37(Z37,A6,B0,clock,sel9);
BoothMulti multiply38(Z38,A5,B1,clock,sel9);
BoothMulti multiply39(Z39,A4,B2,clock,sel9);
BoothMulti multiply40(Z40,A3,B3,clock,sel9);
BoothMulti multiply41(Z41,A2,B4,clock,sel9);
BoothMulti multiply42(Z42,A1,B5,clock,sel9);
BoothMulti multiply43(Z43,A0,B6,clock,sel9);
endmodule

module CONOUT9(C9,Z37,Z38,Z39,Z40,Z41,Z42,Z43,add);
input add;
input [15:0]Z37,Z38,Z39,Z40,Z41,Z42,Z43;
output  signed [18:0]C9;
assign C9= (add) ? (Z37+Z38+Z39+Z40+Z41+Z42+Z43) : 16'hxxxx;
endmodule

module MULOUT10(Z44,Z45,Z46,Z47,Z48,Z49,A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0,clock,sel10);
input clock,sel10;
input [7:0]A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z44,Z45,Z46,Z47,Z48,Z49;
BoothMulti multiply44(Z44,A5,B0,clock,sel10);
BoothMulti multiply45(Z45,A4,B1,clock,sel10);
BoothMulti multiply46(Z46,A3,B2,clock,sel10);
BoothMulti multiply47(Z47,A2,B3,clock,sel10);
BoothMulti multiply48(Z48,A1,B4,clock,sel10);
BoothMulti multiply49(Z49,A0,B5,clock,sel10);
endmodule

module CONOUT10(C10,Z44,Z45,Z46,Z47,Z48,Z49,add);
input add;
input [15:0]Z44,Z45,Z46,Z47,Z48,Z49;
output  signed [18:0]C10;
assign C10= (add) ? (Z44+Z45+Z46+Z47+Z48+Z49) : 16'hxxxx;
endmodule

module MULOUT11(Z50,Z51,Z52,Z53,Z54,A4,A3,A2,A1,A0,B4,B3,B2,B1,B0,clock,sel11);
input clock,sel11;
input [7:0]A4,A3,A2,A1,A0,B4,B3,B2,B1,B0;
output signed [15:0]Z50,Z51,Z52,Z53,Z54;
BoothMulti multiply50(Z50,A4,B0,clock,sel11);
BoothMulti multiply51(Z51,A3,B1,clock,sel11);
BoothMulti multiply52(Z52,A2,B2,clock,sel11);
BoothMulti multiply53(Z53,A1,B3,clock,sel11);
BoothMulti multiply54(Z54,A0,B4,clock,sel11);
endmodule

module CONOUT11(C11,Z50,Z51,Z52,Z53,Z54,add);
input add;
input [15:0]Z50,Z51,Z52,Z53,Z54;
output  signed [18:0]C11;
assign C11 = (add) ? (Z50+Z51+Z52+Z53+Z54) : 16'hxxxx;
endmodule

module MULOUT12(Z55,Z56,Z57,Z58,A3,A2,A1,A0,B3,B2,B1,B0,clock,sel12);
input clock,sel12;
input [7:0]A3,A2,A1,A0,B3,B2,B1,B0;
output signed [15:0]Z55,Z56,Z57,Z58;
BoothMulti multiply55(Z55,A3,B0,clock,sel12);
BoothMulti multiply56(Z56,A2,B1,clock,sel12);
BoothMulti multiply57(Z57,A1,B2,clock,sel12);
BoothMulti multiply58(Z58,A0,B3,clock,sel12);
endmodule

module CONOUT12(C12,Z55,Z56,Z57,Z58,add);
input add;
input [15:0]Z55,Z56,Z57,Z58;
output  signed [18:0]C12;
assign C12 = (add) ? (Z55+Z56+Z57+Z58) : 16'hxxxx;
endmodule

module MULOUT13 (Z59,Z60,Z61,A2,A1,A0,B2,B1,B0,clock,sel13);
input clock,sel13;
input [7:0]A2,A1,A0,B2,B1,B0;
output signed [15:0]Z59,Z60,Z61;
BoothMulti multiply59(Z59,A2,B0,clock,sel13);
BoothMulti multiply60(Z60,A1,B1,clock,sel13);
BoothMulti multiply61(Z61,A0,B2,clock,sel13);
endmodule

module CONOUT13(C13,Z59,Z60,Z61,add);
input add;
input [15:0]Z59,Z60,Z61;
output  signed [18:0]C13;
assign C13 = (add) ? (Z59+Z60+Z61) : 16'hxxxx;
endmodule

module MULOUT14 (Z62,Z63,A1,A0,B1,B0,clock,sel14);
input clock,sel14;
input [7:0]A1,A0,B1,B0;
output signed [15:0]Z62,Z63;
BoothMulti multiply62(Z62,A1,B0,clock,sel14);
BoothMulti multiply63(Z63,A0,B1,clock,sel14);
endmodule

module CONOUT14(C14,Z62,Z63,add);
input add;
input [15:0]Z62,Z63;
output signed [18:0]C14;
assign C14 = (add) ? (Z62 + Z63) : 16'hxxxx;
endmodule

module MULOUT15(Z64,A0,B0,clock,sel15);
input clock,sel15;
input [7:0]A0,B0;
output signed [15:0]Z64;
BoothMulti multiply1(Z64,A0,B0,clock,sel15);
endmodule

module CONOUT15(C15,Z64);
input [15:0]Z64;
output signed [18:0]C15;
assign C15=Z64;
endmodule

//Booth multiplier module
module BoothMulti(Z,X, Y,clock,sel);
       input signed [7:0] X, Y;//X-Multiplier,Y-Multiplicand
       output signed [15:0] Z;
       reg signed [15:0] Z;
		 input clock,sel;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [7:0] Y1;
		 always @ (posedge clock)
		 
		 begin
		 if(sel)
		 begin
       Z = 16'd0;
		 Z={8'd0,X[7:0]};
       E1 = 1'd0;
       for (i = 0; i < 8; i = i + 1)
       begin
       temp = {Z[0], E1};
       Y1 = - Y;
		 case (temp)
       2'd2 : Z [15 : 0] ={ Z [15 : 8] + Y1,Z[7:0]};
       2'd1 : Z [15 : 0] = {Z [15 : 8] + Y,Z[7:0]};
       default : Z[15:0]={Z[15:8],Z[7:0]};
       endcase
		  E1 = Z[0];

       Z = Z >>> 1;//Arithmetic shift
       end
		 end
		 end
      
       
endmodule
//Controller
module controller(ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,done,clock,start);
input clock,start;
output reg ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,done;
reg[4:0]state;
parameter S0=5'b00000,S1=5'b00001,S2=5'b00010,S3=5'b00011,S4=5'b00100,S5=5'b00101,S6=5'b00110,S7=5'b00111,S8=5'b01000,
S9=5'b01001,S10=5'b01010,S11=5'b01011,S12=5'b01100,S13=5'b01101,S14=5'b01110,S15=5'b01111,S16=5'b10000;
always @(posedge clock)
begin
case(state)
S0: if(start)state<=S1;
S1: state<=S2;
S2: state<=S3;
S3: state<=S4;
S4: state<=S5;
S5: state<=S6;
S6: state<=S7;
S7: state<=S8;
S8: state<=S9;
S9: state<=S10;
S10: state<=S11;
S11: state<=S12;
S12: state<=S13;
S13: state<=S14;
S14: state<=S15;
S15: state<=S16;
S16: state<=S16;


default:state<=S0;
endcase
end

always@(state)
begin
case(state)
S0:begin ldS1=0;ldS2=0;sel1=0;sel2=0;done=0;end
S1:begin ldS1=1;ldS2=1;sel1=0;sel2=0;done=0;end
S2:begin sel1=1;done=0;end
S3:begin sel2=1;#1 add1=1;done=0;end
S4:begin sel3=1;#1 add2=1;done=0;end
S5:begin sel4=1;#1 add3=1;done=0;end
S6:begin sel5=1;#1 add4=1;done=0;end
S7:begin sel6=1;#1 add5=1;done=0;end
S8:begin sel7=1;#1 add6=1;done=0;end
S9:begin sel8=1;#1 add7=1;done=0;end
S10:begin sel9=1;#1 add8=1;done=0;end
S11:begin sel10=1;#1 add9=1;done=0;end
S12:begin sel11=1;#1 add10=1;done=0;end
S13:begin sel12=1;#1 add11=1;done=0;end
S14:begin sel13=1;#1 add12=1;done=0;end
S15:begin sel14=1;#1 add13=1;done=0;end
S16:begin sel15=1;done=1;end
default:begin ldS1=0;ldS2=0;done=0;end
endcase
end
endmodule

//Test bench
module tb;
 // Inputs
  reg [63:0]X ;
  reg [63:0]Y;
  reg clock,start;

  // Outputs
  wire [63:0]A ;
  wire [63:0]B;
  wire [18:0]C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15;
  wire done;
convolution LD(A,B,X,Y,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,clock,ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13);
controller CON(ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,done,clock,start);

always 
#5 clock = ~clock;
initial begin
    // Initialize Inputs
	 #3 start=1'b1;
    X = {8'd11,8'd15,8'd22,8'd30,8'd45,8'd75,8'd42,8'd80};
    Y = {8'd12,8'd17,8'd25,8'd35,8'd55,8'd85,8'd45,8'd90};
    clock = 1'b0;
	 #10000 $finish;
	 end
initial 
//$monitor($time,"When X[63:56]=%d A[63:56]=%d,Y[63:56]=%d,B[63:56]=%d,Z1=%d,Z2=%d,Z3=%d,Z=%d,done=%b",X[63:56],A[63:56],Y[63:56],B[63:56],Z1,Z2,Z3,Z,done);
$monitor($time,"C1=%d,C2=%d,C3=%d,C4=%d,C5=%d,C6=%d,C7=%d,C8=%d,C9=%d,C10=%d,C11=%d,C12=%d,C13=%d,C14=%d,C15=%d,done=%d",C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,done);
endmodule
