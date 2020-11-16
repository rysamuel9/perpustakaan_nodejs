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
    let sql = "SELECT * FROM categories";
    let query = db.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('sites/category/index', {
            title: "Daftar Kategori",
            categories : rows
        });
    });
});

router.get('/create', (req, res) => {
    res.render('sites/category/create', {
        title: "Tambah Kategori"
    });
});

router.post('/save', (req, res) => {
    let data = {name: req.body.name,
                subcategory: req.body.subcategory};
    let sql = "INSERT INTO categories SET ?";
    let query = db.query(sql, data, (err, results) => {
        if(err) throw err;
        res.redirect("/categories/");
    });
});

router.get('/edit/:id',(req, res) => {
    const id = req.params.id;
    let sql = `SELECT * FROM categories WHERE id = ${id}`;
    let query = db.query(sql,(err, result) => {
        if(err) throw err;
        res.render('sites/category/update', {
            title : "Update Kategori",
            category : result[0]
        });
    });
});

router.post('/update',(req, res) => {
    const id = req.body.id;
    let sql = "UPDATE categories SET name='"+req.body.name+"',subcategory='"+req.body.subcategory
                +"' where id ="+id;
    let query = db.query(sql,(err, results) => {
      if(err) throw err;
      res.redirect('/categories/');
    });
});

router.get('/delete/:id',(req, res) => {
    const id = req.params.id;
    let sql = `DELETE FROM categories WHERE id = ${id}`;
    let query = db.query(sql,(err, results) => {
        if(err) throw err;
        res.redirect('/categories/');
    });
});

module.exports = router;