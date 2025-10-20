module mux_4x1_conditional(input [2:0]i0,i1,i2,i3,input s0,s1,output [2:0]y);

assign y=(s1==0)?((s0==0)?i0:i1):((s0 == 0) ? i2 : i3); 
endmodule

module mux_4x1_conditional_tb;
reg [2:0]i0, i1, i2, i3;
reg s0, s1;           
wire  [2:0]y;                

  mux_4x1_conditional uut (.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));

  initial begin
    $display("Time | s1 s0 | y");
    $monitor("%4t |  %b %b | %d", $time, s1, s0, y);

    i0 = 0; i1 = 1; i2 = 2; i3 = 3;
    s1=0; s0=0; #10;  
    s1=0; s0=1; #10;  
    s1=1; s0=0; #10;
    s1=1; s0=1; #10;  

    $finish;
  end

endmodule
