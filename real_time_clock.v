`timescale 1ns / 1ps

module real_time_clock(
output reg [26:0] seconds,
output reg [26:0] minutes,
output reg [24:0] hours,
input clk,
input reset
);

reg [26:0] counter = 59'd0;

//Clock divider

always@(posedge clk or posedge reset)
    begin
    
    if(reset)
    counter <= 0;
    
    else if (counter == 59)
    counter <= 0;
    
    else
    counter <= counter + 1;
    
    end
    
always@(posedge clk or posedge reset)
    begin
    if(reset)
    begin
    seconds <= 0;
    minutes <= 0;
    hours <= 0;
    end
    else if(counter == 59)
        begin
            if (seconds == 59)
            begin
                seconds <= 0;
                
                    if (minutes == 59)
                    begin
                    minutes <= 0;
                    
                        if (hours == 23)
                        hours <= 0;
                        
                        else
                        hours <= hours + 1;
                    end
                    
                    else
                    minutes <= minutes + 1;
            end
            
            else
            seconds <= seconds + 1;
        end
    end
endmodule