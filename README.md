# NodeMCU ESP8266 Chip with TCP Client Server With Nodejs

Requerment

Create a TCP Server in Nodemcu module communicate with nodejs

1.UPload the lua files to nodemcu using  `lua uploader` (windows) and update the wifi username password and host ip address
2.Create a nodejs server


Resources

`Documents` https://nodemcu.readthedocs.io

`Lua uploader` link https://github.com/JeffCost/ESP8266_Lua_Uploader/blob/master/LuaUploader-Win.zip

`Firmware` lua support https://github.com/nodemcu/nodemcu-firmware/releases/download/0.9.5_20150318/nodemcu_float_0.9.5_20150318.bin

`Hardware` Nodemcu Lolin & Amica  -> Chip -> EPS8266

Youtube links

https://www.youtube.com/watch?v=Af9UCSM0Ic8

https://www.youtube.com/watch?v=VvnJn91Av14


Lesson Learn

1. There are no way to easy way communicate method to connect TCP server from front end (React js/ Angularjs or any other web applicaiton)
2. If you want to connect to TCP server (telnet) from web browser
    - Create a nodejs server and communicate throught it
3. When you are using react-native you can create a nodejs sever in android (Not easy to setup the env :( )
    - https://github.com/janeasystems/nodejs-mobile-react-native
    - https://code.janeasystems.com/nodejs-mobile