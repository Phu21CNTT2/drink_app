import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Function? validator;
  final Function? onChanged;
  final TextEditingController? controller;

  const CustomTextFiled({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  late bool hiddenPassword;

  @override
  void initState() {
    super.initState();
    hiddenPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.validator as String? Function(String?)?,
          onChanged: widget.onChanged as void Function(String)?,
          controller: widget.controller,
          obscureText: hiddenPassword,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            label: IntrinsicWidth(
              child: Row(
                children: [
                  Text(widget.labelText ?? ''),
                  const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hiddenPassword = !hiddenPassword;
                      });
                    },
                    icon: Icon(
                      hiddenPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
