module fa(
    input a,b,c,
    output sum,cout
);
assign sum = a ^ b ^ c;
assign cout = (a & b) | (c & (a ^ b) );
endmodule