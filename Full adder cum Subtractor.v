// Code your design here

module adder_cum_subractor(input a,b,cin,bin,mode,output reg bor,diff,sum,carry);
  
  always@(*)begin
  
  if(mode==1)begin
  
     sum=a^b^cin;// A xor b xor cin
     carry=(a&b)|(a&cin)|(b&cin);// AB + Acin + Bcin. 
     bor=1'b0;
     diff=1'b0;
  end
    else begin
      diff = a^b^bin;// A xor b xor cin
      bor  = (~a & b) | (~(a ^ b) & bin);// Bin (A XOR B)' + A'B 
      sum=1'b0;
      carry=1'b0;
  end
  end
endmodule

// Code your testbench here
// or browse Examples
module adder_cum_subractor_tb;
  reg a,b,cin,bin,mode;
  wire bor,diff,sum,carry;
  
  adder_cum_subractor uut(a,b,cin,bin,mode,bor,diff,sum,carry);
  
  initial begin
        
    $monitor("time=%t || a=%b | b=%b | cin=%b |bin=%b| sum=%b | carry=%b | diff=%b |borrow=%b",$time,a,b,cin,bin,sum,carry,diff,bor);
    
    mode=1;#5; // adder
    bin=0;
    a=0;b=0;cin=0;#10;
    a=0;b=0;cin=1;#10;
    a=0;b=1;cin=0;#10;
    a=0;b=1;cin=1;#10;
    a=1;b=0;cin=0;#10;
    a=1;b=0;cin=1;#10;
    a=1;b=1;cin=0;#10;
    a=1;b=1;cin=1;#10;
    
    #20;
    
    mode=0;#5; // subtractor
    cin=0;
    a=0;b=0;bin=0;#10;
    a=0;b=0;bin=1;#10;
    a=0;b=1;bin=0;#10;
    a=0;b=1;bin=1;#10;
    a=1;b=0;bin=0;#10;
    a=1;b=0;bin=1;#10;
    a=1;b=1;bin=0;#10;
    a=1;b=1;bin=1;#10;
     
    #20;
    $finish;
  end
endmodule