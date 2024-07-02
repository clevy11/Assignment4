import 'package:exercise/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('CLB'),
        foregroundColor: Colors.white,
      ),
      body:const  HomeP(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home), label: 'The one and only'),
          NavigationDestination(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected:(int index){
          setState(() {
            current = index;
          });

        } ,
        selectedIndex: current,
      ),
    );
  }
}
