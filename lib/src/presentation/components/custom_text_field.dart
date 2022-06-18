import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Icon? icon;
  final bool isPassword;
  final String labelText;
  final TextInputType? keyboardType;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.placeholder,
      this.icon,
      required this.labelText,
      required this.isPassword,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.labelText,
            style: const TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
          TextField(
            keyboardType: this.keyboardType,
            controller: this.controller,
            obscureText: this.isPassword,
            decoration: InputDecoration(
              prefixIcon: this.icon,
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              hintText: this.placeholder,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
