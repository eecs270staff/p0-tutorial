// Top-Level design module
// File Name: Majority.v
module Majority (
    input  a, b, c,
    output m
);
    wire ab, ac, bc;
    and a1(ab, a, b);
    and a2(ac, a, c);
    and a3(bc, b, c);
    or  o1(m, ab, ac, bc);
endmodule
