// Code your testbench here
// or browse Examples
module mux8x1_using_2x1mux_tb;
  reg [3:0]i0,i1,i2,i3,i4,i5,i6,i7;
  reg s0,s1,s2;
  wire [3:0]y;
  integer k;
  mux8x1_using_2x1  uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.s0(s0),.s1(s1),.s2(s2),.y(y));
  initial begin
    i0 = 4'h0;
    i1 = 4'h1;
    i2 = 4'h2;
    i3 = 4'h3;
    i4 = 4'h4;
    i5 = 4'h5;
    i6 = 4'h6;
    i7 = 4'h7;
    $display("Time | S2 | S1 | S0 | OUT");
    $monitor("%4t |  %b  |  %b  |  %b  |  %h", $time, s2, s1, s0, y);

    // Loop through all 8 select lines
    for (k=0; k<8; k=k+1) begin
      {s2,s1,s0} = k;  
      #10; // wait for output to settle
    end

    $finish;
  end

endmodule
