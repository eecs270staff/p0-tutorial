// File Name: TestBench0.v
`timescale 1 ns/1 ns
module TestBench0();
    reg  [2:0] SW;
    wire [0:0] LEDG;

    Majority M(.a(SW[2]), .b(SW[1]), .c(SW[0]), .m(LEDG[0]));

    initial begin
        $dumpvars(0, TestBench0);
        SW = 3'b000; #5;
        SW = 3'b001; #5;
        SW = 3'b010; #5;
        SW = 3'b011; #5;
        SW = 3'b100; #5;
        SW = 3'b101; #5;
        SW = 3'b110; #5;
        SW = 3'b111; #5;
    end
endmodule