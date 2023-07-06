const express= require('express')
const app = express()
app.use(express.json())


const port=4014
app.listen(port,()=>console.log(`app is running on port ${port}`))