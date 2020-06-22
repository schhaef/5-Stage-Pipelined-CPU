`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:12:50 PM
// Design Name: 
// Module Name: sign_ext
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

// Sign extend leading bit
module sign_ext(do, out);
    input [31:0] do;
    output reg [31:0] out;
    wire [15:0] in;
    assign in = do[15:0];
    
    
    always @ (*)
    begin
        out[15:0] <= in;
        if (in[15] == 1)
           out[31:16] <= 16'b1111111111111111;
        else
           out[31:16] <= 16'b0000000000000000;
    end
    
endmodule
