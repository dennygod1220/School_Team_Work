const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'jason',
    database: 'School',
    password: 'jason'
});

module.exports = pool.promise();