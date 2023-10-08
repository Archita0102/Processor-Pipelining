`timescale 1ns / 1ps

module tb();

    parameter N=10;
    wire [N-1:0] F;
    reg [N-1:0]A,B,C,D;
    reg clk;
    
    pipeline1 dut(F,A,B,C,D,clk);
    
    initial clk=0;
    
    always #5 clk=~clk;
    
    initial begin
        #5 A=10;B=12;C=6;D=3; // F=75
        #20 A=10;B=10;C=5;D=3; // F=66
        #20 A=20;B=11;C=1;D=4; // F=112
        #20 A=15;B=10;C=8;D=2; // F=62
        #20 A=8;B=15;C=5;D=0; // F=0
    end
    
    initial begin
        $monitor("Time : %d  F=%d",$time,F);
        #300;
        $finish();
    end
endmodule
