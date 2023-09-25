import 'package:asa_optichub_worker/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../admin_screens/admin_navbar.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final  userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final doc = snapshot.data;

          if (doc != null && doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            if (data['Role'] == 'Admin') {
              return AdminHome();
            }
            if (data['Role'] == 'Worker') {
              return HomePage();
            }
          }
          return const SizedBox.shrink();
        }
    );
  }
}
