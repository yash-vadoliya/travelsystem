const queries = require('../queries');
const runQuery = require('./controller_head');

const promotionsController = async (req, res) => {
    try {
        let result;
        let promotion_id = req.params.id;
        let { promotion_title, promo_type, discount_value, max_discount, start_date, end_date, max_allowed, per_user_limit, status, promo_code, adduid } = req.body;
        const userId = req.user.user_id;

        switch (req.method) {
            case "GET":
                if (promotion_id) {
                    result = await runQuery(queries.getPromotionsByID, [promotion_id]);
                } else {
                    result = await runQuery(queries.getAllPromotions);
                }
                break;
            case "POST":
                result = await runQuery(queries.addPromotions, [promotion_title, promo_type, discount_value, max_discount, start_date, end_date, max_allowed, per_user_limit, status, promo_code, adduid ]);
                break;
            case "PUT":
                result = await runQuery(queries.updatePromotions, [promotion_title, promo_type, discount_value, max_discount, start_date, end_date, max_allowed, per_user_limit, status, promo_code, adduid ,promotion_id]);
                break;
            case "DELETE":
                result = await runQuery(queries.deletePromotions, [userId, promotion_id]);
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

module.exports = promotionsController;