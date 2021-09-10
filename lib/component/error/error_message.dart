import 'package:flutter/material.dart';

class ErroMessage extends StatefulWidget {
  final String message;
  const ErroMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  @override
  _ErroMessageState createState() => _ErroMessageState();
}

class _ErroMessageState extends State<ErroMessage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          widget.message,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
