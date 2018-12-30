wifi.setmode(wifi.STATION)
-- Change the wifi user name passwrod
wifi.sta.config("wifiuser", "password")
local ledPin = 4
local HOST = 8000
local PORT = "192.168.15.5"
gpio.mode(ledPin,gpio.OUTPUT)

function socketCaller()
    srv = net.createServer(net.TCP, 30)
    srv:on("receive", function(sck, c) print('print 1:',c) end)
    -- Wait for connection before sending.
    srv:on("connection", function(sck, c)
        sck:send('hello from NODEMCU client')
    end)
    srv:connect(PORT, HOST)    
    srv:send('adition caller')
end

function configWifi()
    if wifi.sta.getip() == nil then
        print("IP unavailable, Waiting...")
    else
        tmr.stop(1)
        print("Connected To wifi, IP is "..wifi.sta.getip())
        gpio.write(ledPin, 0)

        tmr.alarm(2, 1000, 0, socketCaller)
    end
end

tmr.alarm(1, 2000, 1, configWifi)
