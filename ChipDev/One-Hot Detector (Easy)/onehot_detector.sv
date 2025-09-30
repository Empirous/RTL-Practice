/* https://chipdev.io/question/13
Prompt

One-hot values have a single bit that is a 1 with all other bits being 0. 
Output a 1 if the input (din) is a one-hot value, and output a 0 otherwise.

Input and Output Signals

    din - Input value
    onehot - 1 if the input is a one-hot value and 0 otherwise
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
    
  assign onehot = (din == 0) ? 0 : (din & din-1) == 0; //bit trick, property of one-hot values
  
endmodule
