`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:19:28 PM
// Design Name: 
// Module Name: MEM_WB
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

module MEM_WB(
    input clk,
    input mwreg,
    input mm2reg,
    input [4:0] mux1_in,
    input [31:0] ALU_in,
    input [31:0] datamem_in,
    output reg wwreg,
    output reg wm2reg,
    output reg [4:0] mux1_out,
    output reg [31:0] ALU_out,
    output reg [31:0] datamem_out
    );
    
    always @(negedge clk)
    begin
        wwreg = mwreg;
        wm2reg = mm2reg;
        mux1_out = mux1_in;
        ALU_out = ALU_in;
        datamem_out = datamem_in;
    
    end
endmodule

