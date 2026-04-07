import 'package:flutter/material.dart';
import 'package:ecommerce_app/widget/support_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/login.png"),
              SizedBox(height: 10,),
              Center(child: Text("Sign Up", style: AppWidget.normalTextBoldStyle(),)),
              SizedBox(height: 30,),
              Center(child: Text("Please enter the details below to\n             create an account", style: AppWidget.normalTextFieldStyle(),)),
              SizedBox(height: 30,),
              Text("Name:", style: AppWidget.normalTextBoldStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4F5F9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outline_outlined, color: Colors.black,),
                    hintText: "Enter your name",
                  ),
                ),
              ), 

              SizedBox(height: 15,),
                            Text("Email:", style: AppWidget.normalTextBoldStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4F5F9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email_outlined, color: Colors.black,),
                    hintText: "Enter your email",
                  ),
                ),
              ),

              SizedBox(height: 15,),
              Text("Password:", style: AppWidget.normalTextBoldStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4F5F9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.password_outlined, color: Colors.black,),
                    hintText: "Enter your password",
                  ),
                ),
              ),
              
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(height: 35,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.circular(10,)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),),
                  Text(" Login", style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w500),),
                ], 
              ),
              SizedBox(height: 30,),
            ],
          ),
          
        ),
      ),
      
    );
  }
}