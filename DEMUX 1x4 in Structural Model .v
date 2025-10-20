module DEMUX_1x4_Structural_Model(input s0,s1,output d0,d1,d2,d3);
wire s0_not,s1_not;
not(s0_not,s0);
not(s1_not,s1);

and(d0,s0_not,s1_not); //00
and(d1,s0_not,s1); //01 
and(d2,s0,s1_not); //10
and(d3,s0,s1);//11 
endmodule


module  DEMUX_1x4_Structural_Model_tb;
  reg s0,s1;
  wire d0,d1,d2,d3;
  
   DEMUX_1x4_Structural_Model uut(s0,s1,d0,d1,d2,d3);
  initial begin
    $monitor("Time = %t|S0 S1 = %d%d|| d0=%d d1=%d d2=%d d3=%d ||",$time,s0,s1,d0,d1,d2,d3);
    s0=0;s1=0;#5;
    s0=0;s1=1;#5;
    s0=1;s1=0;#5;
    s0=1;s1=1;#5;
   $finish;
  end 
endmodule