// Clinet code
const net = require('net');
const host = '192.168.15.137';
const port = 8000;
const client = net.createConnection(port, host, () => {
  // 'connect' listener
  console.log('connected to server!');
  client.write('hello from client!\r\n');
});
client.on('data', (data) => {
  console.log(data.toString());
  client.end();
});
client.on('end', () => {
  console.log('disconnected from server');
});
