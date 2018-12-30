local module={}
PORT = 8000
HOST = "192.168.15.5"
gpio.mode(ledPin,gpio.OUTPUT)

function module.setup()
    srv = net.createServer(net.TCP, 30)
    srv:on("receive", function(sck, c) print('print 1:',c) end)
    -- Wait for connection before sending.
    srv:on("connection", function(sck, c)
        sck:send('hello from NODEMCU client')
    end)
    srv:connect(PORT, HOST)    
    srv:send('second hello from TCP nodemcu client')
end

return module
