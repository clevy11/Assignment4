import 'package:exercise/learn.dart';
import 'package:flutter/material.dart';

class HomeP extends StatelessWidget {
  const HomeP({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext) {
              return const Learn();
            }),
          );
        },
        child: Text('the one'),

      ),
    );
  }
}
