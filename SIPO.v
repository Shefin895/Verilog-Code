
// Code your design here
module sipo(input clk,clear,si,output reg[3:0]po,temp);
  
  always@(posedge clk)begin
    if(clear)
      temp<=4'b0000;
    else
      temp<=temp<<1;
     temp[0]<=si;
      po=temp;
    
  end
endmodule


// Code your testbench here
module sipo_tb;
  reg clk, clear, si;
  wire [3:0] po;
  
  sipo uut (.clk(clk), .clear(clear), .si(si), .po(po));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end
  
  initial begin
    $monitor("Time=%0t | clear=%b | si=%b | po=%b", $time, clear, si, po);

    clear = 1; si = 0;
    #10 clear = 0;  

    
    si = 1; #10;
    si = 0; #10;
    si = 1; #10;
    si = 1; #10;
 
    clear = 1; #10 clear = 0;

    si = 0; #10;
    si = 1; #10;
    si = 0; #10;
    si = 1; #10;

    $finish;
  end
endmodule
