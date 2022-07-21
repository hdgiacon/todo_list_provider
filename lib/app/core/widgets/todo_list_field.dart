import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com suffixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            suffixIcon: suffixIconButton ??
                Visibility(
                  // se nao der certo, fazer igual no video de text field
                  visible: obscureText == true,
                  child: IconButton(
                    onPressed: () {
                      obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(
                      // trocar icones pelos do flutter icon
                      !obscureTextValue
                          ? Icons.panorama_fish_eye
                          : Icons.remove_red_eye,
                      size: 15.0,
                    ),
                  ),
                ),
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
