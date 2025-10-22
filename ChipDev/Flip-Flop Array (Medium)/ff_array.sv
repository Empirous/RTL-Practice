/* https://chipdev.io/question/25
This is a simple RF so it should support only one operation per clock cycle, either a read or write.  
If both rd and wr ports are set to logic level high in a cycle, then error is asserted, and dout is 
set to zero in order to indicate the operation has failed.

Input and Output Signals

    din - Input data port
    addr - Address input to the flip-flop array
    wr - Write-enable input signal
    rd - Read-enable input signal
    clk - Clock signal
    resetn - Synchronous, active-low, reset signal
    dout - Output data port
    error - Error signal - Invalid operation

Output signals during reset

    dout - 0
    error - 0
*/

module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);

    logic [7:0] reg_file [7:0]; 
    logic invalid_op;
    integer RF_idx = addr;
    
    assign invalid_op = wr && rd;

    always_ff @ (posedge clk) begin
        if(~resetn) begin
            {error, dout} <= '0; 
            for(int i=0; i < 8; i++) reg_file[i] <= '0;

        end else begin
            if(wr && ~invalid_op) 
                reg_file[RF_idx] <= din;

            dout <= (rd && ~invalid_op) ? 
                reg_file[RF_idx] : '0;

            error <= invalid_op;
        end 
    end

endmodule
