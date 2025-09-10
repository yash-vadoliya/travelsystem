const express = require('express');
const router = express.Router();
const upload = require('../middleware/multer');

const authenticateToken = require('../middleware/userauth');

//Login-Logout
const login_conroller = require('../controller/login_controller');

router.post('/login', login_conroller.loginUser);
router.post('/logout', login_conroller.logoutUser);

// User 
const userController = require('../controller/user_controller');

router.route('/user').all(authenticateToken, userController);
router.route('/user/:id').all(authenticateToken, userController);

//Route 
const RoutesController = require('../controller/routes_controller');

router.route('/route').all(authenticateToken, RoutesController);
router.route('/route/:id').all(authenticateToken, RoutesController);

// Route Details
const RouteDetailsController = require('../controller/routeDetails_contoller');

router.route('/route_details').all(authenticateToken, RouteDetailsController);
router.route('/route_details/:id').all(authenticateToken, RouteDetailsController);

//Stops
const RouteStopsContoller = require('../controller/stop_controller');

router.route('/route_stop').all(authenticateToken, RouteStopsContoller);
router.route('/route_stop/:id').all(authenticateToken, RouteStopsContoller);

//Vehicles --image
const vehiclesController = require('../controller/vehicles_controller');
router
  .route("/vehicles")
  .get(authenticateToken, vehiclesController) 
  .post(authenticateToken, upload.single("image"), vehiclesController); 

router
  .route("/vehicles/:id")
  .get(authenticateToken, vehiclesController)
  .put(authenticateToken, upload.single("image"), vehiclesController) 
  .delete(authenticateToken, vehiclesController);


//Fare
const fareController =  require('../controller/fare_controller');

router.route('/fare').all(authenticateToken,fareController);
router.route('/fare/:id').all(authenticateToken,fareController);

//Cencellation
const cancellationController = require('../controller/cancellation_controller');

router.route('/cancel').all(authenticateToken,cancellationController);
router.route('/cancel/:id').all(authenticateToken,cancellationController);

//Promotions 
const promotionsController = require('../controller/promotions_controller');

router.route('/promotions').all(authenticateToken,promotionsController);
router.route('/promotions/:id').all(authenticateToken,promotionsController);

//Trip
const tripController = require('../controller/trip_controller');

router.route('/trip').all(authenticateToken,tripController);
router.route('/trip/:id').all(authenticateToken,tripController);

//Customer --image
const customerController = require('../controller/customer_controller');

router
    .route('/customer')
    .get(authenticateToken,customerController)
    .post(authenticateToken,upload.single("image"),customerController);
router
    .route('/customer/:id')
    .get(authenticateToken,customerController)
    .put(authenticateToken,upload.single("image"),customerController)
    .delete(authenticateToken,customerController);

//Driver --image
const driverController = require('../controller/driver_controller');

router
    .route('/driver')
    .put(authenticateToken,driverController)
    .post(authenticateToken,upload.single("image"),driverController);
router
    .route('/driver/:id')
    .get(authenticateToken,driverController)
    .put(authenticateToken,upload.single("image"),driverController)
    .delete(authenticateToken,driverController);

//Analytics
const analyticsController = require('../controller/analytics_controller');

router.route('/analytics').all(authenticateToken,analyticsController);
router.route('/analytics/:id').all(authenticateToken,analyticsController);

//DeleteAccountRequests
const deleteAccountRequestsController = require('../controller/delete_account_requests_controller');

router.route('/deleteaccount').all(authenticateToken,deleteAccountRequestsController);
router.route('/deleteaccount/:id').all(authenticateToken,deleteAccountRequestsController);

// GeneralSetting
const generalSettingController = require('../controller/generalSetting_Controller') ;

router.route('/genralsetting').all(authenticateToken,generalSettingController);
router.route('/genralsetting/:id').all(authenticateToken,generalSettingController);

// City
const cityController = require('../controller/city_controller');

router.route('/city').all(authenticateToken,cityController);
router.route('/city/:id').all(authenticateToken,cityController);
module.exports = router;