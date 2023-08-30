// "models" typically refer to a part of the application architecture used to represent and manage data.

const mongoose = require('mongoose');

// A schema is a blueprint that defines the structure of documents (objects) 
//that will be stored in a MongoDB collection
const userSchema = new mongoose.Schema({
    name: {
        type : String,
        required : true,
        trim : true,
    },
    email :{
        type : String,
        required : true,
        trim : true,
        validate : {
            validator : (value) => {
                 // Custom validation logic
                const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message : 'please enter valid email Id',
        }
    },
    password : {
        type : String,
        required : true,
    },

    address : {
        type : String,
        default : "",
    },

    type : {
        type : String,
        default : "user",
    }
    //cart

});

//The mongoose.model() function creates a model class based on the schema definition.
const User = mongoose.model('User' , userSchema); 
module.exports = User;



