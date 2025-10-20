
module mux4x1#(parameter N=4)(input [N-1:0]i0,i1,i2,i3,input s0,s1,output [N-1:0]y);
  wire [N-1:0]w1,w2;
  
  mux2x1 m1(i0,i1,s1,w1);
  mux2x1 m2(i2,i3,s1,w2);
  mux2x1 m3(w1,w2,s0,y);
  
endmodule
