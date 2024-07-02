import 'package:flutter/material.dart';
class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('THE ONE'),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (

    ){
          Navigator.of(context).pop();
        },
            icon:const Icon(Icons.arrow_back_ios),
      ),
    ),
      body:Column(
        children: [
          Image.asset('images/PJET2.jpg')
        ],
      )

    );
  }
}
