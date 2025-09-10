module.exports = {
    //User Table :

    getAllUser: "SELECT * FROM `user`",
    getUserByID: "SELECT * FROM `user` WHERE `user_id` = ? ",
    getUserByUserName: "SELECT * FROM `user` WHERE `user_name` = ? ",
    addUser: "INSERT INTO `user`(`user_name`, `password`, `user_role`, `user_email`,`adduid`) VALUES (?,?,?,?,?,?)",
    // deleteUser : "DELETE FROM `user` WHERE `user_id`=?",
    deleteUser: "UPDATE `user` SET `deleteuid` = ?, `deletedate` = CURDATE(), record_status = 0 WHERE `user_id`=?",

    //Routes Table

    getAllRoute: "SELECT * FROM `routes`",
    getRoutesByID: "SELECT * FROM `routes` WHERE `route_id` = ?",
    addRoute: "INSERT INTO `routes` (`route_name`,`route_start_from`, `route_end_to`, `distance_KM`, `approx_time`, `is_active`,`adduid`) VALUES (?,?,?,?,?,?,?)",
    updateRoute: "UPDATE `routes` SET `route_name`=?,`route_start_from`=?,`route_end_to`=?,`distance_KM`=?,`approx_time`=?,`is_active`=? WHERE `route_id`=?",
    // deleteRoute : "DELETE FROM `routes` WHERE `route_id` = ?", 
    deleteRoute: "UPDATE `routes` SET `deleteuid` = ?, `deletedate` = CURDATE(), record_status = 0 WHERE `route_id`=?",

    //Route Details Table

    getAllRouteDetail: "SELECT * FROM `route_details`",
    getRouteDetailByID: "SELECT * FROM `route_details` WHERE `id`=?",
    addRouteDetails: "INSERT INTO `route_details`(`route_id`, `stop_id`, `stop_sequence`, `distance_from_start`, `approx_time_from_start`,`adduid`) VALUES (?,?,?,?,?,?)",
    updateRouteDetail: "UPDATE `route_details` SET `route_id`=?,`stop_id`=?,`stop_sequence`=?,`distance_from_start`=?,`approx_time_from_start`=? WHERE  `id`=?",
    // deleteRouteDetails: "DELETE FROM `route_details` WHERE `id`=?",
    deleteRouteDetails: "UPDATE `route_details` SET `deleteuid` = ?, `deletedate` = CURDATE(), record_status = 0 WHERE `id`=?",

    // Stop Table

    getAllStops: "SELECT * FROM `stops`",
    getStopsByID: "SELECT * FROM `stops` WHERE `stop_id`=?",
    addStops: "INSERT INTO `stops`(`stop_id`, `stop_name`, `wait_time`, `reach_time`, `is_minor`, `latitude`, `longitude`, `radius_in_meters`, `route_id`,`adduid`) VALUES (?,?,?,?,?,?,?,?,?,?)",
    updateStops: "UPDATE `stops` SET `stop_name`=?,`wait_time`=?,`reach_time`=?,`is_minor`=?,`latitude`=?,`longitude`=?,`radius_in_meters`=?,`route_id`=?  WHERE `stop_id`=?",
    // deleteStops: "DELETE FROM `stops` WHERE `stop_id`=?",
    deleteStops: "UPDATE `stops` SET `deleteuid` = ?, `deletedate` = CURDATE(), record_status = 0 WHERE `stop_id`=?",

    // Vehicale Table -- images

    getAllVehicle: "SELECT * FROM `vehicles`",
    getVehicleByID: "SELECT * FROM `vehicles` WHERE `vehicles_id`=?",
    addVehicle: "INSERT INTO `vehicles`(`vehicles_type`, `brand`, `model_name`, `vehicles_number`, `vehicles_register_date`, `vehicles_condition`, `number_of_seats`, `number_of_doors`, `total_rows`, `total_columns`, `passenger_capacity`, `vehicle_image`, `status`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    updateVehicle: "UPDATE `vehicles` SET `vehicles_type`=?,`brand`=?,`model_name`=?,`vehicles_number`=?,`vehicles_register_date`=?,`vehicles_condition`=?,`number_of_seats`=?,`number_of_doors`=?,`total_rows`=?,`total_columns`=?,`passenger_capacity`=?,`vehicle_image`=?,`status`=?,`adduid`=? WHERE `vehicles_id`=?",
    deleteVehicle: "UPDATE `vehicles` SET `deleteuid`=?,`deletedate`=CURDATE(),,`record_status`=0 WHERE `vehicles_id`=?",

    //Fare Table

    getAllFare: "SELECT * FROM `fare`",
    getFareByID: "SELECT * FROM `fare` WHERE `fare_id`=?",
    addFare: "INSERT INTO `fare`( `fare_type`, `fare_per_stop`, `base_fare`, `fare_per_KM`, `status`, `adduid`) VALUES (?,?,?,?,?,?)",
    updateFare: "UPDATE `fare` SET `fare_type`=?,`fare_per_stop`=?,`base_fare`=?,`fare_per_KM`=?,`status`=?,`adduid`=? WHERE `fare_id`=?",
    deleteFare: "UPDATE `fare` SET `deleteuid`=?,`deletedate`=CURDATE(),`record_status`=0 WHERE `fare_id`=?",

    // Cencellation Table
    getAllCencellation: "SELECT * FROM `cancellation`",
    getCencellationByID: "SELECT * FROM `cancellation` WHERE `policy_id`=?",
    addCencellation: "INSERT INTO `cancellation`(`user_id`, `cancellation_reason`, `status`, `cancellation_time`, `cancellation_date`, `refund_amount`, `refund_percentage`, `adduid`) VALUES (?,?,?,?,?,?,?,?)",
    updateCencellation: "UPDATE `cancellation` SET `user_id`=?,`cancellation_reason`=?,`status`=?,`cancellation_time`=?,`cancellation_date`=?,`refund_amount`=?,`refund_percentage`=?,`adduid`=? WHERE `policy_id`=?",
    deleteCencellation: "UPDATE `cancellation` SET `deleteuid`=?,`deletedate`=CURDATE(),`record_status`=0  WHERE `policy_id`=?",

    // Promotions Table
    getAllPromotions: "SELECT * FROM `promotions` ",
    getPromotionsByID: "SELECT * FROM `promotions` WHERE `promotion_id`=?",
    addPromotions: "INSERT INTO `promotions`(`promotion_title`, `promo_type`, `discount_value`, `max_discount`, `start_date`, `end_date`, `max_allowed`, `per_user_limit`, `status`, `promo_code`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?)",
    updatePromotions: "UPDATE `promotions` SET `promotion_title`=?,`promo_type`=?,`discount_value`=?,`max_discount`=?,`start_date`=?,`end_date`=?,`max_allowed`=?,`per_user_limit`=?,`status`=?,`promo_code`=?,`adduid`=? WHERE `promotion_id`=?",
    deletePromotions: "UPDATE `promotions` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0  WHERE `promotion_id`=?",

    // Trips Table
    getAllTrips: "SELECT * FROM `trips`",
    getTripsByID: "SELECT * FROM `trips` WHERE `trip_id`=?",
    addTrips: "INSERT INTO `trips`( `trip_name`,`route_id`, `customer_id`, `driver_id`, `vehicle_id`, `custmore_phnoe`, `driver_phone`, `trip_booked_date`, `policy_id`, `promotion_id`, `trip_date_from`, `trip_date_to`, `trip_time_from`, `trip_time_to`, `trip_day`, `trip_fare`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    updateTrips: "UPDATE `trips` SET  `trip_name`,=?,`route_id`=?,`customer_id`=?,`driver_id`=?,`vehicle_id`=?,`custmore_phnoe`=?,`driver_phone`=?,`trip_booked_date`=?,`policy_id`=?,`promotion_id`=?,`trip_date_from`=?,`trip_date_to`=?,`trip_time_from`=?,`trip_time_to`=?,`trip_day`=?,`trip_fare`=?,`adduid`=?,WHERE `trip_id`=?",
    deleteTrips: "UPDATE `trips` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0 WHERE `trip_id`=?",

    // CustomerTable: --image
    getAllCustomer : "SELECT * FROM `customers`",
    getCustomerByID : "SELECT * FROM `customers` WHERE `customer_id`=?",
    addCustomer : "INSERT INTO `customers`( `customer_name`, `email`, `phone_number`, `verified_status`, `gender`, `date_of_birth`, `city`, `register_city`, `current_latitude`, `current_longitude`, `register_latitude`, `register_longitude`, `total_trips`, `active_status`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    updateCustomer : "UPDATE `customers` SET `customer_name`=?,`email`=?,`phone_number`=?,`verified_status`=?,`gender`=?,`date_of_birth`=?,`city`=?,`register_city`=?,`current_latitude`=?,`current_longitude`=?,`register_latitude`=?,`register_longitude`=?,`total_trips`=?,`active_status`=?,`adduid`=? WHERE `customer_id`=?",
    deleteCustomer : "UPDATE `customers` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0 WHERE `customer_id`=?",

    // Driver Table: --image
    getAllDriver : "SELECT * FROM `drivers`",
    getDriverByID : "SELECT * FROM `drivers` WHERE  `driver_id`=?",
    addDriver : "INSERT INTO `drivers`(`driver_name`, `vehicle_id`, `driver_vehicle_number`, `driver_licence_number`, `driving_test`, `driving_test_verified`, `driving_test_verified_id`, `email`, `phone_number`, `gender`, `date_of_birth`, `city`, `register_city`, `current_latitude`, `current_longitude`, `register_latitude`, `register_longitude`, `total_trips`, `user_wallet_balance`,`driving_licence`, `image_of_licence`, `document_status`, `document_verified_status`, `document_upload_date`, `active_status`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    updateDriver : "UPDATE `drivers` SET `driver_name`=?,`vehicle_id`=?,`driver_vehicle_number`=?,`driver_licence_number`=?,`driving_test`=?,`driving_test_verified`=?,`driving_test_verified_id`=?,`email`=?,`phone_number`=?,`gender`=?,`date_of_birth`=?,`city`=?,`register_city`=?,`current_latitude`=?,`current_longitude`=?,`register_latitude`=?,`register_longitude`=?,`total_trips`=?,`user_wallet_balance`=?,`active_status`=?,`driving_licence`=?,`image_of_licence`=?,`document_status`=?,`document_verified_status`=?,`document_upload_date`=?,`adduid`=? WHERE `driver_id`=?",
    deleteDriver : "UPDATE `drivers` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0  WHERE `driver_id`=?",

    // Analytics Table:
    getAllAnalytics : "SELECT * FROM `analytics`",
    getAnalyticsByID : "SELECT * FROM `analytics` WHERE  `analytics_id`=?",
    addAnalytics : "INSERT INTO `analytics`( `user_id`, `driver_id`, `vehicle_id`, `trip_id`, `trip_status`, `route_id`, `trip_date`, `trip_time`, `total_seats`, `seat_numbers`, `pickup_point`, `drop_point`, `booking_time`, `amount`, `promo_code`, `discounted_fare`, `payment_method`, `status`, `cancellation_reason`, `refund_amount`, `refund_percentage`, `cancel_time`, `adduid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    updateAnalytics : "UPDATE `analytics` SET `user_id`=?,`driver_id`=?,`vehicle_id`=?,`trip_id`=?,`trip_status`=?,`route_id`=?,`trip_date`=?,`trip_time`=?,`total_seats`=?,`seat_numbers`=?,`pickup_point`=?,`drop_point`=?,`booking_time`=?,`amount`=?,`promo_code`=?,`discounted_fare`=?,`payment_method`=?,`status`=?,`cancellation_reason`=?,`refund_amount`=?,`refund_percentage`=?,`cancel_time`=?,`adduid`=? WHERE `analytics_id`=?",
    deleteAnalytics : "UPDATE `analytics` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0 WHERE `analytics_id`=?",

    // DeleteAccountRequests Table:
    getAllDeleteAccountRequests : "SELECT * FROM `delete_account_requests` ",
    getDeleteAccountRequestsByID : "SELECT * FROM `delete_account_requests` WHERE 'request_id`=?",
    addDeleteAccountRequests : "INSERT INTO `delete_account_requests`( `user_id`, `driver_id`, `reason_to_delete_account`, `feedback`, `status`, `adduid`) VALUES (?,?,?,?,?,?)",
    updateDeleteAccountRequests : "UPDATE `delete_account_requests` SET `user_id`=?,`driver_id`=?,`reason_to_delete_account`=?,`feedback`=?,`status`=?,`adduid`=? WHERE `request_id`=?",
    deleteDeleteAccountRequests : "UPDATE `delete_account_requests` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0  WHERE `request_id`=?",

    // GeneralSetting Table: --image
    getAllGeneralSetting : "SELECT * FROM `general_setting`",
    getGeneralSettingByID : "SELECT * FROM `general_setting` WHERE ",
    addGeneralSetting : "INSERT INTO `general_setting`( `client_name`, `support_email`, `brand_logo`, `favicon`, `adduid`) VALUES (?,?,?,?,?)",
    updateGeneralSetting : "UPDATE `general_setting` SET `client_name`=?,`support_email`=?,`brand_logo`=?,`favicon`=?,`adduid`=? WHERE `id`=?",
    deleteGeneralSetting : "UPDATE `general_setting` SET`deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0 WHERE `id`=?",

    // City Table:
    getAllCity : "SELECT * FROM `city`",
    getCityByID : "SELECT * FROM `city` WHERE 1",
    addCity : "INSERT INTO `city`( `city`, `state`, `customer_support_number`, `driver_support_number`, `emergency_number`, `service_type`, `adduid`) VALUES (?,?,?,?,?,?,?)",
    updateCity : "UPDATE `city` SET`city`=?,`state`=?,`customer_support_number`=?,`driver_support_number`=?,`emergency_number`=?,`service_type`=?,`adduid`=? WHERE  `id`=?",
    deleteCity : "UPDATE `city` SET `deleteuid`=?,`deletedate`=CURDATE=(),`record_status`=0 WHERE  `id`=?",

    // // Table:
    // getAll : "",
    // getByID : "",
    // add : "",
    // update : "",
    // delete : "",
    
}

