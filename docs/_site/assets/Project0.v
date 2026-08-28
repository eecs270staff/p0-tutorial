// File Name: Project0.v
module Project0
(
    input  [2:0] SW,    // a, b, c
    output [0:0] LEDG   // m
);
    Majority M(.m(LEDG[0]), .b(SW[2]), .a(SW[1]), .c(SW[0]));
endmodule