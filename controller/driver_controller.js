const queries = require('../queries');
const runQuery = require('./controller_head');

const driverController = async (req, res) => {
    try {
        let result;
        let driver_id = req.params.id;
        let { driver_name, vehicle_id, driver_vehicle_number, driver_licence_number, driving_test, driving_test_verified, driving_test_verified_id, email, phone_number, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, user_wallet_balance, active_status,driving_licence, image_of_licence, document_status, document_verified_status, document_upload_date, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (driver_id) {
                    result = await runQuery(queries.getDriverByID, [driver_id]);
                } else {
                    result = await runQuery(queries.getAllDriver);
                }
                break;
            case "POST":
                result = await runQuery(queries.addDriver, [driver_name, vehicle_id, driver_vehicle_number, driver_licence_number, driving_test, driving_test_verified, driving_test_verified_id, email, phone_number, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, user_wallet_balance, active_status, driving_licence, image_of_licence, document_status, document_verified_status, document_upload_date, adduid]);
                break;
            case "PUT":
                result = await runQuery(queries.updateDriver, [driver_name, vehicle_id, driver_vehicle_number, driver_licence_number, driving_test, driving_test_verified, driving_test_verified_id, email, phone_number, gender, date_of_birth, city, register_city, current_latitude, current_longitude, register_latitude, register_longitude, total_trips, user_wallet_balance, active_status, driving_licence, image_of_licence, document_status, document_verified_status, document_upload_date, adduid, driver_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteDriver, [userId, driver_id]);
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

module.exports = driverController;