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
    let sql = "SELECT * FROM books";
    let query = db.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('sites/book/index', {
            title: "Daftar Buku",
            books : rows
        });
    });
});

// router.get('/:id', (req, res) => {
//     const id = req.params.id;
//     let sql = `SELECT * FROM books WHERE id = ${id}`;
//     let query = db.query(sql, (err, result) => {
//         if(err) throw err;
//         res.render('sites/book/findone', {
//             title: "Detail Buku",
//             books : result[0]
//         });
//     });
// });

router.get('/create', (req, res) => {
    res.render('sites/book/create', {
        title: "Tambah Buku"
    });
});

router.post('/save', (req, res) => {
    let data = {isbn: req.body.isbn,
                name: req.body.name,
                category_id: req.body.category_id,
                year: req.body.year,
                author: req.body.author,
                description: req.body.description};
    let sql = "INSERT INTO books SET ?";
    let query = db.query(sql, data, (err, results) => {
        if(err) throw err;
        res.redirect("/books/");
    });
});

router.get('/edit/:id',(req, res) => {
    const id = req.params.id;
    let sql = `SELECT * FROM books WHERE id = ${id}`;
    let query = db.query(sql,(err, result) => {
        if(err) throw err;
        res.render('sites/book/update', {
            title : "Update Buku",
            book : result[0]
        });
    });
});

router.post('/update',(req, res) => {
    const id = req.body.id;
    let sql = "UPDATE books SET isbn='"+req.body.isbn+"',name='"+req.body.name
                +"',  category_id='"+req.body.category_id+"',  year='"+req.body.year
                +"',  author='"+req.body.author+"',  description='"+req.body.description
                +"' where id ="+id;
    let query = db.query(sql,(err, results) => {
      if(err) throw err;
      res.redirect('/books/');
    });
});

router.get('/delete/:id',(req, res) => {
    const id = req.params.id;
    let sql = `DELETE FROM books WHERE id = ${id}`;
    let query = db.query(sql,(err, results) => {
        if(err) throw err;
        res.redirect('/books/');
    });
});

module.exports = router;