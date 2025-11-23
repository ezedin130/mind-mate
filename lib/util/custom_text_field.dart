import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.obscure = false,
    required this.color,
    this.controller,
    this.validator
  });

  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final Color color;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscure;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _isObscured,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.color,
        hintText: widget.hint,
        suffixIcon: widget.obscure
            ? IconButton(
          icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
        hintStyle: GoogleFonts.lato(color: Colors.grey[600]),
        contentPadding: const EdgeInsets.only(right: 48, left: 16, top: 12, bottom: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}