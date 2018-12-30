// // Server COde

// const net = require('net');
// const port = 8000;
// const server = net.createServer((socket) => {
//   // 'connection' listener
// 	console.log('client connected');
// 	socket.write('Welcome to the wonder server\r\n');

// 	socket.on('end', () => {
// 		console.log('client disconnected');
// 		socket.end('Goodbye!\n');
// 	});

// 	socket.on('data', (data) => {
// 		console.log('client data',data.toString());
// 		setInterval(() => {
// 			console.log('shit time out');
// 			socket.write('fuck form server\r\n', new Date());
// 		}, 30000);
// 	});

// });

// server.on('error', (err) => {
// 	console.log('err',err);
//   throw err;
// });
 
// server.listen(port, () => {
//   console.log('server bound', port);
// });

// Clinet code
const net = require('net');
const client = net.createConnection(8000,'192.168.15.137', () => {
  // 'connect' listener
  console.log('connected to server!');
  client.write('world!\r\n');
});
client.on('data', (data) => {
  console.log(data.toString());
  client.end();
});
client.on('end', () => {
  console.log('disconnected from server');
});
