
module FIFO(input clk,rst,we,re,input [3:0]data_in,output reg[3:0]data_out,output reg full,empty);
  reg [3:0] memory [7:0];//8x4;
  reg[2:0]wr_ptr,rd_ptr,count;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      wr_ptr<=0;
      rd_ptr<=0;
      count<=0;
    end
    else begin
      if(we && !full) begin
        memory[wr_ptr]<=data_in;
        wr_ptr<=wr_ptr+1;
        count<=count+1;  
      end
      if(re && !empty)begin
        data_out<=memory[rd_ptr];
        rd_ptr<=rd_ptr+1;
        count<=count-1;
    end
  end
  end
  always@(*)begin
    full<=(count==8);
    empty<=(count==0);
  end
endmodule


`timescale 1ns/1ps

module FIFO_tb;

  reg clk, rst, we, re;
  reg [3:0] data_in;
  wire [3:0] data_out;
  wire full, empty;

  FIFO uut (
    .clk(clk),
    .rst(rst),
    .we(we),
    .re(re),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  
  always #5 clk = ~clk;

initial begin

    clk = 0; rst = 1; we = 0; re = 0; data_in = 0;

    // Reset
    #10 rst = 0;

    #10 we = 1; data_in = 4'd1;
    #10 data_in = 4'd2;
    #10 data_in = 4'd3;
    #10 we = 0;

    // Read 3 values
    #10 re = 1;
    #30 re = 0;


    #20 $finish;
  end

endmodule
