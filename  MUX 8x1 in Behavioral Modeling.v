
module  MUX8x1_in_Behavioral_Modeling(input [3:0]i0,i1,i2,i3,i4,i5,i6,i7,input s0,s1,s2,output reg [3:0]y);
always@(*)begin
case({s2,s1,s0})
3'b000:y=i0;
3'b001:y=i1;
3'b010:y=i2;
3'b011:y=i3;
3'b100:y=i4;
3'b101:y=i5;
3'b110:y=i6;
3'b111:y=i7;
default:y=1'bxxxx;
endcase
end
endmodule

module MUX8x1_in_Behavioral_Modeling_tb;
  reg [3:0]i0,i1,i2,i3,i4,i5,i6,i7;
  reg s0,s1,s2;
  wire [3:0]y;
  integer k;
  MUX8x1_in_Behavioral_Modeling  uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.s0(s0),.s1(s1),.s2(s2),.y(y));
  initial begin
    i0 = 4'h0;
    i1 = 4'h1;
    i2 = 4'h2;
    i3 = 4'h3;
    i4 = 4'h4;
    i5 = 4'h5;
    i6 = 4'h6;
    i7 = 4'h7;
    $display("Time | S2 | S1 | S0 | OUT");
    $monitor("%4t |  %b  |  %b  |  %b  |  %h", $time, s2, s1, s0, y);
    for (k=0; k<8; k=k+1) begin
      {s2,s1,s0} = k;  
      #10; 
    end

    $finish;
  end

endmodule
