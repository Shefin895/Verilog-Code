
// Code your design here
//`timescale 1ns/1ps
module demux1x4 (input I,input s0,s1,output reg y1,y2,y3,y4);
  always@(*)begin
    y1=0;y2=0;y3=0;y4=0;
    case ({s0,s1})
      2'b00:y1=I;
      2'b01:y2=I;
      2'b10:y3=I;
      2'b11:y4=I;
    endcase
    end
endmodule


// Code your testbench here
// or browse Examples
module demux1x4_tb;
  reg I,s0,s1;
  wire y1,y2,y3,y4;
  
  demux1x4 uut(I,s0,s1,y1,y2,y3,y4);
  initial begin
    $monitor("Time = %t|S0 S1 = %d%d|I = %d || y1=%d y2=%d y=%d y4=%d ||",$time,s0,s1,I,y1,y2,y3,y4);
    I=1;s0=0;s1=0;#5;
    I=1;s0=0;s1=1;#5;
    I=1;s0=1;s1=0;#5;
    I=1;s0=1;s1=1;#5;
   $finish;
  end 
endmodule