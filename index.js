require ('dotenv').config();
const express = require("express");
const cors =  require("cors");
const session = require('express-session');

const route = require('./routes/index_route');
// const loginRoute = require('./routes/login_route');
const PORT = process.env.PORT;

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
app.use(session({
    secret: process.env.session_secret,
    resave: false,
    saveUninitialized: true,
    cookie: { secure:false } //Set 'True' if using HTTPS 
}))

app.get('/', (req,res) => {
    res.send("Travel Api is Live");
})

app.use('/', route);
// app.use('/', loginRoute);

app.listen(PORT, () => {
    console.log(`Server is Listen on Port: ${PORT}`);
})