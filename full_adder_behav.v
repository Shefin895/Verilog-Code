
module full_adder_behav(input a,b,cin, output reg sum,carry);

  always @ (*) begin
  sum = a^b^cin;
  carry = a&b | b&cin |a&cin ;
  end

endmodule


module fulladder_tb_behav;
  reg a,b,cin;
  wire sum,carry;
  integer i;
  full_adder_behav uut (.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    for (i=0;i<8;i=i+1)begin
    {a,b,cin}=i;  //we can use concatenation for compaining more bit into single {a,b,c}=i; when in loop it assign equally
    #10;
$display("i=%b",i);//give every combination of i for the output
    end    
    
    $finish;
  end
  initial begin
    $monitor("time=%0t | a=%b b=%b c=%b| sum=%b carry=%b", $time, a, b,cin, sum, carry);
  end
    
endmodule
