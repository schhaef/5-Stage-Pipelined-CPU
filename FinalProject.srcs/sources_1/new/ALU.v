`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:17:39 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [31:0] qa_in,
    input [3:0] ealuc,
    input [31:0] mux2in,
    output reg [31:0] ALU_out
    );
    
        always @(*)
    begin

        if (ealuc == 4'b10)    // add
            ALU_out = qa_in + mux2in;
        else if (ealuc == 4'b0110)    // subtract
            ALU_out = qa_in - mux2in;
        else if (ealuc == 4'b0000)    // AND
            ALU_out = qa_in & mux2in;
        else if (ealuc == 4'b0001)    // OR
            ALU_out = qa_in | mux2in;
        else if (ealuc == 4'b1101)    // XOR
            ALU_out = qa_in ^ mux2in;
        else
            ALU_out = mux2in;
    end

endmodule

