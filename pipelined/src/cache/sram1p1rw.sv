///////////////////////////////////////////
// 1 port sram.
//
// Written: ross1728@gmail.com May 3, 2021
//          Basic sram with 1 read write port.
//          When clk rises Addr and CacheWriteData are sampled.
//          Following the clk edge read data is output from the sampled Addr.
//          Write 
//
// Purpose: Storage and read/write access to data cache data, tag valid, dirty, and replacement.
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// MIT LICENSE
// Permission is hereby granted, free of charge, to any person obtaining a copy of this 
// software and associated documentation files (the "Software"), to deal in the Software 
// without restriction, including without limitation the rights to use, copy, modify, merge, 
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
// to whom the Software is furnished to do so, subject to the following conditions:
//
//   The above copyright notice and this permission notice shall be included in all copies or 
//   substantial portions of the Software.
//
//   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//   INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//   PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
//   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
//   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
//   OR OTHER DEALINGS IN THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////////////////////

// WIDTH is number of bits in one "word" of the memory, DEPTH is number of such words

`include "wally-config.vh"

// SRAM is hard sram macro
// read first is a verilog model of SRAM with extra hardware to make it appear as write first.
// write first is a verilog model of flops which implements write first behavior.

// If the goal is to use flops use write first.  This implements the least amount of hardware for
// the ram.  If the goal is to use SRAM use SRAM  This currently only supports 64x128 SRAMs.
// If the goal is model SRAM behavior then use READ_FIRST.  sram1p1rw adds extra hardware to
// ensure write first behavior is observered.

module sram1p1rw #(parameter DEPTH=128, WIDTH=256, RAM_TYPE = "READ_FIRST") (
  input logic                     clk,
  input logic                     ce,
  input logic [$clog2(DEPTH)-1:0] Adr,
  input logic [WIDTH-1:0]         CacheWriteData,
  input logic                     WriteEnable,
  input logic [(WIDTH-1)/8:0]     ByteMask,
  output logic [WIDTH-1:0]        ReadData);

  logic [WIDTH-1:0]               StoredData[DEPTH-1:0];
  logic [WIDTH-1:0]               ReadDataInternal, WriteDataD;
  logic                           WriteEnableD;


  // ***************************************************************************
  // TRUE SRAM macro
  // ***************************************************************************
  if (RAM_TYPE == "SRAM") begin
    genvar index;
    // 64 x 128-bit SRAM
    // check if the size is ok, complain if not***
    logic [WIDTH-1:0] BitWriteMask;
    for (index=0; index < WIDTH; index++) 
      assign BitWriteMask[index] = ByteMask[index/8];
    TS1N28HPCPSVTB64X128M4SW sram(
      .CLK(clk), .CEB(~ce), .WEB(~WriteEnable),
      .A(Adr), .D(CacheWriteData), 
      .BWEB(~BitWriteMask), .Q(ReadDataInternal));
    
  // ***************************************************************************
  // Correctly modeled SRAM as read first 
  // ***************************************************************************
  end else if (RAM_TYPE == "READ_FIRST") begin
    integer index2;
    if (WIDTH%8 != 0) // handle msbs if not a multiple of 8
      always_ff @(posedge clk) 
        if (ce & WriteEnable & ByteMask[WIDTH/8])
          StoredData[Adr][WIDTH-1:WIDTH-WIDTH%8] <= #1 CacheWriteData[WIDTH-1:WIDTH-WIDTH%8];
    
    always_ff @(posedge clk) begin
      if(ce) begin
        if(WriteEnable) begin
          for(index2 = 0; index2 < WIDTH/8; index2++) 
            if(ce & WriteEnable & ByteMask[index2])
		      StoredData[Adr][index2*8 +: 8] <= #1 CacheWriteData[index2*8 +: 8];
        end
        ReadDataInternal <= #1 StoredData[Adr];
      end
    end
    always_ff @(posedge clk) begin
      if(ce) begin
        WriteEnableD <= WriteEnable;
        if(WriteEnable) WriteDataD <= #1 CacheWriteData;
      end
    end
    assign ReadData = WriteEnableD ? WriteDataD : ReadDataInternal; // convert to Write First SRAM by forwarding the write data on write
    
  // ***************************************************************************
  // Memory modeled as wrire first.  best as flip flop implementation.
  // ***************************************************************************
  end else if (RAM_TYPE == "WRITE_FIRST") begin
    logic [$clog2(DEPTH)-1:0]       AdrD;
    flopen #($clog2(DEPTH)) RAdrDelayReg(clk, ce, Adr, AdrD);
    integer                         index2;
    if (WIDTH%8 != 0) // handle msbs if not a multiple of 8
      always_ff @(posedge clk) 
        if (ce & WriteEnable & ByteMask[WIDTH/8])
          StoredData[Adr][WIDTH-1:WIDTH-WIDTH%8] <= #1 CacheWriteData[WIDTH-1:WIDTH-WIDTH%8];
    
    always_ff @(posedge clk) begin
      if(ce) begin
        if(WriteEnable) begin
          for(index2 = 0; index2 < WIDTH/8; index2++) 
            if(ce & WriteEnable & ByteMask[index2])
		      StoredData[Adr][index2*8 +: 8] <= #1 CacheWriteData[index2*8 +: 8];
        end
      end
    end
    assign ReadData = StoredData[AdrD];
  end

endmodule
