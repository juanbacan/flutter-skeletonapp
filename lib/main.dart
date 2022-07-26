import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonproject/providers/user_provider.dart';
import 'package:skeletonproject/screens/home_screen.dart';
import 'package:skeletonproject/screens/login_screen.dart';
import 'package:skeletonproject/screens/settings_screen.dart';
import 'package:skeletonproject/screens/welcome_screen.dart';

import 'package:skeletonproject/share_preferences.dart/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UserProvider(isDarkmode: Preferences.isDarkmode)),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeleton App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<UserProvider>(context).currentTheme,
      // theme: ThemeData(
      //   primaryColor: Colors.purple,
      //   // primarySwatch: Colors.blue,
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       primary: Colors.purple,
      //       textStyle: const TextStyle(color: Colors.white),
      //     )
      //   ),
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.w900,
      //     ),
      //   )
      // ),
      // home: Preferences.welcome ? const WelcomeScreen() : const LoginScreen(),
      home: Preferences.welcome ? const WelcomeScreen() : const HomeScreen(),
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        // SettingsScreen.routeName :(context) => const LoginScreen(),
        SettingsScreen.routeName :(context) => const SettingsScreen(),
      },
    );
  }
}
