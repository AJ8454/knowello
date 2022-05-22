import 'package:flutter/material.dart';

class FavorateScreen extends StatelessWidget {
  const FavorateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Favourite Screen',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
