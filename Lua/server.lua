wifi.setmode(wifi.STATION)
wifi.sta.config("mad-host", "madhost1")
ledPin = 4
gpio.mode(ledPin,gpio.OUTPUT)
function receiver(sck, data)
    print('recever', data)
    sck:close()
end

function socketCaller()
    print("socker caller init")
    sv = net.createServer(net.TCP, 30)
    if sv then
        print('server ok')
        sv:listen(8000, function(conn)
          conn:on("receive", receiver)
          conn:send("hello world")
        end)
    end
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
