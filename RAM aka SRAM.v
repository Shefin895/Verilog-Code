

module ram(input clk,we,input[3:0]address,input[3:0]data_in,output reg[3:0] data_out);
  //memory 
  
  //reg[width:0] name [depth:0];
  reg[3:0]memory[7:0];// 8x4 memory
  
  always@(posedge clk)begin
    if(we)
      memory[address]<=data_in;
    else
      data_out=memory[address];
  end
endmodule

module ram_tb;
  reg clk,we;
  reg [3:0]address;
  reg[3:0]data_in;
  wire [3:0]data_out;
  
  ram dut(clk,we,address,data_in,data_out);
  
  always #5 clk=~clk;
  
  initial begin
    $monitor("time=%t|| we=%d || data_in =%d || address=%d  || data_out =%d  ",$time,we,data_in,address,data_out);
    clk=0;
    we=0;
    address = 0;
    data_in = 0;
    
    #10 we = 1; address = 4; data_in = 9;
    #10 we = 0; address = 4; 
    #10 we = 1; address = 2; data_in = 10;
    #10 we = 0; address = 2; 

    #100;$finish;
  end
endmodule