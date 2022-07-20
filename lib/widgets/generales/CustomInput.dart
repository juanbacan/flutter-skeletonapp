
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final Color? color;

  const CustomInput({
    required this.icon, 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword = false,
    this.color,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        cursorColor: const Color(0xFF151624),
        //style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        obscureText: isPassword,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: placeholder,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 28.0,
              color: Color.fromARGB(255, 240, 240, 240),
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 3.0,
              color: Theme.of(context).primaryColor,
            )
          ),
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(
            icon,
            color: textController.text.isEmpty ? Colors.black : color,
          )
        ),
      ),
    );
  }
}