module FSM_11_101_1011(input clk,rst,in,output reg z);

parameter A=4'h0;
parameter B=4'h1;
parameter C=4'h2;
parameter D=4'h3;
parameter E=4'h4;
parameter F=4'h5;

reg [2:0]S,NS;

always@(posedge clk)begin
if(rst)
S<=A;
else
S<=NS;
end

always@(S or in)begin
case(S)
A:NS=(in==1)?B:A;
B:NS=(in==1)?C:D;
C:NS=(in==1)?C:A;
D:NS=(in==1)?E:A;
E:NS=(in==1)?F:D;
F:NS=(in==1)?C:D;
default:NS=A;
endcase
end


always@(S)begin
case(S)
C,D,F:z=1;
default:z=0;
endcase
end

endmodule



module FSM_11_101_1011_tb;
reg clk,rst,in;
wire z;

FSM_11_101_1011 dut(.clk(clk),.rst(rst),.in(in),.z(z)); 

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
$monitor("Time = %t || in = %b || z= %b",$time,in,z);
rst=1;#10;
rst=0;#5;

input_x(1);
input_x(1);
input_x(0);
input_x(1);
input_x(0);
input_x(1);
input_x(1);
#10;
$finish;

end

task input_x(input data);
begin
in=data;#10;
end
endtask

endmodule

