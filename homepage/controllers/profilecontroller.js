const express = require('express')
const sql = require('mssql')
require('dotenv').config()


const config = {
    server: 'localhost',
    database: 'social',
    user: 'sa',
    password: 'process.env.PWD',//<== replace with the actual real pass in order to work

    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

module.exports = {
    updateprofile: async (req, res) => {
        const user = req.body
        const pool = await sql.connect(config)
        if (pool.connected) {
            const result = pool.request()
                .input('userid', user.id)//find a better way to cope with the id
                .input('username', user.username)
                .input('firstname', user.firstname)
                .input('lastname', user.lastname)
                .execute('dbo.updateuserprofile')

            res.status(200).json({
                success: true,
                message: 'updated status successfully'
            })
        } else {
            res.status(500).json({
                success: false,
                message: "internal server error"
            })
        }

    },
    updateprofilepic: async (req, res) => {
        const user = req.body
        const pool = await sql.connect(config)
        if (pool.connected) {
            const result = pool.request()
                .input('userid',user.id)
                .input('imageurl',user.imageurl)
                .execute('dbo.updateprofilepic')

                res.status(200).json({
                    success: true,
                    message: 'updated status successfully'
                })
            } else {
                res.status(500).json({
                    success: false,
                    message: "internal server error"
                })
            }
    },
    deleteprofilepic:async(req,res) =>{
        const user = req.body
        const pool = await sql.connect(config)
        if (pool.connected) {
            const result = pool.request()
                .input('userid',user.id)
                .execute('dbo.deleteprofilepic')
        }
    }

}