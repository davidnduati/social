const express = require('express')
const sql  = require('mssql')


const config = {
    server: 'localhost',
    database: 'social',
    user: 'sa',
    password: 'process.env.PWD',
   
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};
module.exports= {
    logout: async (req, res) => {
        try{
              req.session.destroy((err) => {
            if (err) {
                console.log(err);
                return res.status(500).send('Internal Server Error');
            }
            res.status(200).json({success:true,
            message:'logged out .'
            })
            //res.redirect('/login'); // Redirect to the login page after successful logout
        });
        }catch(error){
            console.log(error)
            res.send('some error occured')

        }
      
    },
    changepassword:  async(req,res)=>{
        const user = req.body
        const pool = await sql.connect(config)
        if(pool.connected){
            const request = await pool.request()
             .input('userid',user.id)
             .input('password',user.password)
             .execute('dbo.changepassword')
        res.status(200).json({
            success:true,
            message:'changed password successfully'
        })
        }else{
            res.status(500).json({
                success:false,
                message:'internal server error'
            })
        }

    },
    deleteaccount:async(req,res)=>{
        try{
 const user = req.body
        const pool = await sql.connect(config)
        if(pool.connected){
            const request = await pool.request()
             .input('userid',user.id)
             .execute('deleteuser')
         res.status(200).json({
        success:true,
        message:'changed password successfully'
        }) 
        }else{
            res.status(500).json({
                success:false,
                message:'internal server error'
            })
        }
        }
catch(error){
    res.send(error)
}    
}
}
