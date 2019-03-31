const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'toko'
});

db.connect();

let sql = "SELECT * FROM karyawan";

db.query(sql, (err, result) => {
    if(err) throw err;
    console.log(result);
});

db.end();