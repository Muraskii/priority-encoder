// 8‑to‑3 Priority Encoder with valid output
//
// This module implements a simple priority encoder where eight input lines
// are scanned from highest to lowest priority.  The highest numbered
// asserted input determines the three‑bit output code and sets the
// `valid` flag.  When no inputs are high the `code` output is
// undefined and `valid` is deasserted.

module priority_encoder8 (
    input  wire [7:0] in,
    output reg  [2:0] code,
    output reg        valid
);
    always @* begin
        casex (in)
            8'b1???_????: begin code = 3'b111; valid = 1'b1; end // I7
            8'b01??_????: begin code = 3'b110; valid = 1'b1; end // I6
            8'b001?_????: begin code = 3'b101; valid = 1'b1; end // I5
            8'b0001_????: begin code = 3'b100; valid = 1'b1; end // I4
            8'b0000_1???: begin code = 3'b011; valid = 1'b1; end // I3
            8'b0000_01??: begin code = 3'b010; valid = 1'b1; end // I2
            8'b0000_001?: begin code = 3'b001; valid = 1'b1; end // I1
            8'b0000_0001: begin code = 3'b000; valid = 1'b1; end // I0
            default: begin code = 3'bxxx; valid = 1'b0; end       // No inputs
        endcase
    end
endmodule