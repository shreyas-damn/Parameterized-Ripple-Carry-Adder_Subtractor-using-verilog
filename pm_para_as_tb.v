`timescale 1ns/1ps
module p_as_tb();
localparam width = 16;
reg [width-1:0]a_tb, b_tb;
reg cin_tb;
wire [width-1:0]sum_tb;
wire cout_tb;

p_as #(.width(width)) dut(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

integer i;
initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0,p_as_tb);
    cin_tb = 0;
    for(i = 0; i < 5; i = i + 1) begin
        a_tb = $urandom_range(100,1000);
        b_tb = $urandom_range(100,1000);
        #10;
        $display("time = %0t | %d + %d = %d | cout = %b", $time, a_tb, b_tb, sum_tb, cout_tb);
    end

    cin_tb = 1;
    for(i = 0; i < 5; i = i + 1) begin
        a_tb = $urandom_range(100,1000);
        b_tb = $urandom_range(100,1000);
        #10;
        $display("time = %0t | %d - %d = %d | cout = %b", $time, a_tb, b_tb, sum_tb, cout_tb);
    end
    $finish;
end

endmodule