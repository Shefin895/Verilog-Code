// Code your design here
module siso(input clk,si,rst,output reg so,output reg[3:0]temp);
  always@(posedge clk)begin
    if(rst)begin
      so<=1'b0;
    temp<=4'b0000;
    end
    else begin
   // temp[3]<=si;
      so<=temp[0];
    //temp <= {si, temp[3:1]};
      temp <= temp >> 1;
      temp[3] <= si;
    
  end
  end
endmodule
  // Code your testbench here

module siso_tb;
  reg clk,si,rst;
  wire so;
  wire[3:0]temp;
  
  siso uut(clk,si,rst,so,temp);
  
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
     $monitor("Time=%0t | rst=%b | si=%b | temp=%b | so=%b",
              $time, rst, si, temp, so);
    rst=1;si=0;
    #12 rst=0;
    
    si=1;#10;
    si=1;#10;
    si=1;#10;
    si=1;#10;
    
    #30 rst=1;si=0;
    
    $finish;
  end
endmodule
