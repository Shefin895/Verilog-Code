
// Code your design here
module pipo (input clk,rst,load,input [3:0]pi,output reg [3:0]po);
  always@(posedge clk)begin
    if(rst)
      po<=4'b0000;
    else if(load==1)
      po <= pi;   
  end
endmodule


// Code your testbench here
// or browse Examples
module pipo_tb;
  reg clk,rst,load;
  reg [3:0]pi;
  
  wire [3:0]po;
  
  pipo uut(clk,rst,load,pi,po);
  
  initial begin 
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor("Time=%0t | rst=%b | load=%b | pi=%b | po=%b", 
              $time, rst, load, pi, po);
    
    
    rst = 1; load = 0; pi = 4'b0000;
    #10 rst = 0; // release reset

    // Step 2: Load 1011
    load = 1; pi = 4'b1000;
    #10;

    // Step 3: Load 1100
    pi = 4'b1100;
    #10;

    // Step 4: Keep load=0, try changing input (should not affect q)
    load = 0; pi = 4'b1111;
    #10;

    // Step 5: Load again
    load = 1; pi = 4'b0101;
    #10;

    $finish;
  end

endmodule