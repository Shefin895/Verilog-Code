
// Code your design here
module gray_to_bin(output [2:0]bin,input[2:0]gr);
  assign bin[2]=gr[2];
  genvar i;
  generate
    for(i=0;i<2;i=i+1)begin
      assign bin[i]=bin[i+1]^gr[i];
    end
  endgenerate
endmodule

module tb_gray_to_bin;
  wire [2:0] bin; // binary out
  reg [2:0] gr;  // gray input

  gtob uut (.bin(bin), .gr(gr));

  initial begin
    $monitor("Time=%0t | Binary=%b | Gray=%b", $time, bin, gr);

    gr = 3'b010; #5;
    gr = 3'b011; #5;
    gr = 3'b110; #5;

    $finish;
  end
endmodule
