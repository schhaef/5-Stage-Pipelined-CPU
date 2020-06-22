`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:18:54 PM
// Design Name: 
// Module Name: Data_memory
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


module Data_memory(
    input mwmem,         // write enable
    input [31:0] ALU_in, // address / ALU output to data mem
    input [31:0] qb_in,  // data in/ qb from regfile
    output wire [31:0] datamem_out
    );
    
    reg [31:0] Data [0:200]; // 32 * 201 Data RAM


    assign datamem_out = Data[ALU_in[6:2]]; // use 5-bit word address
    
    always @ (mwmem) begin
    if (mwmem) Data[ALU_in[6:2]] = qb_in; // write ram
    end
    
    integer i;
    
    initial begin // ram initialization
    for (i = 0; i < 32; i = i + 1)
    Data[i] = 0;
    
        Data[0] = 32'hA00000AA;
        Data[4] = 32'h10000011;
        Data[8] = 32'h20000022;
        Data[12] = 32'h30000033;
        Data[16] = 32'h40000044;
        Data[20] = 32'h50000055;
        Data[24] = 32'h60000066;
        Data[28] = 32'h70000077;
        Data[32] = 32'h80000088;
        Data[36] = 32'h90000099;

    end
    
    
endmodule




