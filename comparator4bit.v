// Code your design here
module comparator4bit(input [3:0]a,b,output reg aeb,agb,alb);
  always@(*)begin
    aeb=0;alb=0;agb=0;
    if(a<b)begin
      alb=1'b1;
    end
    else if(a>b)begin
      agb=1'b1;
    end
    else begin
      aeb=1'b1;
    end
  end
endmodule
    

// Code your testbench here
// or browse Examples
//4x2 encoder,8x3 enocoder
//comparator,decoder,encoder
module comparator4bit_tb;
  reg [3:0]a,b;
  wire aeb,agb,alb;
  
  comparator4bit uut(a,b,aeb,agb,alb);
  
  initial begin
    $monitor(" a = %b || b= %b || A=b = %b || A<b = %b || a>b =%b",a,b,aeb,alb,agb);
    
//     a=4'b0000;b=4'b1010;#10
    
//     a = 4'b1111; b = 4'b0101; #10;
    
//     // Test 3: a == b
//     a = 4'b1010; b = 4'b1010; #10;

//     // Test 4: random case
//     a = 4'b0110; b = 4'b0111; #10;
    
    repeat(5)begin
      a=$random;b=$random;#10;
    end
    $finish;
  end
endmodule
