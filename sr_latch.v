
// Code your design here
module srlatch(input s,r,output reg q,qbar);
  always@(*)begin
    q=0;qbar=0;
    case ({s,r})
      2'b00:begin
      q =q;
      qbar=qbar;
      end
      
      2'b01: begin
        q=0;
        qbar=1;
      end
      
      2'b10: begin
        q=1;
        qbar=0;
      end
      
      2'b11: begin
        q='x;
        qbar='x;
      end
      
    endcase
  end
endmodule


// Code your testbench here
// or browse Examples
module SR_tb;
  reg s,r;
  wire q,qbar;
  integer i=0;
  srlatch uut(s,r,q,qbar);
  initial begin
    $monitor("Time = %0t || S = %b || R =%b || Q = %b || Qbar = %b ||",$time,s,r,q,qbar);
    
    for(i=0;i<4;i=i+1)begin
      {s,r}=i;
      #5;
    end
    $finish;
  end
endmodule