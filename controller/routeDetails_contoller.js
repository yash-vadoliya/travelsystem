const queries = require('../queries');
const runQuery = require('./controller_head');

const RouteDetailsController = async (req, res) => {
    try {
        let result;
        let id = req.params.id;
        let { route_id, stop_id, stop_sequence, distance_from_start, approx_time_from_start, adduid } = req.body;
        const userId = req.user.user.id;

        switch (req.method) {
            case "GET":
                if (id) {
                    result = await runQuery(queries.getRouteByID, [id]);
                } else {
                    result = await runQuery(queries.getAllRoute);
                }
                break;
            case "POST":
                result = await runQuery(queries.addRoute, [route_id, stop_id, stop_sequence, distance_from_start, approx_time_from_start, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateRoute, [route_id, stop_id, stop_sequence, distance_from_start, approx_time_from_start, adduid, id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteRoute, [userId, id]);
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

module.exports = RouteDetailsController;