
module mux2x1 #(parameter N = 4)(input [N-1:0]i0,i1,input s0,output reg [N-1:0]y);
always@(*)begin
case(s0)
0:y=i0;
1:y=i1;
endcase
end
endmodule

module mux8x1_using_2x1 #(parameter N=4)(
  input  [N-1:0] i0,i1,i2,i3,i4,i5,i6,i7,
  input  s0,s1,s2,
  output [N-1:0] y
);

  wire [N-1:0] w1[3:0];
  wire [N-1:0] w2[1:0];

  genvar i;
  generate
    for (i=0; i<4; i=i+1) begin 
      mux2x1 #(N) M1 (.i0( (i==0)? i0 : (i==1)? i2 : (i==2)? i4 : i6 ),.i1( (i==0)? i1 : (i==1)? i3 : (i==2)? i5 : i7 ),.s0(s0),.y(w1[i]));
end
endgenerate
  
 generate
for (i=0; i<2; i=i+1) begin 
  mux2x1 #(N) M2(.i0(w1[2*i]),.i1(w1[2*i+1]),.s0(s1),.y(w2[i]));
end 
endgenerate

  mux2x1 #(N) M3(.i0(w2[0]),.i1(w2[1]),.s0(s2),.y(y));
                                    
endmodule

