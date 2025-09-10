const queries = require('../queries');
const runQuery = require('./controller_head');

const fareController = async (req, res) => {
    try {
        let result;
        let fare_id = req.params.id;
        let { fare_type, fare_per_stop, base_fare, fare_per_KM, status, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (fare_id) {
                    result = await runQuery(queries.getFareByID, [fare_id]);
                } else {
                    result = await runQuery(queries.getAllFare);
                }
                break;
            case "POST":
                result = await runQuery(queries.addFare, [fare_type, fare_per_stop, base_fare, fare_per_KM, status, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateFare, [fare_type, fare_per_stop, base_fare, fare_per_KM, status, adduid]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteFare, [userId, fare_id]);
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

module.exports = fareController;