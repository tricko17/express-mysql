const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'toko'
});

db.connect();

// CREATE
let data = { nama: "Dedi", usia: 23 };
let sql = "INSERT INTO karyawan SET ?";
db.query(sql, data, (err, result) => {
    if(err) throw err;
    console.log("Insert Data");
    console.log(result);
});
console.log("-------------------------------------------------");
// READ
sql = "SELECT * FROM karyawan";
db.query(sql, (err, result) => {
    if(err) throw err;
    console.log("Read Data")
    console.log(result);
});

// DELETE
let id = 3;
sql = "DELETE FROM karyawan WHERE No=?";
db.query(sql,id, (err, result) => {
    if(err) throw err;
    console.log("Delete Data");
    console.log(result);
});

// Update
id = 4;
let nama = "Andi";
sql = "UPDATE karyawan SET nama=? WHERE No=?";
db.query(sql,[nama,id], (err, result) => {
    if(err) throw err;
    console.log("Update Data");
    console.log(result);
});
db.end();