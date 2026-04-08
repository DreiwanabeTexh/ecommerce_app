import 'package:ecommerce_app/pages/bottomnavbar.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widget/support_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    String? name, email, password;

    final TextEditingController nameController =  TextEditingController();
    final TextEditingController emailController =  TextEditingController();
    final TextEditingController passwordController =  TextEditingController();

    final _formKey = GlobalKey<FormState>();

    @override
    void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

      registration() async {
      if(password != null && email != null && name != null){
        try {
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: 
            Text("Registered Sucessfully!", style: 
            TextStyle(color: Colors.white),), 
            backgroundColor: Colors.green,));
            Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnavbar()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: 
              Text("Password too weak!", style: 
              TextStyle(color: Colors.white),), 
              backgroundColor: Colors.redAccent,));
          }else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: 
              Text("Email already in use!", style: 
              TextStyle(color: Colors.white),), 
              backgroundColor: Colors.redAccent,));
          }
        }
      }
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true, 
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
                  Center(child: Text("Sign Up", style: AppWidget.normalTextBoldStyle(),)),
                  SizedBox(height: 15,),
                  Center(child: Text("Please enter the details below to\n             create an account", style: AppWidget.normalTextFieldStyle(),)),
                  SizedBox(height: 20,),
                  Text("Name:", style: AppWidget.normalTextBoldStyle(),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4F5F9),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Please enter your name";
                        }else {
                          return null;
                        }
                      },
                      controller: nameController,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Please enter your email";
                        }else {
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Please enter your password";
                        }else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.password_outlined, color: Colors.black,),
                        hintText: "Enter your password",
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 35,),
                  GestureDetector(
                    onTap: () {
                      if(_formKey.currentState != null && _formKey.currentState!.validate()){
                        setState(() {
                          name = nameController.text.trim();
                          email = emailController.text.trim();
                          password = passwordController.text.trim();
                        });
                        registration();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green, 
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginPage()),
                          );
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ], 
                  ),
        
                  SizedBox(height: 30,)
                                ],
                              ),
                            ),
                          ),
                        ),
      ),
                    );
                  }
                }