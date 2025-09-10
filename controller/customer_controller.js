const queries = require('../queries');
const runQuery = require('./controller_head');

const CustomerController = async (req, res) => {
    try {
        let result;
        let customer_id = req.params.id;
        let { customer_name, email, phone_number, verified_status, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, active_status, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (customer_id) {
                    result = await runQuery(queries.getCustomerByID, [customer_id]);
                } else {
                    result = await runQuery(queries.getAllCustomer);
                }
                break;
            case "POST":
                result = await runQuery(queries.addCustomer, [customer_name, email, phone_number, verified_status, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, active_status, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateCustomer, [customer_name, email, phone_number, verified_status, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, active_status, adduid,customer_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteCustomer, [userId, customer_id]);
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

module.exports = CustomerController;