`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2019 07:48:02 PM
// Design Name: 
// Module Name: MuxFourWay
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


module MuxFourWay(
    input [1:0] fwda,
    input [31:0] qa,
    input [31:0] ealu,
    input [31:0] malu,
    input [31:0] datamem_do,
    output wire [31:0] forwarded_a
    );
    
    assign forwarded_a = fwda[1] ? (fwda[0] ? datamem_do : malu) : (fwda[0] ? ealu : qa);     
    
    
endmodule
