
// Code your design here
module binary_to_gray(input [2:0]bin,output[2:0]gr);
  assign gr[2]=bin[2];
  genvar i;
  generate
    for(i=0;i<2;i=i+1)begin
      assign gr[i]=bin[i+1]^bin[i];
    end
  endgenerate
endmodule

module tb_binary_to_gray;
  reg [2:0] bin; // binary input
  wire [2:0] gr;   // gray output

  binary_to_gray uut (.bin(bin), .gr(gr));

  initial begin
    $monitor("Time=%0t | Binary=%b | Gray=%b", $time, bin, gr);

    // Apply test values
    bin = 3'b000; #5;
    bin = 3'b001; #5;
    bin = 3'b010; #5;
    bin = 3'b011; #5;
    bin = 3'b100; #5;
    bin = 3'b101; #5;
    bin = 3'b110; #5;
    bin = 3'b111; #5;

    $finish;
  end
endmodule
