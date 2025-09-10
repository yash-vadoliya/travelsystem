const queries = require('../queries');
const runQuery = require('./controller_head');

const RouteStopsContoller = async (req, res) => {
    try {
        let result;
        let stop_id = req.params.id;
        let { stop_name, wait_time, reach_time, is_minor, latitude, longitude, radius_in_meters, route_id,adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (user_id) {
                    result = await runQuery(queries.getStopsByID, [user_id]);
                } else {
                    result = await runQuery(queries.getAllStops);
                }
                break;
            case "POST":
                result = await runQuery(queries.addStops, [stop_name, wait_time, reach_time, is_minor, latitude, longitude, radius_in_meters, route_id,adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateStops, [stop_name, wait_time, reach_time, is_minor, latitude, longitude, radius_in_meters, route_id,adduid, stop_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteStop, [userId, user_id]);
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

module.exports = RouteStopsContoller;