
module fsm_101011 (input clk,rst,x,output reg z);
  parameter A=4'h0;
  parameter B=4'h1;
  parameter C=4'h2;
  parameter D=4'h3;
  parameter E=4'h4;
  parameter F=4'h5;
  //parameter G=4'h6;
  
  reg [3:0]S,NS;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      S <= A;
    else
      S <= NS;
  end
  
  always@(S or x)begin
    z=0;
    case(S)
      A:NS=(x==1)?B:A;
      B:NS=(x==0)?C:B;
      C:NS=(x==1)?D:A;
      D:NS=(x==0)?E:B;
      E:NS=(x==1)?F:C;
      F:begin
        NS=(x==1)?B:C;//A;
        z =(x==1)?1:0;
      end
      default: NS = A;  
    endcase
  end
//   always@(S)begin
//     case(S)
//     A: z=0;
//       B: z=0;
//       C: z=0;
//       D: z=0;
//       E: z=0;
//       F: z=0;
//     G: z=1;
//     default: z=0;
//     endcase
 // end
endmodule
  
module fsm_101011_tb;

  reg clk, rst, x;
  wire z;

  // DUT instance
  fsm_101011 uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .z(z)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  
  initial begin
    rst = 1; x = 0; #10;   // assert reset
    rst = 0;               // release reset

    // Input sequence: 101011 (first detection)
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10; 

   //(second detection)
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;  // 101011 (third detection)
    x = 0; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;  

    #20 $finish;
  end

  initial begin
    $dumpfile("fsm_101011_overlapping.vcd");
    $dumpvars(0);
  end

endmodule
