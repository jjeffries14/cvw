///////////////////////////////////////////
//
// Written: James Stine
// Modified: 8/1/2018
//
// Purpose: Bipartite Lookup
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
// is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT 
// OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
///////////////////////////////////////////

module sbtm_a2 (input  logic [7:0] a,
		output logic [13:0] y);
   
   always_comb
     case(a)
       8'b01000000: y = 14'b10110100010111;
       8'b01000001: y = 14'b10110010111111;
       8'b01000010: y = 14'b10110001101000;
       8'b01000011: y = 14'b10110000010011;
       8'b01000100: y = 14'b10101111000001;
       8'b01000101: y = 14'b10101101110000;
       8'b01000110: y = 14'b10101100100001;
       8'b01000111: y = 14'b10101011010011;
       8'b01001000: y = 14'b10101010000111;
       8'b01001001: y = 14'b10101000111101;
       8'b01001010: y = 14'b10100111110100;
       8'b01001011: y = 14'b10100110101101;
       8'b01001100: y = 14'b10100101100111;
       8'b01001101: y = 14'b10100100100010;
       8'b01001110: y = 14'b10100011011111;
       8'b01001111: y = 14'b10100010011101;
       8'b01010000: y = 14'b10100001011100;
       8'b01010001: y = 14'b10100000011100;
       8'b01010010: y = 14'b10011111011110;
       8'b01010011: y = 14'b10011110100001;
       8'b01010100: y = 14'b10011101100100;
       8'b01010101: y = 14'b10011100101001;
       8'b01010110: y = 14'b10011011101111;
       8'b01010111: y = 14'b10011010110110;
       8'b01011000: y = 14'b10011001111110;
       8'b01011001: y = 14'b10011001000110;
       8'b01011010: y = 14'b10011000010000;
       8'b01011011: y = 14'b10010111011011;
       8'b01011100: y = 14'b10010110100110;
       8'b01011101: y = 14'b10010101110011;
       8'b01011110: y = 14'b10010101000000;
       8'b01011111: y = 14'b10010100001110;
       8'b01100000: y = 14'b10010011011100;
       8'b01100001: y = 14'b10010010101100;
       8'b01100010: y = 14'b10010001111100;
       8'b01100011: y = 14'b10010001001101;
       8'b01100100: y = 14'b10010000011111;
       8'b01100101: y = 14'b10001111110001;
       8'b01100110: y = 14'b10001111000100;
       8'b01100111: y = 14'b10001110011000;
       8'b01101000: y = 14'b10001101101100;
       8'b01101001: y = 14'b10001101000001;
       8'b01101010: y = 14'b10001100010110;
       8'b01101011: y = 14'b10001011101100;
       8'b01101100: y = 14'b10001011000011;
       8'b01101101: y = 14'b10001010011010;
       8'b01101110: y = 14'b10001001110010;
       8'b01101111: y = 14'b10001001001010;
       8'b01110000: y = 14'b10001000100011;
       8'b01110001: y = 14'b10000111111101;
       8'b01110010: y = 14'b10000111010111;
       8'b01110011: y = 14'b10000110110001;
       8'b01110100: y = 14'b10000110001100;
       8'b01110101: y = 14'b10000101100111;
       8'b01110110: y = 14'b10000101000011;
       8'b01110111: y = 14'b10000100011111;
       8'b01111000: y = 14'b10000011111100;
       8'b01111001: y = 14'b10000011011001;
       8'b01111010: y = 14'b10000010110111;
       8'b01111011: y = 14'b10000010010101;
       8'b01111100: y = 14'b10000001110011;
       8'b01111101: y = 14'b10000001010010;
       8'b01111110: y = 14'b10000000110001;
       8'b01111111: y = 14'b10000000010001;       
       8'b10000000: y = 14'b01111111110001;
       8'b10000001: y = 14'b01111111010001;
       8'b10000010: y = 14'b01111110110010;
       8'b10000011: y = 14'b01111110010011;
       8'b10000100: y = 14'b01111101110101;
       8'b10000101: y = 14'b01111101010110;
       8'b10000110: y = 14'b01111100111001;
       8'b10000111: y = 14'b01111100011011;
       8'b10001000: y = 14'b01111011111110;
       8'b10001001: y = 14'b01111011100001;
       8'b10001010: y = 14'b01111011000100;
       8'b10001011: y = 14'b01111010101000;
       8'b10001100: y = 14'b01111010001100;
       8'b10001101: y = 14'b01111001110000;
       8'b10001110: y = 14'b01111001010101;
       8'b10001111: y = 14'b01111000111010;
       8'b10010000: y = 14'b01111000011111;
       8'b10010001: y = 14'b01111000000100;
       8'b10010010: y = 14'b01110111101010;
       8'b10010011: y = 14'b01110111010000;
       8'b10010100: y = 14'b01110110110110;
       8'b10010101: y = 14'b01110110011101;
       8'b10010110: y = 14'b01110110000100;
       8'b10010111: y = 14'b01110101101011;
       8'b10011000: y = 14'b01110101010010;
       8'b10011001: y = 14'b01110100111001;
       8'b10011010: y = 14'b01110100100001;
       8'b10011011: y = 14'b01110100001001;
       8'b10011100: y = 14'b01110011110001;
       8'b10011101: y = 14'b01110011011010;
       8'b10011110: y = 14'b01110011000010;
       8'b10011111: y = 14'b01110010101011;
       8'b10100000: y = 14'b01110010010100;
       8'b10100001: y = 14'b01110001111110;
       8'b10100010: y = 14'b01110001100111;
       8'b10100011: y = 14'b01110001010001;
       8'b10100100: y = 14'b01110000111011;
       8'b10100101: y = 14'b01110000100101;
       8'b10100110: y = 14'b01110000001111;
       8'b10100111: y = 14'b01101111111010;
       8'b10101000: y = 14'b01101111100101;
       8'b10101001: y = 14'b01101111010000;
       8'b10101010: y = 14'b01101110111011;
       8'b10101011: y = 14'b01101110100110;
       8'b10101100: y = 14'b01101110010001;
       8'b10101101: y = 14'b01101101111101;
       8'b10101110: y = 14'b01101101101001;
       8'b10101111: y = 14'b01101101010101;
       8'b10110000: y = 14'b01101101000001;
       8'b10110001: y = 14'b01101100101101;
       8'b10110010: y = 14'b01101100011010;
       8'b10110011: y = 14'b01101100000110;
       8'b10110100: y = 14'b01101011110011;
       8'b10110101: y = 14'b01101011100000;
       8'b10110110: y = 14'b01101011001101;
       8'b10110111: y = 14'b01101010111010;
       8'b10111000: y = 14'b01101010101000;
       8'b10111001: y = 14'b01101010010101;
       8'b10111010: y = 14'b01101010000011;
       8'b10111011: y = 14'b01101001110001;
       8'b10111100: y = 14'b01101001011111;
       8'b10111101: y = 14'b01101001001101;
       8'b10111110: y = 14'b01101000111100;
       8'b10111111: y = 14'b01101000101010;
       8'b11000000: y = 14'b01101000011001;
       8'b11000001: y = 14'b01101000000111;
       8'b11000010: y = 14'b01100111110110;
       8'b11000011: y = 14'b01100111100101;
       8'b11000100: y = 14'b01100111010100;
       8'b11000101: y = 14'b01100111000011;
       8'b11000110: y = 14'b01100110110011;
       8'b11000111: y = 14'b01100110100010;
       8'b11001000: y = 14'b01100110010010;
       8'b11001001: y = 14'b01100110000010;
       8'b11001010: y = 14'b01100101110010;
       8'b11001011: y = 14'b01100101100001;
       8'b11001100: y = 14'b01100101010010;
       8'b11001101: y = 14'b01100101000010;
       8'b11001110: y = 14'b01100100110010;
       8'b11001111: y = 14'b01100100100011;
       8'b11010000: y = 14'b01100100010011;
       8'b11010001: y = 14'b01100100000100;
       8'b11010010: y = 14'b01100011110101;
       8'b11010011: y = 14'b01100011100101;
       8'b11010100: y = 14'b01100011010110;
       8'b11010101: y = 14'b01100011000111;
       8'b11010110: y = 14'b01100010111001;
       8'b11010111: y = 14'b01100010101010;
       8'b11011000: y = 14'b01100010011011;
       8'b11011001: y = 14'b01100010001101;
       8'b11011010: y = 14'b01100001111110;
       8'b11011011: y = 14'b01100001110000;
       8'b11011100: y = 14'b01100001100010;
       8'b11011101: y = 14'b01100001010100;
       8'b11011110: y = 14'b01100001000110;
       8'b11011111: y = 14'b01100000111000;
       8'b11100000: y = 14'b01100000101010;
       8'b11100001: y = 14'b01100000011100;
       8'b11100010: y = 14'b01100000001111;
       8'b11100011: y = 14'b01100000000001;
       8'b11100100: y = 14'b01011111110100;
       8'b11100101: y = 14'b01011111100110;
       8'b11100110: y = 14'b01011111011001;
       8'b11100111: y = 14'b01011111001100;
       8'b11101000: y = 14'b01011110111111;
       8'b11101001: y = 14'b01011110110010;
       8'b11101010: y = 14'b01011110100101;
       8'b11101011: y = 14'b01011110011000;
       8'b11101100: y = 14'b01011110001011;
       8'b11101101: y = 14'b01011101111110;
       8'b11101110: y = 14'b01011101110010;
       8'b11101111: y = 14'b01011101100101;
       8'b11110000: y = 14'b01011101011001;
       8'b11110001: y = 14'b01011101001100;
       8'b11110010: y = 14'b01011101000000;
       8'b11110011: y = 14'b01011100110100;
       8'b11110100: y = 14'b01011100101000;
       8'b11110101: y = 14'b01011100011100;
       8'b11110110: y = 14'b01011100010000;
       8'b11110111: y = 14'b01011100000100;
       8'b11111000: y = 14'b01011011111000;
       8'b11111001: y = 14'b01011011101100;
       8'b11111010: y = 14'b01011011100000;
       8'b11111011: y = 14'b01011011010101;
       8'b11111100: y = 14'b01011011001001;
       8'b11111101: y = 14'b01011010111101;
       8'b11111110: y = 14'b01011010110010;
       8'b11111111: y = 14'b01011010100111;
       default: y = 14'bxxxxxxxxxxxxxx;
     endcase // case (a)
    
endmodule // sbtm_a0

    
    
    
