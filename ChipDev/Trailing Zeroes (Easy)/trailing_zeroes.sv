/* https://chipdev.io/question/12
Prompt

Find the number of trailing 0s in the binary representation of the input (din). 
If the input value is all 0s, the number of trailing 0s is the data width (DATA_WIDTH)

Input and Output Signals

    din - Input value
    dout - Number of trailing 0s
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

  always_comb begin
    
    for(int i = 0; i < DATA_WIDTH; i++) begin
      if(din == 0)
        dout = DATA_WIDTH;
      else if(din[i] == 1'b1) begin
        dout = i;
        break;
      end
    end
    
  end

endmodule

/* ALTERNATIVE SOLUTION
  always_comb begin
    logic [$clog2(DATA_WIDTH):0] num_zeros = 0;
      dout = DATA_WIDTH;
      for(int i = 0; i < DATA_WIDTH; i++)
        if(~din[i])
          num_zeros += 1;
        else begin
          dout = num_zeros;
          break;
        end
  end

endmodule
*/
