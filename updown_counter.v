
module updown_counter#(parameter N=4)(input clk,rst,updown,output reg[N-1:0]out);
 always@(posedge clk )begin //synchronus for asynchronus use posedge rst tooo
  if(rst)begin
  out<=0;
  end
  else begin 
  if (updown==1)begin
  out<=out+1;
end
else if(updown==0)begin
out<=out-1;
  end
end
end
endmodule

module updown_tb;
parameter N=4;

reg clk,rst,updown;
wire [N-1:0]out;

updown_counter #(N) uut (clk,rst,updown,out);

initial begin
clk=0;
forever #5 clk= ~clk;
end

initial begin
$monitor("Time=%0t | rst=%b | up_down=%b | count=%d",$time, rst, updown, out);
rst = 1; updown = 1;
#10 rst = 0;
updown = 1;   
#170;          

updown = 0;
#200;
$finish;
end
endmodule