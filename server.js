const http = require('http');
const PORT = 8000

const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain'});
    res.end('simple server in javascript / node');
})

server.listen(PORT, () => {
    console.log('Server is running on localhost', PORT);
});