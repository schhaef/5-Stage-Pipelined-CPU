`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:16:57 PM
// Design Name: 
// Module Name: mux2
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

module mux2(
    input ealuimm,
    input [31:0] qb_in,
    input [31:0] signextendin,
    output reg [31:0] mux2out
    );
    
    always@(*) begin
        assign mux2out = ealuimm ? signextendin : qb_in;
    end
endmodule

