const queries = require('../queries');
const runQuery = require('./controller_head');
const upload = require('../middleware/multer');

const vehiclesController = async (req, res) => {
    try {
        let result;
        let vehicles_id = req.params.id;
        let {vehicles_type, brand, model_name, vehicles_number, vehicles_register_date, vehicles_condition, number_of_seats, number_of_doors, total_rows, total_columns, passenger_capacity, status, adduid} = req.body;
        let vehicle_image = req.file ? req.file.path : null;


        switch (req.method) {
            case "GET":
                if (vehicles_id) {
                    result = await runQuery(queries.getVehicleByID, [vehicles_id]);
                } else {
                    result = await runQuery(queries.getAllVehicle);
                }
                break;

            case "POST":
                vehicle_image = req.file ? req.file.path : null;
                result = await runQuery(queries.addVehicle, [vehicles_type, brand, model_name, vehicles_number, vehicles_register_date, vehicles_condition, number_of_seats, number_of_doors, total_rows, total_columns, passenger_capacity, status, adduid]);
                break;

            case "PUT":
                vehicle_image = req.file ? req.file.path : null;
                result = await runQuery(queries.updateVehicle, [vehicles_type, brand, model_name, vehicles_number, vehicles_register_date, vehicles_condition, number_of_seats, number_of_doors, total_rows, total_columns, passenger_capacity, status, adduid,vehicles_id]);
                break;

            case "DELETE":
                result = await runQuery(queries.deleteVehicle, [vehicles_id]);
                break;

            default:
                return res.status(405).json({ error: "Method Not Allowed" });
        }

        // Send success/error response in short form
        result.success
            ? res.json(result.data)
            : res.status(500).json({ error: result.error || "Query failed" });

    } catch (err) {
        console.error("Controller error:", err);
        res.status(500).json({ error: err.message });
    }
};

module.exports = vehiclesController;
