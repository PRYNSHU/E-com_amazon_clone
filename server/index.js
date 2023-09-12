//IMPORT FROM OTHER PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORT FROM OTHER FILES
const authrouter = require("./routes/auth");

const PORT = 5000;

//creating an instance of express() fun , to use its features
const app = express();
const DB = "mongodb+srv://Priyanshu:priyanshu123@cluster0.rkupsqh.mongodb.net/?retryWrites=true&w=majority";


//MIDDLEWARE , method to mount router in main file
app.use(express.json());
app.use("/auth", authrouter); //Mount the authrouter under the '/auth' path

//connections
mongoose
    .connect(DB)
    .then(() => {
        console.log("connected successfully");
    })
    .catch((e) => {
        console.log('sorry babu');
    });

// a "route" refers to a mechanism used in web applications to define
// how the application should respond to different HTTP requests
// (such as GET, POST, PUT, DELETE, etc.) for specific URLs or URL patterns.

//creating an API
app.get("/", (req, res) => {
    // res.send('hello beautiful World');
    res.json({ names: "Priyanshu rai" });
});

// Start the server and listen on the specified port
app.listen(PORT , () => {
    console.log("connected at : " + PORT);
});



