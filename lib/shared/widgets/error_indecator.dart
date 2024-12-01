import 'package:flutter/material.dart';

class ErrorIndecator extends StatelessWidget {
  const ErrorIndecator(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
