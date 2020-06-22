`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:07:50 PM
// Design Name: 
// Module Name: PC_register
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

//PC register for pipelining
module PC_register(input clk, input [31:0] pc_in, output reg [31:0] pc_out
);

    always @(negedge clk)
    begin
        pc_out = pc_in;
    end

endmodule

