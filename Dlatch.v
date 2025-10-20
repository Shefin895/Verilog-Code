module Dlatch(input en,D,output reg q,qbar);
  always@(*)begin
    q=0;qbar=0;
    if(en==1)begin
      q=D;
      qbar=~D;
    end
      else begin
        q=q;
        qbar=qbar;
    end
  end
endmodule


module Dlatch_tb;
  reg en,D;
  wire q,qbar;
  integer i;
  Dlatch uut(en,D,q,qbar);
  initial begin
    $monitor("Time = %t || en = %b || D =%b || Q = %b || Qbar = %b ||",$time,en,D,q,qbar);
    for (i=0;i<4;i=i+1)begin
      {en,D}=i;
      #10;
    end
   
    end
endmodule
  