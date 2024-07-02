import 'package:design/calculator.dart';
import 'package:design/sign_in_screen.dart';
import 'package:design/sign_up_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;

  const HomeScreen({super.key, required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const SignInScreen(),
    const SignUpScreen(),
    CalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: const Text(
            'CLB',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[850],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red],
                  ),
                ),
                child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                leading: const Icon(Icons.account_circle, color: Colors.white),
                title: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                leading: const Icon(Icons.account_circle, color: Colors.white),
                title: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                leading: const Icon(Icons.calculate, color: Colors.white),
                title: const Text('Calculator', style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: _selectedIndex == 1,
                  onChanged: (value) {
                    widget.onThemeChanged(value? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}