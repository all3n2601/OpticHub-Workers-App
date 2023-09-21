// ignore_for_file: prefer_const_constructors
import 'package:animated_button/animated_button.dart';
import 'package:asa_optichub_worker/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/login_page.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.screenH! * 0.45,
                    height: SizeConfig.screenH! * 0.6,
                    child: Image.asset(
                      'images/img.png',
                      height: 500,
                      width: 300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Optic Hub Workers App',
                      style: GoogleFonts.oxygen(
                          color: const Color.fromRGBO(1, 1, 1, 1),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                'See Clearly, Live Vividly . Unlock Your World of Clarity',
                style:
                GoogleFonts.oxygen(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: SizeConfig.screenH! * 0.02,
              ),
              Center(
                child: AnimatedButton(
                  shadowDegree: ShadowDegree.light,
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  height:SizeConfig.screenH! * 0.07 ,
                  width: SizeConfig.screenW! * 0.9,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context){
                          return LoginPage();
                        }));
                  },
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
                height: SizeConfig.screenH! * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
