const express = require('express');

const authrouter = express.Router();

authrouter.post('api/signup' , (req , res) => {
    
    //get the date from client to server
    const {name , email , password} = req.body;
});


//add the data to database
//return the data to the client



module.exports = authrouter; //to use authrouter outside the module or declare globally
