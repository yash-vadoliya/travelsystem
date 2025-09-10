const queries = require('../queries');
const runQuery = require('./controller_head');

const cityController = async (req, res) => {
    try {
        let result;
        let id = req.params.id;
        let {city, state, customer_support_number, driver_support_number, emergency_number, service_type, adduid} = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (id) {
                    result = await runQuery(queries.getCityByID, [id]);
                } else {
                    result = await runQuery(queries.getAllCity);
                }
                break;
            case "POST":
                result = await runQuery(queries.addCity, [ city, state, customer_support_number, driver_support_number, emergency_number, service_type, adduid ]);
                break;
            case "PUT":
                result = await runQuery(queries.updateCity, [ city, state, customer_support_number, driver_support_number, emergency_number, service_type, adduid ]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteCity, [userId, id]);
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

module.exports = cityController;