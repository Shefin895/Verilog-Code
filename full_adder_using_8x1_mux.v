
module mux8x1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output reg y);
  always@(*)begin
    case({s2,s1,s0})
      3'b000:y=i0;
      3'b001:y=i1;
      3'b010:y=i2;
      3'b011:y=i3;
      3'b100:y=i4;
      3'b101:y=i5;
      3'b110:y=i6;
      3'b111:y=i7;
    endcase
  end
endmodule

module full_adder(input a,b,cin,output sum,carry);
  
  mux8x1 sum1(.i0(1'b0),.i1(1'b1),.i2(1'b1),.i3(1'b0),.i4(1'b1),.i5(1'b0),.i6(1'b0),.i7(1'b1),.s0(cin),.s1(b),.s2(a),.y(sum));
  mux8x1 carry1(.i0(1'b0),.i1(1'b0),.i2(1'b0),.i3(1'b1),.i4(1'b0),.i5(1'b1),.i6(1'b1),.i7(1'b1),.s0(cin),.s1(b),.s2(a),.y(carry));
endmodule


module addermuxtb;
  reg a,b,cin;
  wire sum,carry;
  
  full_adder uut(a,b,cin,sum,carry);
  
  initial begin
     a=0;b=0;cin=0;#10;
     a=0;b=0;cin=1;#10;
     a=0;b=1;cin=0;#10;
     a=0;b=1;cin=1;#10;
     a=1;b=0;cin=0;#10;
     a=1;b=0;cin=1;#10;
     a=1;b=1;cin=0;#10;
     a=1;b=1;cin=1;#10;
  end
initial begin
  $display("Time\tA B cin| Sum Carry");
  $monitor("%0t\t%b %b %b|  %b   %b", $time, a, b,cin, sum, carry);
  end
endmodule