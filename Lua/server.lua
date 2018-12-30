wifi.setmode(wifi.STATION)
wifi.sta.config("wifiUser", "wifiPassword")
local ledPin = 4
local PORT = 8000
gpio.mode(ledPin,gpio.OUTPUT)

function receiver(sck, data)
    print('recever', data)
    sck:close()
end

function socketCaller()
    sv = net.createServer(net.TCP, 30)
    if sv then
        print('Server up and flying')
        sv:listen(PORT, function(conn)
          conn:on("receive", receiver)
          conn:send("hello from server")
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
