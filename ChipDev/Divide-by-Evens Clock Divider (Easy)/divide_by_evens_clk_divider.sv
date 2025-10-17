/* https://chipdev.io/question/20
Prompt

Given an input clock signal, generate three output clock signals with 2x, 4x, and 6x the period of the input clock.

When resetn is active, then all clocks are reset to 0. When resetn becomes inactive again, all clocks should undergo 
their posedge transition and start an entirely new clock period. Specifically this means that if resetn became active 
in the middle of an output clock's period, when resetn becomes inactive the output clock should start an entirely new 
period instead of continuing from where the interrupted period left off.

Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    div2 - Output clock with 2x the period of clk
    div4 - Output clock with 4x the period of clk
    div6 - Output clock with 6x the period of clk

Output signals during reset

    div2 - 0 when resetn is active
    div4 - 0 when resetn is active
    div6 - 0 when resetn is active
*/

module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);

  logic period_2, period_4, period_6;
  integer counter;
  always @(posedge clk) begin

    if(~resetn) begin
      counter <= 0;
      {period_2, period_4, period_6} <= '0;
    end else begin
      counter <= counter + 1;
      period_2 <= ~period_2;
      period_4 <= (counter % 2 == 0) ? ~period_4 : period_4;
      period_6 <= (counter % 3 == 0) ? ~period_6 : period_6;
    end
    
  end

  assign div2 = period_2;
  assign div4 = period_4;
  assign div6 = period_6;

endmodule
