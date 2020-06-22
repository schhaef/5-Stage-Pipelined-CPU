`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:08:18 PM
// Design Name: 
// Module Name: Instruction_memory
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

//Put instructions in instruction memory, retrieve instruction and output
module Instruction_memory(a, do);
    input [31:0] a;         // input program counter
    output reg [31:0] do;   // output instruction binary
    reg [31:0] IM [0:116];  // 2 dimensional 32x105 array
    
    
    // Put the two instructions we want to read, put in memory
    initial begin
        IM[100] = 32'b00000000001000100001100000100000;
        IM[104] = 32'b00000001001000110010000000100010;
        IM[108] = 32'b00000000011010010010100000100101;
        IM[112] = 32'b00000000011010010011000000100110;
        IM[116] = 32'b00000000011010010011100000100100;
    
        //IM[6'd00] = 32'h34040050; // (00) main: ori $4, $zero, 0x50     no stall $4 = 0x0 | 0x50 = 0x50
        //IM[6'd04] = 32'h8c880000; // (04) lw $8, 0($4)                  no stall $8 = ram[$4] = ram[0x50] = 0xa3
        //IM[6'd08] = 32'h20840004; // (08) addi $4, $4, 4                no stall $4 = $4 + 4 = 0x54
        //IM[6'd12] = 32'h8c890000; // (0c) lw $9, 0($4)                  no stall $9 = ram[$4] = ram[0x54] = 0x27
        //IM[6'd16] = 32'h01094020; // (10) add $8, $8, $9                stall $8 = $8 + $9 = 0xa3 + 0x27 = 0xca
        //IM[6'd20] = 32'h20840004; // (14) addi $4, $4, 4                no stall $4 = $4 + 4 = 0x58
        //IM[6'd24] = 32'hac880000; // (18) sw $8, 0($4)                  no stall ram[$4] = $8 -> ram[0x58] = 0xca
    end
    
    // output the binary instruction at address [a]
    always @(*)
    begin
        do = IM[a];
    end
    
endmodule

