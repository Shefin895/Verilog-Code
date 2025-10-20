
module decoder3x8(input [2:0]a,output reg [7:0]y);
  integer i;
  always@(*)begin

    y=8'b0;
    for(i=0;i<8;i=i+1)begin
        if(a==i)begin
          y=8'b10000000 >>i;
        end
      end
  end
endmodule
      

module decoder3x8_tb;
  reg [2:0]a;
  wire [7:0]y;
  integer i;
  decoder3x8 uut(a,y);
  initial begin
    $monitor("Time=%t || a=%b || y=%b", $time, a, y);
    
    for(i=0;i<8;i=i+1)begin
      a=i;
      #10;
      
    end
    $finish;
    
  end
endmodule