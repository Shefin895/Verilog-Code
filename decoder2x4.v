
module decoder2x4(input [1:0]a,output reg [3:0]y);
  integer i;
  always@(*)begin

y=4'b0;
for(i=0;i<4;i=i+1)begin
if(a==i)begin
y=4'b1000 >>i;
end
end
end

endmodule


module decoder2x4_tb;
  reg [1:0]a;
  wire [3:0]y;
  integer i;
  decoder2x4 uut(a,y);
  initial begin
    $monitor("Time=%t || a=%b || y=%b", $time, a, y);
    
     for(i=0;i<4;i=i+1)begin
    a=i;     #10;
      
     end
  //  a=2'b00;#5;
  //  a=2'b01;#5;
  //  a=2'b10;#5;
  //  a=2'b11;#5;
    $finish;
    
  end
endmodule