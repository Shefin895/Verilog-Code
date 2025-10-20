
// Code your design here
module fsm_1010 (input clk,rst,x,output reg z);
  parameter A=4'h0;
  parameter B=4'h1;
  parameter C=4'h2;
  parameter D=4'h3;
  parameter E=4'h4;
  
  reg [3:0]S,NS;
  
  always@(posedge clk or negedge rst)begin
    if(rst==0)
      S<=A;
    else
      S<=NS;
  end
  
  always@(S or x)begin
    case(S)
      A:NS=(x==1)?B:A;
      B:NS=(x==0)?C:B;
      C:NS=(x==1)?D:A;
      D:NS=(x==0)?E:B;
      E:NS=(x==1)?B:A;
      default:NS=A;  
    endcase
  end
  always@(S)begin
    case(S)
    E:z=1;
    default:z=0;
    endcase
  end
endmodule
  


module fsm_1010_tb;

  reg clk, rst, x;
  wire z;

  // DUT instance
  fsm_1010 uut (.clk(clk),.rst(rst),.x(x),.z(z));

  // Clock generation (10ns period)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Apply reset
    rst = 0;
    x   = 0;
    #12;      
    rst = 1;  

    #10 x = 1;  
    #10 x = 0;  
    #10 x = 1;  
    #10 x = 0;  
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;  

    #20 $finish;
  end

  // Monitor values
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule

