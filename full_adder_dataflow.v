
module full_adder(input a,b,c,output sum,carry);
  
assign sum= a^b^c;
assign carry=(a&b | b&c | a&c);
  
endmodule
    
/////////////////////////////////
module fulladder_tb;
  reg a,b,c;
  wire sum,carry;
  
  full_adder uut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  initial begin
    a=0;b=0;c=0;#10
    a=0;b=0;c=1;#10
    a=0;b=1;c=0;#10
    a=0;b=1;c=1;#10
    a=1;b=0;c=0;#10
    a=1;b=0;c=1;#10
    a=1;b=1;c=0;#10
    a=1;b=1;c=1;#10
    
    $finish;
  end
  initial begin
    $monitor("time=%0t | a=%b b=%b c=%b| sum=%b carry=%b", $time, a, b,c, sum, carry);
  end
    
endmodule
