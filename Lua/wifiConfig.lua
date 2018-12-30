local module={}
ledPin = 4
wifiDetails = {SSID="mad-host", pass="madhost1"}
wifi.setmode(wifi.STATION)
--  please update with your wifi credintial with here
wifi.sta.config(wifiDetails.SSID, wifiDetails.pass)
gpio.mode(ledPin,gpio.OUTPUT)

function module.setup(_callback)    
    tmr.alarm(1, 2000, 1, function ()
        if wifi.sta.getip() == nil then
            print("IP unavailable, Waiting...")
        else
            tmr.stop(1)
            print("Connected To wifi, IP is "..wifi.sta.getip())
            gpio.write(ledPin, 0)
            _callback(wifi.sta.getip())
        end
    end)
end
return module





