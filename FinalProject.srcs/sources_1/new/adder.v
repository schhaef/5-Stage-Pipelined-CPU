`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:08:57 PM
// Design Name: 
// Module Name: adder
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

// Increment pc by 4, fetch next instruction
module adder(a, pc);
    input [31:0] a; // old program counter
    output reg [31:0] pc; // new program counter
    
    initial begin
        pc = 100;
    end
    
    // increment pc by 4 to get next instruction
    always @(a)
    begin
        pc = a + 4;
    end
    
endmodule

