const express = require('express')
const app = express()
const mssql = require('mssql')
const bcrypt = require('bcrypt')
require('dotenv').config()

app.use(express.json())

//connecting to database
const pool = await mssql.connect(config)

//so as to login provide the user.password and the user.id in the body
app.post('/login', async (req, res) => {
    const user = req.body
    try {
        if (pool.connected) {
            try {
                const result = await pool.request()
                    .query('SELECT * FROM users where userid=' + user.id);
                const hashed_pwd = result.recordset.password
                console.log(hashed_pwd)
                if (hashed_pwd && user.id) {
                    const comparison_pwd = await bcrypt.compare(user.password, hashed_pwd)
                    if (comparison_pwd === true) {
                        res.status(200).json({
                            success: true,
                            message: 'successfully logged in'
                        })
                    }
                }
            }
            catch (error) {
                console.log(error)
                res.send('you aint conected to database')

            }
        }
    } catch (err) {
        console.error(err);
        res.status(500).send({ message: 'Server error' });
    }
});



app.post('/signup', async (req, res) => {
    const user = req.body
    try {

        const hashed_pwd = await bcrypt.hash(user.password, 8)
        if (pool.connected) {
            const result = await pool.request()
                .input('firstname', user.firstname)
                .input('lastname', user.lastname)
                .input('username', user.username)
                .input('email', user.email)
                .input('password', hashed_pwd)
                .input('imageurl', user.imageurl)
                .execute('createuser')



            res.status(201).send({ message: 'Signup successful' });
        } else { console.log('not connected to database') }
    } catch (err) {
        console.error(err);
        res.status(500).send({ message: 'Server error' });
    }
});


const port = 4040
app.listen(port, () => console.log(`Server started on port ${port}`));
