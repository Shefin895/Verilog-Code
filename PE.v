// Code your design here
module PE(input [3:0]y,output reg[1:0]a);
  always@(*)begin
    if(y[3]==1)begin
      a=2'b11;
    end
    else if(y[2]==1)begin
      a=2'b10;
    end
    else if(y[1]==1)begin
      a=2'b01;
    end
    else if(y[0]==1)begin
      a=2'b00;
    end
    else begin
      a=2'b00;
    end
  end
endmodule
    


module pe_tb;
  reg [3:0]y;
  wire [1:0]a;
  integer i;
  PE uut(y,a);
  initial begin
    $monitor("time=%t || y= %b || a= %b",$time,y,a);
    
//     y=4'b1010;
    for(i=0;i<16;i=i+1)begin
    y=i;
      #10;
    
    end
  end
    
endmodule