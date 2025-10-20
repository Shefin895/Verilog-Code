
module fulladder_conc(input a,b,cin,output sum,carry);
assign sum=(a^b)?~cin:cin; // if a xor b =1 it will pass to ~cin or if a xor b = 0 it will pass to cin;
assign carry=(a&b)?1'b1:(b&cin)?1'b1:(a&cin)?1'b1:1'b0;
endmodule

module fulladderconc_tb;
  reg a,b,cin;
  wire sum,carry;
  
  fulladder_conc uut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
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