`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:10:22 PM
// Design Name: 
// Module Name: IF_ID
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

//IF/ID register for pipelining
module IF_ID(
    input clk,
    input [31:0] do_in,
    output reg [31:0] do_out
    );
    
    always @(negedge clk)
    begin
        do_out = do_in;
    end
    
endmodule

