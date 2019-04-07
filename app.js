const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'toko'
});

db.connect();

app.get('/', (req,res) => {
    res.send({
        message: "Hello World"
    })
});

app.get('/karyawan', (req,res) => {
    let sql = "SELECT * FROM karyawan";
    db.query(sql, (err, result) => {
        if (err){
            res.send({
                message: "error",
                result: []
            });
        }
        res.send({
            message: "success",
            result: result
        });
    });
});

app.get('/karyawan/:no', (req,res) => {
    let sql = "SELECT * FROM karyawan WHERE no=?";
    let no = req.params.no;
    db.query(sql, no, (err, result) => {
        if (err){
            res.send({
                message: "error",
                result: []
            });
        }
        res.send({
            message: "success",
            result: result
        });
    });
});

// Penggunaan Query
app.get('/query', (req,res) => {
    // declarasi variable limit, untuk limitasi penarikan data dari table
    let limit = 1000;

    // deklarasi array variable untuk dynamic binding
    let args = new Array();

    // deklarasi query
    let sql = "SELECT * FROM karyawan "; 
    
    // jika ada query "kota" didalam request
    if(req.query.kota){
        // tambahkan WHERE clause pada sql 
        sql += "WHERE kota=? "
        // push isi dari query "kota" ke dalam array
        args.push(req.query.kota);
    }
    
    // jika ada query "limit" didalam request
    if(req.query.limit){
        // ubah limit sesuai query "limit"
        limit = parseInt(req.query.limit)
    }
    // push isi dari query "limit" ke dalam array
    args.push(limit);
    // tambahkan sql untuk limit
    sql += "LIMIT ?";

    db.query(sql, args, (err, result) => {
        if (err){
            console.log(err);
            res.send({
                message: "error",
                result: []
            });
        }
        res.send({
            message: "success",
            result: result
        });
    });
});

app.post('/karyawan', (req,res) => {
    let sql = "INSERT INTO karyawan SET ?";
    db.query(sql, req.body, (err, result) => {
        if (err){
            console.log(err);
            res.send({
                message: "error",
                result: []
            });
        }
        res.send({
            message: "success",
            result: result
        });
    });
});

app.delete('/karyawan/:no', (req,res) => {

});

app.put('/karyawan/:no', (req,res) => {

});



app.listen(3000, ()=> {
    console.log("Server Listening On Port 3000");
});