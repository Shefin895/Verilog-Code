module mux2x1 ( input  [3:0] i0, i1, input s,output reg [3:0] y );
always @(*) begin
    case (s)
        1'b0: y = i0;
        1'b1: y = i1;
        default: y = 4'b0000;
    endcase
end

endmodule

module tb_mux2x1;
  reg  [3:0] i0, i1;
  reg        s;
  wire [3:0] y;

  mux2x1 uut (.i0(i0),.i1(i1),.s(s),.y(y));

  initial begin
    $display("Time | s | i0 | i1 | y");
    $monitor("%4t | %b | %b | %b | %b", $time, s, i0, i1, y);

    i0 = 4'b1010; i1 = 4'b0101; s = 0; #10; 
    s = 1; #10;                             
    i0 = 4'b1111; i1 = 4'b0000; s = 0; #10; 
    s = 1; #10;                             

    $finish;
  end
endmodule
