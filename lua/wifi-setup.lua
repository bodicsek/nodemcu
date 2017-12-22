config = {}
config.ssid = "ssid"
config.pwd = "password"
config.save = false
config.got_ip_cb = function (got_ip)
   if wifi.sta.getip()== nil then
      print("IP unavailable, ERROR...")
   else
      print("\n====================================")
      print("ESP8266 mode is: " .. wifi.getmode())
      print("MAC address is: " .. wifi.ap.getmac())
      print("IP is "..wifi.sta.getip())
      print("====================================")
   end
end

local 

print("Configuring Wifi ...")
wifi.setmode(wifi.STATION);
wifi.sta.getap(function (aps)
      if aps then
         for key,value in pairs(aps) do
            print("AP " .. key .. " found.")
            if config.ssid == key then
               wifi.sta.config(config)
               print("Connecting to " .. key .. " ...")
            end
         end
      else
         print("Error getting AP list")
      end
end)

