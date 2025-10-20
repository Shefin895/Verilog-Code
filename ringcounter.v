

module ring_counter(input clk,rst,output reg [3:0]out,q);
  always@(posedge clk)begin
    if(rst)
      q<=4'b0001;
    else begin
      q[3]<=q[2]; 
      q[2]<=q[1]; 
      q[1]<=q[0]; 
      q[0]<=q[3]; 
      out<=q;
    end
  end
 
endmodule


module ring_tb;
  reg clk, rst;
  wire [3:0] out;

  // DUT
  ring_counter uut (.clk(clk), .rst(rst), .out(out));

  // Clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;   // 10 ns clock period
  end

  // Stimulus
  initial begin
    $monitor("Time=%0t | rst=%b | out=%b", $time, rst, out);

    rst = 1; #10;   // reset active
    rst = 0;        // release reset

    #150;           // run for some time
    $finish;
  end
endmodule