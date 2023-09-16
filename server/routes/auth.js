const express = require('express');
const User = require("../models/user"); //User contains schema for mongoose
const bcryptjs = require('bcryptjs'); //to encrypt password
const jwt = require('jsonwebtoken');
const authrouter = express.Router();

authrouter.post("/api/signup" ,async (req , res) => {
   try {
    //get the date from client to server

    //data is adding to these properties from request.body
    const {name , email , password} = req.body;

    const existUser = await User.findOne({email : email});
    if(existUser){
        return res.status(400).json({msg : "user already exists"});
    }
    const hashpassword = await bcryptjs.hash(password , 8);
    //calling a new user instance , or constructor having n, e, p arguments
    let user = new User({
        name,
        email,
        password : hashpassword
    });

    //save to database
    user = await user.save();
    res.json(user); //get the response

    } catch(e) {
        res.status(500).json({error : e.message });
        console.log('not ohk nothing works properly');
    }

});

//for sign In Route
authrouter.post('/api/signin' , async (req , res) => {

    try{
        const {email , password} = req.body;
        const user = await User.findOne({email});
        if(!user){
            return res
            .status(400)
            .json({msg : "user does not exists" });
        }
        
        const isMatch = await bcryptjs.compare(password , user.password);
        if(!isMatch){
            return res
            .status(400)
            .json({msg : 'Incorrect password'});
        }

        //everything is fine now
        const token = jwt.sign({id : user._id} , "passwordKey");
        res.json({token , ...user._doc});
        console.log('auth.js is ohk');

    }catch(e) {
        res.status(500).json({error : e.message});
        console.log('sign in error not working bro');
    }
});

//return the data to the client
module.exports = authrouter; //to use authrouter outside the module or declare globally

