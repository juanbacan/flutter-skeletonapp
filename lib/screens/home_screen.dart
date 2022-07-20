import 'package:flutter/material.dart';
import 'package:skeletonproject/share_preferences.dart/preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('Home Page'),
              ElevatedButton(
                onPressed: (){
                  Preferences.welcome = true;
                }, 
                child: const Text("Habilitar Welcome Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
