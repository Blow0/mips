`include "../register_file/register_file.v"
module rd_wr_unit (
  input clk, rst,
  input skip, dirty,
  input [2:0] wreg, rreg1, rreg2,
  input [15:0] wd,
  output wire [15:0] rd1, rd2
);

  wire write;

  // Write signal (skip + protection)
  assign write = !skip && !dirty;

  // Register File
  register_file regi_file(.clk(clk), .rst(rst),
                          .write(write),
                          .wreg(wreg), .rreg1(rreg1), .rreg2(rreg2),
                          .wd(wd),
                          .rd1(rd1), .rd2(rd2));
  
endmodule