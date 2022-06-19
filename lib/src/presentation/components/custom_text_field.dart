import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Icon? icon;
  final bool isPassword;
  final String labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.placeholder,
      this.icon,
      this.validator,
      this.errorText,
      this.onChanged,
      required this.labelText,
      required this.isPassword,
      this.keyboardType})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
          TextFormField(
            onChanged: widget.onChanged,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
              prefixIcon: widget.icon,
              errorText: widget.errorText,
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              hintText: widget.placeholder,
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
