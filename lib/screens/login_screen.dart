import 'package:flutter/material.dart';
import 'package:skeletonproject/widgets/generales/CustomInput.dart';
import 'package:skeletonproject/widgets/generales/Paper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final emailCtlr = TextEditingController();

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Paper(
                border: 25.0,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/image1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), 
                    const SizedBox(height: 20),
                    CustomInput(
                      icon: Icons.person, 
                      placeholder: "Nombre de usuario",
                      textController: emailCtlr,
                      color: Colors.white,
                    ),
                    CustomInput(
                      icon: Icons.person, 
                      placeholder: "Nombre de usuario",
                      textController: emailCtlr,
                      color: Colors.white,
                    ),
                    const Text('Login2 Page'),                   
                  ],
                )
              ),
            ),
            const Center(
              child: Text('Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}