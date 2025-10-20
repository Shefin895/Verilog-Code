
module FSM_mealy_11_101_1011(input clk,rst,in,output reg z);

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
z=0;
case(S)
A:begin 
NS=(in==1)?B:A; 
z=0;
end
B:begin 
NS=(in==1)?C:D; 
z=(in==1)?1:0;
end
C:begin 
NS=(in==1)?C:D; 
z=(in==1)?1:0;
end
D:begin 
NS=(in==1)?E:A; 
z=(in==1)?1:0;
end
E:begin 
NS=(in==1)?F:D; 
z=(in==1)?1:0;
end
F:begin 
NS=(in==1)?C:D; 
z=(in==1)?1:0;
end
default:begin 
NS=A; z=0;
end
endcase
end

endmodule



module FSM_mealy_11_101_1011_tb;
reg clk,rst,in;
wire z;

FSM_mealy_11_101_1011 dut(.clk(clk),.rst(rst),.in(in),.z(z)); 

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
$monitor("Time = %t || in = %b || z= %b",$time,in,z);
rst=1;#10;
rst=0;#5;
#10;
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
