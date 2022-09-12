import 'package:flutter/material.dart';
import 'package:skeletonproject/share_preferences.dart/preferences.dart';
import 'package:skeletonproject/widgets/generales/CustomDrawer.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Preferences.welcome = false;
          //       Navigator.pushReplacementNamed(context, '/login');
          //     },
          //     icon: const Icon(Icons.exit_to_app),
          //   )
          // ],
        ),
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
        drawer: const CustomDrawer()
    
      ),
    );
  }
}
