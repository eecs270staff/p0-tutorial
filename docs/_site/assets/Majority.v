// File Name: Majority.v
// 2-out-of-3 majority function
module Majority
(
  input a, b, c,
  output m
); 
	assign m = a && b || a && c || b && c;
endmodule // Majority