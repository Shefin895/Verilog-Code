
module mux4x1(input i0,i1,i2,i3,s0,s1,output reg y);
  always@(*)begin
    case({s0,s1})
      2'b00:y=i0;
      2'b01:y=i1;
      2'b10:y=i2;
      2'b11:y=i3;
    endcase
  end
endmodule

module half_adder(input a,b,output sum,carry);
  
  mux4x1 sum1(.i0(1'b0),.i1(1'b1),.i2(1'b1),.i3(1'b0),.s0(b),.s1(a),.y(sum));
  mux4x1 carry1(.i0(1'b0),.i1(1'b0),.i2(1'b0),.i3(1'b1),.s0(b),.s1(a),.y(carry));
endmodule


module tb;
  reg a,b;
  wire sum,carry;
  
  half_adder uut(a,b,sum,carry);
  
  initial begin
     a=0;b=0;#10;
     a=0;b=1;#10;
     a=1;b=0;#10;
     a=1;b=1;#10;
  end
initial begin
    $display("Time\tA B | Sum Carry");
    $monitor("%0t\t%b %b |  %b   %b", $time, a, b, sum, carry);
  end
endmodule