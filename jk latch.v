
module jk_latch(input enable,j,k, output reg q,qbar);
  initial begin
    q=0;
    qbar=1;
  end
  always@(*)begin
    if(enable)begin
    case({j,k})
     2'b00:begin
     end 
      2'b01:begin
         q<=0;
        qbar=1;
     end
      2'b10:begin
         q<=1;
        qbar=0;
     end
      2'b11:begin
        q<=~q;
        qbar=~qbar;
      end
    endcase
  end
  end
endmodule