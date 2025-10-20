module encoder4x2(input y0,y1,y2,y3,output reg a,b);
  always@(*)begin
    case({y0,y1,y2,y3})//0001 0010 0100 1000
      4'b0001: {a,b}=2'b00;
      4'b0010: {a,b}=2'b01;
      4'b0100: {a,b}=2'b10;
      4'b1000: {a,b}=2'b11;
    endcase
  end
endmodule

/*module encoder4x2(input [3:0]y,output reg [1:0]a);
  integer i;
  always@(*)begin      
      for(i=0;i<4;i=i+1)begin
        if(y[i])
          a=i[1:0];
      end
  end
endmodule */
      
// Code your testbench here
// or browse Examples
//4x2 encoder,8x3 enocoder
//comparator,decoder,encoder

module encoder4x2_tb;
  reg y0,y1,y2,y3;
  wire a,b;
  
  encoder4x2 uut(y0,y1,y2,y3,a,b);
  initial begin
    $monitor("Time = %t || y0 =%b||y1=%b|| y2=%b||y3=%b|| a=%b|| b=%b",$time,y0,y1,y2,y3,a,b);
    
    {y0,y1,y2,y3} = 4'b0001; #5; 
    {y0,y1,y2,y3} = 4'b0010; #5; 
    {y0,y1,y2,y3} = 4'b0100; #5; 
    {y0,y1,y2,y3} = 4'b1000; #5; 
  end
endmodule


/*
module encoder4x2_tb;
  reg [3:0]y;
  wire [1:0]a;
  
  encoder4x2 uut(y,a);
  initial begin
    $monitor("Time=%t || y=%b || a=%b", $time, y, a);
    
     y=4'b0001;#10;
     y=4'b0010;#10;
     y=4'b0100;#10;
     y=4'b1000;#10;
    
    
  end
endmodule */
