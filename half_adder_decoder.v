
module decoder2x4(input [1:0]a ,output reg [3:0]y);
  integer i=0;
  always@(*)begin
    y=4'b0000;
    for(i=0;i<4;i=i+1)begin
      if(a==i)
        y=4'b1000>>i;
    end
  end
endmodule

module half_adder_decoder(input a,b,output sum,carry);
  wire[3:0] D;
  wire[1:0]AB={a,b};
  
  decoder2x4 d1(.a(AB),.y(D));
  assign sum= D[1] | D[2];
  assign carry = D[0];
endmodule

module ha_tb;
  reg a,b;
  wire sum,carry;
  
  half_adder_decoder uut(a,b,sum,carry);
  
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