//using t ff

module t_ff(input t,clk,reset,output reg Q);
always@(posedge clk  or posedge reset)begin
if(reset)begin
Q<=0;
end
else if(t)begin
Q<=~Q;
end
end
endmodule

module freqdivider8(input clk,reset,output divider_out);
wire q1,q2,q3;

t_ff t1(.t(1'b1),.clk(clk),.reset(reset),.Q(q1)); //%2
t_ff t2(.t(1'b1),.clk(q1),.reset(reset),.Q(q2)); //%4
t_ff t3(.t(1'b1),.clk(q2),.reset(reset),.Q(q3)); //%8
assign divider_out=q3;
endmodule


module fre8div_tb();
reg clk,reset;
wire divider_out;

freqdivider8 uut(clk,reset,divider_out);

initial begin
clk=0;
forever #10 clk=~clk;
end

initial begin
    $monitor("Time=%0t | reset=%b | clk=%b | clk_div8_out=%b", 
              $time, reset, clk, divider_out);

    // Initial reset
    reset = 1;
    #20;            // hold reset for some time
    reset = 0;

    // Run simulation for some cycles
    #200;
    $finish;
  end

endmodule
