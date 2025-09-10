const queries = require('../queries');
const runQuery = require('./controller_head');

const generalSettingController = async (req, res) => {
    try {
        let result;
        let id = req.params.id;
        let {  client_name, support_email, brand_logo, favicon, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (id) {
                    result = await runQuery(queries.getGeneralSettingByID, [id]);
                } else {
                    result = await runQuery(queries.getAllGeneralSetting);
                }
                break;
            case "POST":
                result = await runQuery(queries.addGeneralSetting, [ client_name, support_email, brand_logo, favicon, adduid ]);
                break;
            case "PUT":
                result = await runQuery(queries.updateGeneralSetting, [ client_name, support_email, brand_logo, favicon, adduid ]);
                break;
            case "DELETE":
                result = await runQuery(queries.deleteGeneralSetting, [userId, id]);
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

module.exports = generalSettingController;