import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(name));
  }
}
