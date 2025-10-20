

module FSM_101011_moore_nonoverlp(input clk,rst,in,output reg z);
parameter A=4'h0;
parameter B=4'h1;
parameter C=4'h2;
parameter D=4'h3;
parameter E=4'h4;
parameter F=4'h5;
parameter G=4'h6;

reg [3:0] s,ns;

  always@(posedge clk or posedge rst)begin
if (rst==1)
s<=A;
else
s<=ns;
end 

always@(s,in)begin
case(s)
A:ns=(in==1)?B:A;
B:ns=(in==0)?C:B;
C:ns=(in==1)?D:A;
D:ns=(in==0)?E:B;
E:ns=(in==1)?F:A;
F:ns=(in==1)?G:E;
  G:ns=(in==1)?B:C;
default:ns=A;
endcase
end


always@(posedge clk)begin
if(rst)
z<=0;
else if(s==G)
z<=1;
else
z<=0;
end
endmodule

module fsm_101011_moore_NOVLP_tb;

  reg clk, rst, in;
  wire z;

  // DUT instance
  FSM_101011_moore_nonoverlp uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .z(z)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  
  initial begin
    rst = 1; in = 0; #10;   // assert reset
    rst = 0;               // release reset

    // Input sequence: 101011 (first detection)
    in = 1; #10;
    in = 0; #10;
    in= 1; #10;
    in= 0; #10;
    in= 1; #10;
    in= 1; #10; 

   //(second detection)
    in= 1; #10;
    in= 0; #10;
    in= 1; #10;
    in= 0; #10;
    in= 1; #10;
    in= 1; #10;  // 101011 (third detection)
    in= 0; #10;
    in= 1; #10;
    in= 0; #10;
    in= 1; #10;
    in= 1; #10;  

    #20 $finish;
  end

  initial begin
    $dumpfile("fsm_101011_overlapping.vcd");
    $dumpvars(0);
  end

endmodule