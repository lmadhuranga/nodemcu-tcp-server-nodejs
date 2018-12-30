local module={}
PORT = 8000
tiker=0;
function receiver(sck, data)
    print('recever :', data)
    -- sck:close()
    sender(sck)
end
function sender(sck)
    print('sender called')
    tmr.alarm(2, 1000, 1, function()
        tiker=tiker+1 
        msg='tick titke min ->' ..tiker
        print(msg)
        sck:send(msg)
        -- Disconnecto the service after 30 second
        if(tiker>30) then 
            tmr.stop(2) 
            sck:close()
        end
    end)
end
function module.setup()
    print('Server is setingup')
    sv = net.createServer(net.TCP, 30)
    if sv then
        print('Server up and Runinng..')
        sv:listen(PORT, function(conn)
            conn:on("receive", receiver)
            conn:send("hello from server")
        end)
    end
end

return module