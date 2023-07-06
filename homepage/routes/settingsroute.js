const express = require('express')
const settings = express.Router()
const {logout,changepassword,deleteaccount} = require('../controllers/settingscontroller')

settings.post('/logout',logout)
settings.post('/changepassword',changepassword)
settings.post('/deleteaccount',deleteaccount)