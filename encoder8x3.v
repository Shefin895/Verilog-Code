module encoder8x3(input [7:0]y,output reg [2:0]a);
  integer i;
  always@(*)begin
    for(i=0;i<8;i=i+1)begin
        if(y[i])
          a=i[2:0];
      end
  end
endmodule
      

module encoder8x3_tb;
  reg [7:0]y;
  wire [2:0]a;
  integer i;
  encoder8x3 uut(y,a);
  initial begin
    $monitor("Time=%t || y=%b || a=%b", $time, y, a);
    
    for(i=0;i<8;i=i+1)begin
      y=8'b1 <<i;
      #10;
      
    end
      
    
//      y=8'b00000001;#10;
//      y=8'b00000010;#10;
//      y=8'b00000100;#10;
//      y=8'b00001000;#10;
//      y=8'b00010000;#10;
//      y=8'b00100000;#10;
//      y=8'b01000000;#10;
//      y=8'b10000000;#10;
    
    
    
  end
endmodule