`timescale 1ns / 1ps

module rtc_tb;

reg clk;
reg reset;
wire [5:0] seconds;
wire [5:0] minutes;
wire [4:0] hours;

real_time_clock uut(
.clk(clk),
.reset(reset),
.seconds(seconds),
.minutes(minutes),
.hours(hours)
);

always #5 clk = ~clk;

initial begin
    $monitor("TIME = %0t | RESET = %b | HOURS = %05b | MINUTES = %06b | SECONDS = %06b",
              $time, reset, hours, minutes, seconds);
end
initial
begin
clk = 0;
reset = 1;
#50000;
reset = 0;
#100000000000;
$finish;
end
endmodule
