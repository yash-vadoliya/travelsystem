const queries = require('../queries');
const runQuery = require('./controller_head');

const deleteAccountRequestsController = async (req, res) => {
    try {
        let result;
        let request_id = req.params.id;
        let {  user_id, driver_id, reason_to_delete_account, feedback, status, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (request_id) {
                    result = await runQuery(queries.getDeleteAccountRequestsByID, [request_id]);
                } else {
                    result = await runQuery(queries.getAllDeleteAccountRequests);
                }
                break;
            case "POST":
                result = await runQuery(queries.addDeleteAccountRequests, [user_id, driver_id, reason_to_delete_account, feedback, status, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateDeleteAccountRequests, [user_id, driver_id, reason_to_delete_account, feedback, status, adduid, request_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteDeleteAccountRequests, [userId, request_id]);
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

module.exports = deleteAccountRequestsController;