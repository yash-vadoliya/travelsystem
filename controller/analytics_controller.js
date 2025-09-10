const queries = require('../queries');
const runQuery = require('./controller_head');

const analyticsController = async (req, res) => {
    try {
        let result;
        let analytics_id = req.params.id;
        let {  user_id, driver_id, vehicle_id, trip_id, trip_status, route_id, trip_date, trip_time, total_seats, seat_numbers, pickup_point, drop_point, booking_time, amount, promo_code, discounted_fare, payment_method, status, cancellation_reason, refund_amount, refund_percentage, cancel_time, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (analytics_id) {
                    result = await runQuery(queries.getAnalyticsByID, [analytics_id]);
                } else {
                    result = await runQuery(queries.getAllAnalytics);
                }
                break;
            case "POST":
                result = await runQuery(queries.addAnalytics, [user_id, driver_id, vehicle_id, trip_id, trip_status, route_id, trip_date, trip_time, total_seats, seat_numbers, pickup_point, drop_point, booking_time, amount, promo_code, discounted_fare, payment_method, status, cancellation_reason, refund_amount, refund_percentage, cancel_time, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateAnalytics, [user_id, driver_id, vehicle_id, trip_id, trip_status, route_id, trip_date, trip_time, total_seats, seat_numbers, pickup_point, drop_point, booking_time, amount, promo_code, discounted_fare, payment_method, status, cancellation_reason, refund_amount, refund_percentage, cancel_time, adduid, analytics_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteAnalytics, [userId, analytics_id]);
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

module.exports = analyticsController;