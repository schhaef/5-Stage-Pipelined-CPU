`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:16:08 PM
// Design Name: 
// Module Name: ID_EXE
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

//ID/EXE register for pipelining
module ID_EXE(
    input clk,
    input wreg,
    input m2reg,
    input wmem,
    input [3:0] aluOp,
    input aluimm, 
    input [4:0] mux_to_id_exe,
    input [31:0] qa,
    input [31:0] qb,
    input [31:0] sign_extend_to_id_exe,
    output reg ewreg,
    output reg em2reg, ewmem,
    output reg [3:0] ealuc,
    output reg ealuimm,
    output reg [4:0] mux_out,
    output reg [31:0] qa_out,
    output reg [31:0] qb_out,
    output reg [31:0] sign_extend_out
    );
    
    // outputs
    always @(negedge clk)
    begin
        ewreg = wreg;
        em2reg = m2reg;
        ewmem = wmem;
        ealuimm = aluimm;
        ealuc = aluOp;
        qa_out = qa;
        qb_out = qb;
        sign_extend_out = sign_extend_to_id_exe;
        mux_out = mux_to_id_exe;
    end
    
    
endmodule
