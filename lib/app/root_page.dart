import 'package:flutter/material.dart';
import 'package:x03_architecture/features/authentication/bloc/auth_provider.dart';
import 'package:x03_architecture/features/home/home_page.dart';
import '../features/authentication/bloc/auth_base.dart';
import '../features/authentication/view/login_page.dart';

class RootPage extends StatelessWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseAuth? auth = AuthProvider.of(context)?.auth;
    return StreamBuilder<String>(
        stream: auth?.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool isLoggedIn = snapshot.hasData;
            return isLoggedIn ? HomePage() : LoginPage();
          }
          return _buildWaitingScreen();
        });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
