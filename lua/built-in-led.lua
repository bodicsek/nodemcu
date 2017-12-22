pin = 0
gpio.mode(pin, gpio.OUTPUT)
lighton=0
tmr.alarm(0,1000,1,function()
if lighton==0 then
    lighton=1
    gpio.write(pin, gpio.LOW)
else
    lighton=0
    gpio.write(pin, gpio.HIGH)
end
end)