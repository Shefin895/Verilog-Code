// Code your design here
module half_subtractor(input a,b,output diff,borrow);
  wire y;
  xor(diff,a,b);
  not(y,a);
  and(borrow,b,y);
endmodule

// Code your testbench here
// or browse Examples
module H_Sub_tb;
  reg a,b;
  wire diff,borrow;
  
  half_subtractor uut(a,b,diff,borrow);
  
  initial begin
    $monitor("Time = %t || a=%b || b=%b|| diff=%b || borrow=%b",$time,a,b,diff,borrow);
    
     a=0;b=0;#10;
     a=0;b=1;#10;
     a=1;b=0;#10;
     a=1;b=1;#10;
    $finish;
  end
endmodule
