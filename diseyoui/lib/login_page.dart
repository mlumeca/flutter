import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 230, 47, 23),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              width: 250, child: Image.asset('assets/images/path_logo.png')),
          Container(
            margin: const EdgeInsets.only(bottom: 150),
            child: const Text(
              'Beautiful, Private Sharing',
              style: TextStyle(
                  color: Color.fromARGB(255, 252, 154, 129), fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: FilledButton(
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: const SizedBox(
                width: 180,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 230, 47, 23), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Already have a Path account?',
            style: TextStyle(color: Color.fromARGB(255, 252, 154, 129)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: OutlinedButton(
              onPressed: () {},
              child: const SizedBox(
                width: 180,
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Color.fromARGB(255, 252, 154, 129)),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            "By using Path, you agree to Path's",
            style: TextStyle(color: Color.fromARGB(255, 252, 154, 129)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 80),
            width: 220,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Terms of Use',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white)),
                Text(
                  'and',
                  style: TextStyle(color: Color.fromARGB(255, 252, 154, 129)),
                ),
                Text('Privacy Policy',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white)),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
