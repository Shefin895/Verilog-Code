
module full_adder_conditional(input a, b, cin,output sum, cout);

assign sum = (a^b)?~cin:cin;
assign cout=(a&b)?1'b1:(b&cin)?1'b1:(a&cin)?1'b1:1'b0;
endmodule



module full_adder_conditional_tb;

  reg a, b, cin;
  wire sum, cout;

  full_adder_conditional uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

  integer i;

  initial begin
    $display("A B Cin | Sum Cout");
    for (i = 0; i < 8; i = i + 1) begin
      {a, b, cin} = i;       
      #10;               
      $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    end

    $finish;
  end

endmodule
