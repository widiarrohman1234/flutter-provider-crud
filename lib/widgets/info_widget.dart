import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const InfoWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
