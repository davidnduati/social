const express = require('express')
const {updateprofile,updateprofilepic,deleteprofilepic} = require('../controllers/profilecontroller')
const profileroute = express.Router()

profileroute.post('/updateprofile', updateprofile)
profileroute.post('/updateprofilepic', updateprofilepic)
profileroute.post('/deleteprofilepic', deleteprofilepic)

module.exports = {profileroute}