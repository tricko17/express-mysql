const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'toko'
});

db.connect();

let nama = 'Dudung';
let sql = "SELECT * FROM karyawan WHERE nama = ? ";

db.query(sql, nama, (err, result) => {
    if(err) throw err;
    console.log(result);
});

db.end();