module half_adder(input a, b, output reg sum, carry);

always@(a,b)begin
sum=a^b;
carry=a&b;
end

endmodule

module half_adder_bhv_tb;
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