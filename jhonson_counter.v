
module jhonson_counter(input clk,rst,output reg [3:0]out,q);
  always@(posedge clk)begin
    if(rst)
      q<=4'b0;
    else begin
      q[3]<=q[2]; 
      q[2]<=q[1]; 
      q[1]<=q[0]; 
      q[0]<=(~q[3]); 
      out<=q;
    end
  end 
endmodule

module johnson_tb;
  reg clk, rst;
  wire [3:0] out;

  jhonson_counter uut (.clk(clk), .rst(rst), .out(out),.q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;   
  end
  initial begin
    $monitor("Time=%0t | rst=%b | out=%b |q=%b", $time, rst, out,q);

    rst = 1; #10;   
    rst = 0;        

    #150;           
    $finish;
  end
endmodule
