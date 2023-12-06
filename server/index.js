//import 'dotenv/config';
import express from 'express';
import ejs  from 'ejs';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
//import encrypt from 'mongoose-encryption';
//import md5 from 'md5';
import bcrypt from 'bcrypt';

const app=express();
const PORT=8080;
const SALT_ROUNDS=10;


// Middleware
// app.use(express.static("public"));
// app.set('view engine','ejs');
app.use(express.json());
app.use(express.urlencoded({extended:true}));

// Connected with MongoDB
mongoose.connect("mongodb+srv://appdev1101:dev25021101@cluster0.oq4zqwz.mongodb.net/placeProject")
.then(()=> console.log("Mongo DB connected !!!"))
.catch((err)=> console.log("Error : "+err));

const userSchema= new mongoose.Schema({
    email: {
        type: String,
        required : true
    },
    firstname: {
        type: String,
        required : false
    },
    lastname:{
        type: String,
    },
    password: {
        type: String,
        required : true
    }
});

//userSchema.plugin(encrypt,{secret: process.env.SECRET_API_KEY,encryptedFields:['password']});

const User=mongoose.model("User",userSchema);

app.get('/',(req,res)=>{
    res.render('home');
});

app.get('/login',(req,res)=>{
    res.render('login');
});

app.post('/login',async(req,res)=>{

    const email=req.body.email;
    //const password=md5(req.body.password);
    const password=req.body.password;
    const result=await User.findOne({email:email});
    console.log(result);
    //if(result && result.password===password)
    if(result && await bcrypt.compare(password,result.password))
    {
        res.status(200).json({"status":true,"data": result});
    }
    else{
        res.status(200).json({"status":false,"message":"Email is not valid"});
    }
});

app.get('/register',(req,res)=>{
    res.render('register');
});

app.post('/register',async(req,res)=>{

    
    const email=req.body.email;
    const firstname=req.body.firstname;
    const lastname=req.body.lastname;
    
    //const password=md5(req.body.password);
    console.log(`email ${email} firstname ${firstname}`);
    const password=await bcrypt.hash(req.body.password,SALT_ROUNDS);
    console.log("Password is "+password);
    const newUser=new User({email:email,password:password,firstname:firstname,lastname:lastname});
    const result=await newUser.save();
    console.log(result);

    if(!result)
    {
        res.status(200).json({
            "status":false,
            "message":"Email already exists."
        });
    }
    else{
        res.status(200).json({
            "status":true,
            "message":"Account created successfully."
        });
    }
    
});



app.listen(PORT,()=>{
    console.log(`Server is running on Port - ${PORT}`);
});
