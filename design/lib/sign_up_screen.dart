import 'package:design/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? _date;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime(DateTime.now().year - 50),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                const TextField(decoration: InputDecoration(labelText: "Full Name")),
                const SizedBox(height: 10),
                const TextField(decoration: InputDecoration(labelText: "Username")),
                const SizedBox(height: 10),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password")
                ),
                const SizedBox(height: 10),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Telephone Number"),
                ),
                GestureDetector(
                  onTap: () => selectDate(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController(
                        text: _date != null ? DateFormat('yyyy-MM-dd').format(_date!) : '', // <- made change here
                      ),
                      decoration: const InputDecoration(labelText: 'Date of Birth'),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.deepPurple,
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}