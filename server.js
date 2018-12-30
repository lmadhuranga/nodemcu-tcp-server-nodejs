// Server
const net = require('net');
const PORT = 8000;
const server = net.createServer((socket) => {
  // 'connection' listener
  console.log('client connected');
  socket.on('end', () => {
    console.log('client disconnected');
  });
  socket.write('hello from nodejs TCP server\r\n');
//   socket.pipe(c);
});
server.on('error', (err) => {
  throw err;
});
server.listen(PORT, () => {
  console.log(`Server Up and runing in ${PORT}`);
});