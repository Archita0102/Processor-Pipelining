`timescale 1ns / 1ps

module tb();

    reg clk,write,reset;
    reg [4:0] sr1,sr2,dr;   //source and destination register
    reg [31:0] wrdata;
    wire [31:0]rddata1,rddata2;
    integer k;
    
    mips32 dut(rddata1,rddata2,wrdata,sr1,sr2,dr,write,reset,clk);
    
    initial clk=0;
    
    always #5 clk=~clk;
    
    initial begin
        #1 reset=1;write=0;
        #5 reset=0;
    end
    
    
    initial begin
        #7 for(k=0;k<32;k=k+1)begin
            dr=k;
            wrdata=10*k;
            write=1;
            #10 write=0;
        end
        
        #20 for(k=0;k<32;k=k+1)begin
            sr1=k;
            sr2=k+1;
            #5;
            $display("reg[%2d]=%d , reg[%2d]=%d",sr1,rddata1,sr2,rddata2);
        end
        #2000;
        $finish();
    end
endmodule
