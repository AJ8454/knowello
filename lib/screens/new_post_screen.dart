import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Post Screen',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
