const express = require('express');
const mysql = require("mysql");
const router = express.Router();

const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
});

router.get('/', (req, res) => {
    let sql = "SELECT * FROM members";
    let query = db.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('sites/member/index', {
            title: "Daftar Anggota",
            members : rows
        });
    });
});

router.get('/create', (req, res) => {
    res.render('sites/member/create', {
        title: "Tambah Anggota"
    });
});

router.post('/save', (req, res) => {
    let data = {name: req.body.name,
                email: req.body.email,
                book_id: req.body.book_id,
                borrow_duration: req.body.borrow_duration};
    let sql = "INSERT INTO members SET ?";
    let query = db.query(sql, data, (err, results) => {
        if(err) throw err;
        res.redirect("/members/");
    });
});

router.get('/edit/:id',(req, res) => {
    const id = req.params.id;
    let sql = `SELECT * FROM members WHERE id = ${id}`;
    let query = db.query(sql,(err, result) => {
        if(err) throw err;
        res.render('sites/member/update', {
            title : "Update Anggota",
            member : result[0]
        });
    });
});

router.post('/update',(req, res) => {
    const id = req.body.id;
    let sql = "UPDATE members SET name='"+req.body.name+"',email='"+req.body.email
                +"',book_id='"+req.body.book_id+"',borrow_duration='"+req.body.borrow_duration
                +"' where id ="+id;
    let query = db.query(sql,(err, results) => {
      if(err) throw err;
      res.redirect('/members/');
    });
});

router.get('/delete/:id',(req, res) => {
    const id = req.params.id;
    let sql = `DELETE FROM members WHERE id = ${id}`;
    let query = db.query(sql,(err, results) => {
        if(err) throw err;
        res.redirect('/members/');
    });
});

module.exports = router;