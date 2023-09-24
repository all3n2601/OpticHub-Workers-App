// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:asa_optichub_worker/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerHomePage extends StatefulWidget {
  const WorkerHomePage({super.key});

  @override
  State<WorkerHomePage> createState() => _WorkerHomePageState();
}

class _WorkerHomePageState extends State<WorkerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 250, 224, 1.0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 0, 0),
              child: Text(
                'Optic Hub',
                style: GoogleFonts.oxygen(
                  color: Color.fromRGBO(188, 108, 37, 1.0),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 5, 0, 0),
              child: Row(
                children: [
                  Text('Welcome Back ! ',
                      style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromRGBO(188, 108, 37, 1.0),
                      )),
                  Text('Allen Febi',
                      style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color.fromRGBO(188, 108, 37, 1.0),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenH! * 0.1,
            ),
            Center(
              child: Container(
                height: SizeConfig.screenH! * 0.1,
                width: SizeConfig.screenW! * 0.95,
                decoration: ShapeDecoration(
                    color: Color.fromRGBO(204, 213, 174, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.work_history_outlined,
                              color: Color.fromRGBO(96, 108, 56, 1.0),
                              size: 34,
                            )),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delivery_dining,
                                color: Color.fromRGBO(96, 108, 56, 1.0),
                                size: 34,
                              ))),
                      SizedBox(
                        width: 50,
                      ),
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color.fromRGBO(96, 108, 56, 1.0),
                                size: 34,
                              ))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
