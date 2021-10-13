import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isRequiredField;
  final String? error;
  final EdgeInsets padding;

  const AuthTextField({
    Key? key,
    this.hint = '',
    required this.onChanged,
    required this.keyboardType,
    this.isPasswordField = false,
    this.isRequiredField = false,
    this.error,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder border = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2));
    UnderlineInputBorder errorBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2));
    return Padding(
      padding: padding,
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          filled: true,
          hintText: isRequiredField ? '$hint*' : hint,
          border: border,
          disabledBorder: border,
          enabledBorder: border,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          errorText: error,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordField,
        maxLines: 1,
        onChanged: onChanged,
      ),
    );
  }
}
