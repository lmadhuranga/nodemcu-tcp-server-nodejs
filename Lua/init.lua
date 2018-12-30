wifiConfig = require("wifiConfig")
server = require("tcpServer")

wifiConfig.setup(function(ipaddress)
    print('wifi ok ip',ipaddress)
    server.setup()
end)