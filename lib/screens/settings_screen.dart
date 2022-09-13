import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonproject/providers/user_provider.dart';
import 'package:skeletonproject/share_preferences.dart/preferences.dart';
import 'package:skeletonproject/widgets/generales/CustomDrawer.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings Screen'),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Configuraciones', style: TextStyle( fontSize: 25, fontWeight: FontWeight.w600)),
                const Divider(),
                SwitchListTile.adaptive(
                  title: const Text('Dark Mode'),
                  value: Preferences.isDarkmode, 
                  onChanged: (value) {
                    Preferences.isDarkmode   = value;
                    final themeProvider = Provider.of<UserProvider>(context, listen: false);
                    if (value) {
                      themeProvider.setDarkmode();
                    } else {
                      themeProvider.setLightMode();
                    }
                    setState(() {});
                  }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Masculino'),
                  value: 1, 
                  groupValue: Preferences.gender, 
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Femenino'),
                  value: 2, 
                  groupValue: Preferences.gender, 
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: "Juan",
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Ingrese su nombre'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}