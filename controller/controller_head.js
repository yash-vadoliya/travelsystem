const con = require('../dbconfig');
// const queries = require('../queries');

async  function runQuery (queries, params = []) {
    try{
        const result =  await con.query(queries, params);
        return { success: true, data: result };
    } catch (err) {
        console.error("Database error:", err.message);
        return { success: false, error: err.message };
    }
}

module.exports = runQuery;