`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:18:15 PM
// Design Name: 
// Module Name: EXE_MEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module EXE_MEM(
    input clk,
    input ewreg,
    input em2reg,
    input ewmem,
    input [4:0] mux1_in,
    input [31:0] ALU_in,
    input [31:0] qb_in,
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg [4:0] mux1_out,
    output reg [31:0] ALU_out,
    output reg [31:0] qb_out
    );
    
    always @(negedge clk)
    begin
         mwreg = ewreg;
         mm2reg = em2reg;
         mwmem = ewmem;
         mux1_out = mux1_in;
         ALU_out = ALU_in;
         qb_out = qb_in;
    end
endmodule

