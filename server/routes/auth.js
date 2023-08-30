const express = require('express');
const User = require("../models/user");

const authrouter = express.Router();

authrouter.post("/api/signup" , async (req , res) => {
    //get the date from client to server
try {

    //data is adding to these properties from request.body
    const {name , email , password} = req.body;

    // const existUser = await User.findOne({email});
    // if(existUser){
    //     return res.status(400).json({msg : "user already exists"});
    // }

    //calling a new user instance , or constructor having n, e, p arguments
    let user = new User({
        name, email, password
    });

    //save to database
    user = await user.save();
    res.json(user); //get the response

} catch (e) {
        res.status(500).json({error : e.message });
        console.log('not ohk');
    }
});

//add the data to database
//return the data to the client
module.exports = authrouter; //to use authrouter outside the module or declare globally

