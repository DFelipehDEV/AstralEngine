const net = require('net');

let players = [];

const PlayerMessages = {
    CONNECTED: 1,
    MOVE: 2,
};

function broadcastNewPlayer(playerID) {
    let buffer = Buffer.alloc(3);
    buffer.writeUInt8(3, 0);  // Message type 3: New player
    buffer.writeUInt16BE(playerID, 1);
    console.log(buffer);
    broadcast(buffer);
}

function broadcastSync(playerID) {
    let player = players[playerID];
    let buffer = Buffer.alloc(9);
    buffer.writeUInt8(2, 0);  // Message type 2: Syncing
    buffer.writeUInt16BE(player.x, 1);
    buffer.writeUInt16BE(player.y, 3);
    buffer.writeUInt16BE(playerID, 5);
    console.log('Broadcasting buffer:', buffer);
    broadcast(buffer, playerID);
}

function broadcast(buffer, excludeID = null) {
    for (let id in players) {
        if (id != excludeID) {
            players[id].socket.write(buffer);
        }
    }
}

const server = net.createServer((socket) => {
    console.log('New player connected');

    let playerID = players.length;
    players.push({
        x: 0,
        y: 0,
        socket: socket
    });

    console.log(`Player ${playerID} connected!`);

    // Send player ID to the connected player
    let buffer = Buffer.alloc(3);
    buffer.writeUInt8(PlayerMessages.CONNECTED, 0);  // Message type 1: Connected
    buffer.writeUInt16BE(playerID, 1);  // Write player ID
    socket.write(buffer);

    broadcastNewPlayer(playerID);

    socket.on('data', (data) => {
        let type = data.readUInt8(1);
        console.log(`Recieved ${type} from`);
        console.log(data);

        if (type === PlayerMessages.MOVE) {
            // Syncing player position
            let x = data.readUInt16BE(2);
            let y = data.readUInt16BE(4);

            players[playerID].x = x;
            players[playerID].y = y;

            // Syncing to all other players
            broadcastSync(playerID);
        }
    });

    socket.on('end', () => {
        console.log(`Player ${playerID} disconnected`);
        delete players[playerID];
    });
})
.listen(39083, '127.0.0.1', () => {
    console.log('Server is running on tcp://127.0.0.1:39083');
});
