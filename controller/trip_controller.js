const queries = require('../queries');
const runQuery = require('./controller_head');

const tripController = async (req, res) => {
    try {
        let result;
        let trip_id = req.params.id;
        let { trip_name, route_id, customer_id, driver_id, vehicle_id, custmore_phnoe, driver_phone, trip_booked_date, policy_id, promotion_id, trip_date_from, trip_date_to, trip_time_from, trip_time_to, trip_day, trip_fare, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (trip_id) {
                    result = await runQuery(queries.getTripsByID, [trip_id]);
                } else {
                    result = await runQuery(queries.getAllTrips);
                }
                break;
            case "POST":
                result = await runQuery(queries.addTrips, [trip_name,route_id, customer_id, driver_id, vehicle_id, custmore_phnoe, driver_phone, trip_booked_date, policy_id, promotion_id, trip_date_from, trip_date_to, trip_time_from, trip_time_to, trip_day, trip_fare, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateTrips, [trip_name,route_id, customer_id, driver_id, vehicle_id, custmore_phnoe, driver_phone, trip_booked_date, policy_id, promotion_id, trip_date_from, trip_date_to, trip_time_from, trip_time_to, trip_day, trip_fare, adduid,trip_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteTrips, [userId, trip_id]);
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

module.exports = tripController;