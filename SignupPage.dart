import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilecomputingfirebase/main.dart';
//import 'package:mobilecomputingfirebase/UiHelper.dart';
import 'package:flutter/material.dart';
import 'UiHelper.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  signUp(String email,String pass)async{
    if(email=="" && pass==""){
      return UiHelper.customAlertBox(context, "Enter Required Fields");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword
          (email: email, password: pass).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title:"HomePage")));
        });
      }
      on FirebaseAuthException catch(ex)
      {
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailcontroller, "Email", Icons.mail, false),
          UiHelper.customTextField(passwordcontroller, "Password",Icons.password,true),
          SizedBox(height: 30,),
          UiHelper.customButton(() {
            signUp(emailcontroller.text.toString(), passwordcontroller.text.toString());
          }, "SignUp")
        ],
      ),
    );
  }
}