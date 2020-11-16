// import modules
const express = require("express");
const path = require("path")
const mysql = require("mysql");
const dotenv = require("dotenv");
const cookieParser = require("cookie-parser");

dotenv.config({ path: './.env'});

const app = express();

const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
});

const publicDirectory = path.join(__dirname, './public');
app.use(express.static(publicDirectory));

// parse URL encoded bodies (as sent by HTML forms)
app.use(express.urlencoded({ extended: false }));
// parse JSON bodies (as sent by API clients)
app.use(express.json());
app.use(cookieParser());

app.set('view engine', 'ejs');

db.connect( (error) => {
    if (error) {
        console.log(error);
    } else {
        console.log("MySQL Connected..")
    }
})

// define routes
app.use('/', require('./routes/pages'));
app.use('/auth', require('./routes/auth'));
app.use('/home', require('./routes/home'));
app.use('/books', require('./routes/book'));
app.use('/categories', require('./routes/category'));
app.use('/members', require('./routes/member'));

app.listen(3001, () => {
    console.log("Server start on port 3001");
});