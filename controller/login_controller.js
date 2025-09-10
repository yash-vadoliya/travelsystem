const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const con = require('../dbconfig');
const queries = require('../queries');

exports.loginUser = async (req, res) => {
    try {
        const { user_name, password } = req.body;
        let token;
        console.log("username: ", user_name);
        console.log("password:", password);

        const [users] = await con.query(queries.getUserByUserName, [user_name, password]);
        const user = users[0];

        if (password != user.password) {
            return res.status(400).json({ error: "Invalid Password." });
        }
        try {
            token = jwt.sign(
                { id: user.id, username: user.username },
                process.env.JWT_SECRET,
                { expiresIn: '1h' }
            );
            req.session.token = token;
            console.log("Generated Token:", token); // Log generated token
        } catch (error) {
            console.error("Error generating token:", error);
            return res.status(500).send("Error generating token.");
        }


        return res.send({ token: token, message: "Login successful" });

    }catch (err) {
    console.error("In login Page:", err);
    // return res.status(500).send("An error occurred during login.");
    }
};

exports.logoutUser = async(req,res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error("Error destroying session:", err);
            return res.status(500).send('Failed to log out.');
        }
        else {
            return res.send("Logout Sucessfully..");
        }
    });
}