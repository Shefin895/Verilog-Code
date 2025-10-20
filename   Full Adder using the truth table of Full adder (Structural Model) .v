module full_adder_str(input a,b,cin, output sum,carry);
  wire s1, c1, c2;

  xor (s1, a, b);
  xor (sum, s1, cin);
  and (c1, a, b);
  and (c2, s1, cin);
  or  (carry, c1, c2);

endmodule

module full_adder_st_tb;
  reg a,b,cin;
  wire sum,carry;
  
  full_adder_str uut (.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    a=0;b=0;cin=0;#10
    a=0;b=0;cin=1;#10
    a=0;b=1;cin=0;#10
    a=0;b=1;cin=1;#10
    a=1;b=0;cin=0;#10
    a=1;b=0;cin=1;#10
    a=1;b=1;cin=0;#10
    a=1;b=1;cin=1;#10
    
    $finish;
  end
  initial begin
    $monitor("time=%0t | a=%b b=%b c=%b| sum=%b carry=%b", $time, a, b,cin, sum, carry);
  end
    
endmodule