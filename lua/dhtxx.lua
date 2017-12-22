dhtxx_pin = 5
dhtxx_timer = 1
tmr.alarm(1, 5000, tmr.ALARM_AUTO, function ()
             local status, temp, humi, temp_dec, humi_dec = dht.read(dhtxx_pin)
             print("----------------------------------------")
             if status == dht.OK then
                print("Temp: "..temp)
                print("Temp dec: "..temp_dec)
                print("Humidity: "..humi)
                print("Humidity dec: "..humi_dec)
             elseif status == dht.ERROR_CHECKSUM then
                print("Checksum error.")
             elseif status == dht.ERROR_TIMEOUT then
                print("Timeout.")
             end
             print("----------------------------------------")
end)

