import 'package:flutter/material.dart';
import 'package:x03_architecture/features/authentication/bloc/auth_provider.dart';
import 'package:x03_architecture/app/root_page.dart';

import 'services/authentication_service/auth.dart';
import 'features/authentication/view/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  //[firebase]
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: RootPage(),
      ),
    );
  }
}
