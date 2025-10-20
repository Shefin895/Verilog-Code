

module mux4x1_tt(input [2:0]i0,i1,i2,i3,input s0,s1,output reg [2:0]z);
always@(*)begin
 case ({s1,s0})
2'b00:z=i0;
2'b01:z=i1;
2'b10:z=i2;
2'b11:z=i3;
endcase
end
endmodule


module mux4x1_tt_tb;
reg [2:0]i0, i1, i2, i3;
reg s0, s1;           
wire [2:0]z;                

  mux4x1_tt uut (.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.z(z));

  initial begin
    $display("Time | s1 s0 | y");
    $monitor("%4t |  %b %b | %d", $time, s1, s0, z);

    i0 = 0; i1 = 1; i2 = 2; i3 = 3;
    s1=0; s0=0; #10;  
    s1=0; s0=1; #10;  
    s1=1; s0=0; #10;
    s1=1; s0=1; #10;  

    $finish;
  end
endmodule