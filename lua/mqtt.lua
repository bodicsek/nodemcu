dhtxx_pin = 5

wifi_config = {}
wifi_config.ssid = "bodicsek"
wifi_config.pwd = "ble/acon"
wifi_config.save = false
wifi_config.got_ip_cb = function (got_ip)
   if wifi.sta.getip()== nil then
      print("IP unavailable, ERROR...")
   else
      print("\n====================================")
      print("ESP8266 mode is: " .. wifi.getmode())
      print("MAC address is: " .. wifi.ap.getmac())
      print("IP is "..wifi.sta.getip())
      print("====================================")

      m = mqtt.Client(node.chipid(), 120)
      m:connect("192.168.0.12", 1883, 0, function (client)
                   print("Connected to MQTT broker.")
                   tmr.alarm(1, 5000, tmr.ALARM_AUTO, function ()
                                local status, temp, humi, temp_dec, humi_dec = dht.read(dhtxx_pin)
                                if status == dht.OK then
                                   client:publish("sensors/temperature/"..node.chipid(), temp, 0, 0, function (c) end)
                                   client:publish("sensors/humidity/"..node.chipid(), humi, 0, 0, function (c) end)
                                end
                   end)
      end)
   end
end

wifi.setmode(wifi.STATION)
wifi.sta.config(wifi_config)
