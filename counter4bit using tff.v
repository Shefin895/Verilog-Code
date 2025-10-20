
module T_FF(input T,clk,reset,output reg Q);
initial Q = 0;
  
  always @(posedge clk ) begin
    if (reset)
      Q <= 1'b0;   //reset condition
    else if(T)
      Q <=~ Q;
    else
      Q<=Q;
end
endmodule

module counter4bitt(input clk,reset, output [3:0]z);

wire t0, t1, t2, t3;
wire q0, q1 ,q2 ,q3;

assign t0 = 1'b1;
assign t1 = q0;
assign t2 = q0&q1;//freq
assign t3 = q0&q1&q2;//feq

T_FF T1(.T(t0), .clk(clk), .reset(reset), .Q(q0));
T_FF T2(.T(t1), .clk(clk), .reset(reset), .Q(q1));
T_FF T3(.T(t2), .clk(clk), .reset(reset), .Q(q2));
T_FF T4(.T(t3), .clk(clk), .reset(reset), .Q(q3));

assign z={q3,q2,q1,q0};
endmodule


module counter4bittt_tb;

  reg clk, reset;
  wire [3:0] z;

  counter4bitt uut (clk,reset,z);
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $monitor("Time=%0t || reset=%b || count=%d", $time, reset, z);
    reset = 1;   
    #10;
    reset = 0;   
    #200;
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
  end

endmodule


