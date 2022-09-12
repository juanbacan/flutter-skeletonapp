import 'package:flutter/material.dart';
import 'package:skeletonproject/widgets/generales/CustomDrawer.dart';

class SettingsScreen extends StatelessWidget {

  static const String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

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
                  value: true, 
                  onChanged: (value) {

                  }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Masculino'),
                  value: 1, 
                  groupValue: 1, 
                  onChanged: (value) {

                  }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Femenino'),
                  value: 2, 
                  groupValue: 1, 
                  onChanged: (value) {

                  }
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: "Juan",
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