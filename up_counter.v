
module up_counter #(parameter N = 4)(input clk,rst,output reg[N-1:0]count,out);
  always@(posedge clk ) begin
    if(rst)begin
      out<=0;
      count<=0;
    end
    else begin
      count<=count+1;
      out <= count;
    end
    
  end
endmodule

module up_counter_tb;
  
  parameter N=4;
  
  reg clk,rst;
  wire [N-1:0]count,out;
  
  up_counter #(N)uut(clk,rst,count,out);
  
  initial clk=0;
  always #2clk=~clk;
  
  initial begin
    clk=0;rst=1;//active high
    #20 rst=0;
    #200;
    $finish;
  end
  
  initial begin
    $monitor("Time=%0t | rst=%b | count=%d | out=%d", $time, rst, count, out);
  end
endmodule