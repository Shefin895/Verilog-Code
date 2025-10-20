// Code your design here
module mux4x1 #(parameter N=4)(input [N-1:0]i0,i1,i2,i3,input s0,s1,output reg [N-1:0]y);
  always@(*)begin
    case ({s1,s0})
      2'b00:y=i0;
      2'b01:y=i1;
      2'b10:y=i2;
      2'b11:y=i3;
      default:y=2'b0;
    endcase
  end
endmodule

module mux8x1_using_4x1 #(parameter N=4)(input[N-1:0]i0,i1,i2,i3,i4,i5,i6,i7,input s0,s1,s2,output [N-1:0]y);
  wire [N-1:0]w1,w2;
  
  mux4x1 #(N) M1(.i0(i0),.i1(i1),.i2(i2),.i3(i3), .s0(s0), .s1(s1), .y(w1));
  mux4x1 #(N) M2(.i0(i4),.i1(i5),.i2(i6),.i3(i7), .s0(s0), .s1(s1), .y(w2));
mux4x1 #(N) M3(.i0(w1), .i1(w2), .i2({N{1'b0}}), .i3({N{1'b0}}),
               .s0(s2), .s1(1'b0), .y(y));

endmodule
  
  //mux4x1 #(N) M3(.i0(w1), .i1(w2), .i2({N{1'b0}}), .i3({N{1'b0}}),.s0(1'b0), .s1(s2),.y(y));
  
//endmodule


// Code your testbench here
// or browse Examples
module mux_tb;
  reg [3:0]i0,i1,i2,i3,i4,i5,i6,i7;
  reg s0,s1,s2;
  wire [3:0]y;
  
  mux8x1_using_4x1  uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.s0(s0),.s1(s1),.s2(s2),.y(y));
  initial begin
    i0 = 4'h0;
    i1 = 4'h1;
    i2 = 4'h2;
    i3 = 4'h3;
    i4 = 4'h4;
    i5 = 4'h5;
    i6 = 4'h6;
    i7 = 4'h7;
    $display("       S2 | S1 | S0 | OUT");
$monitor("%4t |  %b  | %b  | %b  |  %h", $time, s2, s1, s0, y);

    s2=0; s1=0; s0=0; #10;  // Expect i0 = 0
    s2=0; s1=0; s0=1; #10;  // Expect i1 = 1
    s2=0; s1=1; s0=0; #10;  // Expect i2 = 2
    s2=0; s1=1; s0=1; #10;  // Expect i3 = 3
    s2=1; s1=0; s0=0; #10;  // Expect i4 = 4
    s2=1; s1=0; s0=1; #10;  // Expect i5 = 5
    s2=1; s1=1; s0=0; #10;  // Expect i6 = 6
    s2=1; s1=1; s0=1; #10;  // Expect i7 = 7

    $finish;
  end

endmodule 

// Testbench for mux8x1_using_4x1
/*module mux_tb;
  reg [3:0] i0, i1, i2, i3, i4, i5, i6, i7;
  reg s0, s1, s2;       // include s2
  wire [3:0] y;

  // DUT instantiation
  mux8x1_using_4x1 uut (
    .i0(i0), .i1(i1), .i2(i2), .i3(i3),
    .i4(i4), .i5(i5), .i6(i6), .i7(i7),
    .s0(s0), .s1(s1), .s2(s2),
    .y(y)               // fixed
  );

  initial begin
    // Assign unique values to each input
    i0 = 4'h0;
    i1 = 4'h1;
    i2 = 4'h2;
    i3 = 4'h3;
    i4 = 4'h4;
    i5 = 4'h5;
    i6 = 4'h6;
    i7 = 4'h7;

    $display("Time | s2 s1 s0 | y");
    $monitor("%4t |  %b  %b  %b | %h", $time, s2, s1, s0, y);

    // Apply select combinations
    s2=0; s1=0; s0=0; #10;  // expect y=0
    s2=0; s1=0; s0=1; #10;  // expect y=1
    s2=0; s1=1; s0=0; #10;  // expect y=2
    s2=0; s1=1; s0=1; #10;  // expect y=3
    s2=1; s1=0; s0=0; #10;  // expect y=4
    s2=1; s1=0; s0=1; #10;  // expect y=5
    s2=1; s1=1; s0=0; #10;  // expect y=6
    s2=1; s1=1; s0=1; #10;  // expect y=7

    $finish;
  end
endmodule
*/
