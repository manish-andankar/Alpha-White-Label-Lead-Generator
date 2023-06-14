import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onClose;

  const ErrorBox({
    Key? key,
    required this.errorMessage,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
