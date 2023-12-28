import 'package:flutter/material.dart';

Future errorDialog(String error, BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        backgroundColor: const Color.fromARGB(148, 255, 2, 2),
        elevation: 5,
        title: Center(
          child: Text(
            error,
            style: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
