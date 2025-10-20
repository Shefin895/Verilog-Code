
module mux4X1_using_2X1_tb;
  reg [3:0]i0,i1,i2,i3;
  reg s0,s1;
  wire [3:0]y;
  mux4x1 uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));
  initial begin
    $monitor("time=%0t | I0=%d || I1=%d || I2=%d || I3=%d || s0=%b s1=%b || y=%d",
              $time, i0, i1, i2, i3, s0, s1, y);   

 i0=4'b1001; i1=4'b1100 ;i2=4'b0100; i3=4'b1010;
      
      s0=0;s1=0;#10;
      s0=0;s1=1;#10;
      s0=1;s1=0;#10;
      s0=1;s1=1;#10;
    
    $finish;
  end

endmodule

