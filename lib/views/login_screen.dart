import 'package:flutter/material.dart';
import '../widgets/alert_dialog.dart';
import '../utils/app_routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, String> _login = {};
  bool _isLoading = false;

  void authenticate() {
    setState(() {
      _isLoading = true;
    });
    try {
      if (true) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
      } else {
        AlertDialogWid(context, "Login inválido!");
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("erro");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuggestInBox'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 250,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Login'),
                ),
                SizedBox(height: 50),
                TextFormField(
                  onChanged: (text) {
                    _login['email'] = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (text) {
                    _login['password'] = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      authenticate();
                    },
                    child: Text('Entrar'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
