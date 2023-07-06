const express = require('express')
const {postfromfollowingusers,mypost,peopleyoucanfollow}= require('../controllers/postcontroller')
const postroute = express.Router()

postroute.post('/postfromfollowingusers',postfromfollowingusers)
postroute.get('/mypost',mypost)
postroute.get('/peopleyoucanfollow',peopleyoucanfollow)

module.exports = {postroute}