// File Name: Project0.v
module Project0
(
  input [2:0] SW,				// a, b, c
  output [0:0] LEDG	// m
);

// Instantiate Majority module
	Majority M(.a(SW[2]), .b(SW[1]), .c(SW[0]), .m(LEDG[0]));
endmodule // Project0