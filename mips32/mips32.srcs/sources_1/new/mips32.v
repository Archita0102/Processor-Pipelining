`timescale 1ns / 1ps

module mips32(rddata1,rddata2,wrdata,sr1,sr2,dr,write,reset,clk);
    input clk,write,reset;
    input [4:0] sr1,sr2,dr;   //source and destination register
    input [31:0] wrdata;
    output [31:0]rddata1,rddata2;
    integer k;
    reg [31:0]regfile[0:31];
    
    assign rddata1=regfile[sr1];
    assign rddata2=regfile[sr2];
    
    always@(posedge clk)begin
        if(reset) begin
            for(k=0;k<32;k=k+1)begin
                regfile[k]<=0;
            end
        end
        else begin
            if(write)begin
                regfile[dr]<=wrdata;
            end
        end
            
    end
endmodule
