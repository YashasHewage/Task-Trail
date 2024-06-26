import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextFeild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style:
            const TextStyle(color: Colors.black), // Change the text color here
        decoration: InputDecoration(
          fillColor: Color.fromARGB(226, 245, 245, 245),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromRGBO(
                  190, 190, 190, 1)), // Change the hint text color here
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Remove the border side
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Remove the border side
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Remove the border side
          ),
        ),
      ),
    );
  }
}
