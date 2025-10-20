
module alu #(parameter N = 8 )(input [N-1:0]a,b,input [2:0]sel,output reg [N-1:0]out);
always@(*)begin
case(sel)
3'b000:out=a+b;
3'b001:out=a-b;
3'b010:out=a^b;//xor
3'b011:out=~a;//not
3'b100:out=a&b;//and
3'b101:out=a|b;//or
3'b110:out=b+1;//increment
3'b111:out=a>>1;//shfit
default:out={N{1'b0}};
endcase
end
endmodule

module alu_tb;
    parameter N = 8;
    reg  [N-1:0] a,b;
    reg  [2:0] sel;
    wire [N-1:0] out;
    integer i;
    alu #(N) uut (.a(a), .b(b), .sel(sel), .out(out));

    initial begin
        a = 8'd15;    // A = 15
        b = 8'd3;    // B = 3

        $display("sel | Operation | Result");
        for ( i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;
            $display("%b   | %0d   | %d", sel, i, out);
        end

        $finish;
    end
endmodule
