import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:ecommerce_app/pages/bottomnavbar.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String email = "", password = "";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

    userLogin() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 
          Text("Login Successfully", style: TextStyle(
          color: Colors.white),), 
          backgroundColor: Colors.green,));
          await Future.delayed(Duration(milliseconds: 500));
      
      // THEN navigate - use pushReplacement to replace the login page
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => Bottomnavbar()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        
        if (e.code == 'user-not-found'){
          errorMessage = "User doesn't exist";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Incorrect password";
        } else if (e.code == 'invalid-credential') {
          errorMessage = "Invalid email or password";
        } else {
          errorMessage = "Error: ${e.code}";
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 
          Text(errorMessage, style: TextStyle(
          color: Colors.white),), 
          backgroundColor: Colors.redAccent,));
      }
    }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("images/login.png"),
                  SizedBox(height: 10,),
                  Center(child: Text("Sign In", style: AppWidget.normalTextBoldStyle(),)),
                  SizedBox(height: 15,),
                  Center(child: Text("Please enter the details below to\n                  continue", style: AppWidget.normalTextFieldStyle(),)),
                  SizedBox(height: 30,),
                  Text("Email:", style: AppWidget.normalTextBoldStyle(),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4F5F9),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "Please enter your email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
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
                    child: TextFormField(
                        validator: (value) {
                        if(value == null || value.isEmpty){
                          return "Please enter your password";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
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
                  GestureDetector(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          email = emailController.text.trim();
                          password = passwordController.text.trim();
                        });
                        userLogin();
                      }
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green, 
                        borderRadius: BorderRadius.circular(10,)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text(" Sign Up", style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w500),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}