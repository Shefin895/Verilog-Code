// Code your design here
module bcd_to_seven(input [3:0]bcd,output reg [6:0]seven);
  always@(*)begin
    case(bcd)
      4'b0000: seven = 7'b0000001;
      4'b0001: seven = 7'b1001111;
      4'b0010: seven = 7'b0010010;
      4'b0011: seven = 7'b0000110;
      4'b0100: seven = 7'b1001100;
      4'b0101: seven = 7'b0100100;
      4'b0110: seven = 7'b0100000;
      4'b0111: seven = 7'b0001111;
      4'b1000: seven = 7'b0000000;
      4'b1001: seven = 7'b0000100;
      default: seven = 7'bxxxxxxx;
    endcase
  end
endmodule
    
// Code your testbench here

module bcd_to_seven_tb;
  reg [3:0]bcd;
  wire [6:0]seven;
  
  bcd_to_seven uut(.bcd(bcd),.seven(seven));
  
  initial begin
    $monitor("Time %t | bcd=%b | display=%b",$time,bcd,seven);
    
    bcd=4'b0000;
    #10; bcd = 4'b0001;
    #10; bcd = 4'b0010;
    #10; bcd = 4'b0011;
    #10; bcd = 4'b0100;
    #10; bcd = 4'b0101;
    #10; bcd = 4'b0110;
    #10; bcd = 4'b0111;
    #10; bcd = 4'b1000; 
    #10; bcd = 4'b1001;
    #10; bcd = 4'b1111; 
    #50; $finish;
  end
  
endmodule
