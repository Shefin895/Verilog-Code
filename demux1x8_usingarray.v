


// Code your design here
//`timescale 1ns/1ps
module demux1x8 (input I,input [2:0]s,output reg [7:0]y);

  always@(*)begin
    y=8'b00000000;
    case (s)
      3'b000:y[0]=I;
      3'b001:y[1]=I;
      3'b010:y[2]=I;
      3'b011:y[3]=I;
      3'b100:y[4]=I;
      3'b101:y[5]=I;
      3'b110:y[6]=I;
      3'b111:y[7]=I;
    endcase
    end
endmodule


// Code your testbench here
// or browse Examples
module demux1x8array_tb;
  reg I;
  reg [2:0]s;
  wire [7:0]y;
  integer i;

  demux1x8 uut(I,s,y);
  initial begin
I=1;
    $monitor("Time = %t|S0 S1 S2 = %b |I = %b ||y=%b||",$time,s,I,y);
    for(i=0;i<8;i=i+1)begin
   s=i;#2;
end
   $finish;
  end 
endmodule