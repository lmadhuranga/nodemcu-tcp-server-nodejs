wifi.setmode(wifi.STATION)
wifi.sta.config("mad-host", "madhost1")
ledPin = 4
gpio.mode(ledPin,gpio.OUTPUT)

function socketCaller()
    print("socker caller init")
    srv = net.createServer(net.TCP, 30)
    srv:on("receive", function(sck, c) print('print 1:',c) end)
    -- Wait for connection before sending.
    srv:on("connection", function(sck, c)
        sck:send('dddd')
    end)
    srv:connect("8000","192.168.15.5")    
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
