// ignore_for_file: prefer_const_constructors
import 'package:animated_button/animated_button.dart';
import 'package:asa_optichub_worker/screens/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/size_config.dart';
import 'main_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isNotValidateEmail = false;
  bool _isNotValidatePassword = false;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainPage()),
            ModalRoute.withName('/'));
      }
    } catch (e) {
      String errorMessage;
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          _isNotValidateEmail=true;
          errorMessage = 'No user found with that email.';
        } else if (e.code == 'wrong-password') {
          _isNotValidatePassword=true;
          errorMessage = 'Wrong password provided for that user.';
        } else {
          errorMessage = 'An error occurred while signing in. Please try again later.';
        }
      } else {
        errorMessage = 'An error occurred while signing in. Please check your internet connection and try again.';
      }
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage),
            backgroundColor: Colors.redAccent,),
        );
      }
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.screenH! * 0.8,
                      width: SizeConfig.screenW! * 0.9,
                      decoration: ShapeDecoration(
                          color: const Color(0xFFF0F3FA),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(14),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenH! * 0.2,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Log In',
                                  style: GoogleFonts.manrope(
                                      color: const Color.fromRGBO(1, 1, 1, 1),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: SizeConfig.screenH! * 0.02,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'Email',
                                      style: GoogleFonts.oxygen(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenH! * 0.01,
                              ),
                              Container(
                                height: SizeConfig.screenH! * 0.06,
                                width: SizeConfig.screenW! * 0.85,
                                decoration: ShapeDecoration(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        side: const BorderSide(
                                            color: Colors.black))),
                                child: TextField(
                                  controller: _emailController,
                                  decoration:InputDecoration(
                                    hintText: _isNotValidateEmail ? "Please Check Your Email or Sign Up" : 'Enter Email',
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none,
                                  ),
                                  // controller: _emailController,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenH! * 0.02,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'Password',
                                      style: GoogleFonts.oxygen(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenH! * 0.01,
                              ),
                              Container(
                                height: SizeConfig.screenH! * 0.06,
                                width: SizeConfig.screenW! * 0.85,
                                decoration: ShapeDecoration(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        side: const BorderSide(
                                          color: Colors.black,
                                        ))),
                                child: TextField(
                                  controller: _passwordController,
                                  decoration:InputDecoration(
                                    hintText: _isNotValidatePassword ? "Please Check Your Password" :  'Enter Password',
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none,
                                  ),
                                  // controller: _emailController,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                        return ForgotPasswordPage();
                                      }));
                                    },
                                    child: Text(
                                      'Forgot Your Password?',
                                      style: GoogleFonts.oxygen(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: AnimatedButton(
                                  shadowDegree: ShadowDegree.light,
                                  color: Colors.black,
                                  shape: BoxShape.rectangle,
                                  height:SizeConfig.screenH! * 0.07 ,
                                  width: SizeConfig.screenW! * 0.8,
                                  onPressed: signIn,
                                  child: Text(
                                    'Sign In',
                                    style: GoogleFonts.oxygen(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenH! * 0.03,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
