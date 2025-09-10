const queries = require('../queries');
const runQuery = require('./controller_head');

const RoutesController = async (req, res) => {
    try {
        let result;
        let route_id = req.params.id;
        let { route_name, route_start_from, route_end_to, distance_KM, approx_time, is_active, adduid } = req.body;
        const userId = req.user.user.id;

        switch (req.method) {
            case "GET":
                if (route_id) {
                    result = await runQuery(queries.getRouteByID, [route_id]);
                } else {
                    result = await runQuery(queries.getAllRoute);
                }
                break;
            case "POST":
                result = await runQuery(queries.addRoute, [route_name, route_start_from, route_end_to, distance_KM, approx_time, is_active, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateRoute, [route_name, route_start_from, route_end_to, distance_KM, approx_time, is_active, adduid, route_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteRoute, [userId, route_id]);
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

module.exports = RoutesController;