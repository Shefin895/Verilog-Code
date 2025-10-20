module half_adder(input a, b, output sum, carry);
  xor(sum,a,b);
  and(carry,a,b);
endmodule

module half_adder_str_tb;
  reg a, b;
  wire sum, carry;
  half_adder uut (.a(a), .b(b), .sum(sum), .carry(carry));

  initial begin
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end

  initial begin
    $monitor("time=%0t | a=%b b=%b | sum=%b carry=%b", $time, a, b, sum, carry);
  end
endmodule