import 'package:flutter/material.dart';

class ShowMessageWidget extends StatelessWidget {
  final String message;
  const ShowMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(fontSize: 25),
    );
  }
}
