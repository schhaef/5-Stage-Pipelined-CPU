`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:49:22 PM
// Design Name: 
// Module Name: test_clk
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


module test_clk(
        output reg clk
    );
    initial begin
        clk = 0;
    end

    always
        #5 clk = !clk; // invert clock
endmodule
