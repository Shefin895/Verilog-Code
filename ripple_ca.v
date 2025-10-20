
module rca(a,b,cin,sum,carry);
  input [3:0]a;
  input [3:0]b;
  input cin;
  output [3:0]sum;
  output carry;
  
  wire c1,c2,c3;
  
  full_adder FA0(a[0],b[0],cin,sum[0],c1);
  full_adder FA1(a[1],b[1],c1,sum[1],c2);
  full_adder FA2(a[2],b[2],c2,sum[2],c3);
  full_adder FA3(a[3],b[3],c3,sum[3],carry);
  
endmodule

module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// Code your testbench here
// or browse Examples

module ripple_carry_adder_tb;
  
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire carry;
  integer i,j;
  rca uut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    $monitor("time=%0t | a = %b |b = %b| cin = %b || sum = %b | carry = %b",$time,a,b,cin,sum,carry);
    /*
    a=4'b0000; b=4'b1010; cin=0; #10;
    a=4'b0110; b=4'b1110; cin=0; #10;
    a=4'b1010; b=4'b1011; cin=0; #10;
    a=4'b0000; b=4'b0110; cin=0; #10;*/
    //for a 
    for(i=0;i<16;i=i+1)begin
      
      for(j=0;j<16;j=j+1)begin //for b
        a=i;
        b=j;
        cin=0;#10;
        cin=1;#10;
      end
    end
    $finish;
  end
endmodule
