require ('dotenv').config();
const mysql = require('mysql2');

var con = mysql.createPool({
    host : process.env.DB_HOST,
    user : process.env.DB_USER,
    password : process.env.DB_PASS,
    database : process.env.DB_NAME,
    // waitForConnection : true,
    // connectionLimit:1000,
    // queueLimit: 0
})

con.query('SELECT 1', (err, result) => {
    if(err) {
        console.log("Error to Connect Database : ", err);
    } else {
        console.log("Database Connect Sucessfully..")
    }
})

module.exports = con.promise();