`timescale 1ns/1ps
module p_as #(parameter width = 16)(
    input [width-1:0]a,b,           
    input cin,                      // mode = 0 for addition mode = 1 for subtraction
    output [width-1:0] sum,         // output is width - 1 as carry has separate flag
    output cout                     // carry generated
);

wire [width:0]carry;                //carry is width + 1 bits wide as it includes cin
assign carry[0] = cin;

wire [width-1:0]b_inverse;
assign b_inverse = b ^ {width{cin}}; //{width{cin}} produces width bits of cin, hence every bit of b is XORed with cin

genvar i;
generate
    for(i = 0; i < width; i = i + 1) begin: for_loop
        fa my_fa(
            .a (a[i]),
            .b (b_inverse[i]),
            .c (carry[i]),
            .sum (sum[i]),
            .cout(carry[i+1])
        );
    end
endgenerate
assign cout = carry[width];
endmodule