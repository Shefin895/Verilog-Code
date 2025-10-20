
module mux2x1 (input  i0, i1,input  s,output y);

assign y = (s) ? i1 : i0; 

endmodule

module tb_mux2x1;
  reg  i0, i1, s;
  wire y;

  mux2x1 uut (
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(y)
  );

  initial begin
    $display("Time | s | i0 | i1 | y");
    $monitor("%4t | %b | %b  | %b  | %b", $time, s, i0, i1, y);

    i0 = 1; i1 = 0; s = 0; #10;
    i0 = 0; i1 = 1; s = 0; #10; 

    i0 = 1; i1 = 0; s = 1; #10; 
    i0 = 0; i1 = 1; s = 1; #10; 

    $finish;
  end
endmodule
