const cloudinary  = require('cloudinary').v2;
const { CloudinaryStorage } = require('multer-storage-cloudinary');
const multer = require('multer');
require ('dotenv').config();

cloudinary.config({
    cloud_name: process.env.CLOUD_NAME,
    api_key: process.env.API_KEY,
    api_secret: process.env.API_SECRET,
})

const Storage = new CloudinaryStorage({
    cloudinary : cloudinary,
    params: {
        folder: 'TS',
        allowed_formate : ['jpf','png'],
    }
})

const upload = multer({ storage: Storage });

module.exports = upload;