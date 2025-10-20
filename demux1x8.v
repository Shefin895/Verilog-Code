

// Code your design here
//`timescale 1ns/1ps
module demux1x8 (input I,input s0,s1,s2,output reg y0,y1,y2,y3,y4,y5,y6,y7);
  always@(*)begin
    y0=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;y7=0;
    case ({s0,s1,s2})
      3'b000:y0=I;
      3'b001:y1=I;
      3'b010:y2=I;
      3'b011:y3=I;
      3'b100:y4=I;
      3'b101:y5=I;
      3'b110:y6=I;
      3'b111:y7=I;
    endcase
    end
endmodule


// Code your testbench here
// or browse Examples
module demux1x8_tb;
  reg I,s0,s1,s2;
  wire y0,y1,y2,y3,y4,y5,y6,y7;
  integer i;

  demux1x8 uut(I,s0,s1,s2,y0,y1,y2,y3,y4,y5,y6,y7);
  initial begin
I=1;
    $monitor("Time = %t|S0 S1 S2 = %b%b%b |I = %d ||y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b y6=%b y7=%b||",$time,s0,s1,s2,I,y0,y1,y2,y3,y4,y5,y6,y7);
    for(i=0;i<8;i=i+1)begin
   {s0,s1,s2}=i;#2;
end
   $finish;
  end 
endmodule