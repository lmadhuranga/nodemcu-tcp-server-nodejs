// Clinet code
const net = require('net');
const host = '192.168.15.137';
const port = 8000;

const client = net.createConnection(port, host, () => {
  // Initial handshake message send to server
  console.log('connected to server!');
  client.write('hello from client!');
});

// Trigger when server send data to clients
client.on('data', (data) => {
  console.log(data.toString());
  // client.end();
});

// Trigger when disconnected from server
client.on('end', () => {
  console.log('discosnnected from server');
});
