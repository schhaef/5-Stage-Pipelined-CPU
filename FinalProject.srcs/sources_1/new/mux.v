`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:11:27 PM
// Design Name: 
// Module Name: mux
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

module mux(do, regrt, out);
    input [31:0] do;      // 32 bit inst
    input regrt;          // from control unit
    output wire [4:0] out; // output rt or rd

    

    
    assign out = regrt ? do[20:16] : do[15:11];

endmodule

