const queries = require('../queries');
const runQuery = require('./controller_head');

const userController = async (req, res) => {
    try {
        let result;
        let user_id = req.params.id;
        let { user_name, password, user_role, user_email, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (user_id) {
                    result = await runQuery(queries.getUsersByID, [user_id]);
                } else {
                    result = await runQuery(queries.getAllUser);
                }
                break;
            case "POST":
                result = await runQuery(queries.addUsers, [user_name, password, user_role, user_email, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateUsers, [user_name, password, user_role, user_email, adduid, user_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteUsers, [userId, user_id]);
                break;
            default:
                return res.status(405).json({ error: "Method Not Allowed" });
        }
        result.success
            ? res.json(result.data)
            : res.status(500).json({ error: result.error || "Query failed" });

    } catch (err) {
        console.error("Controller error:", err);
        res.status(500).json({ error: err.message });
    }
};

module.exports = userController;