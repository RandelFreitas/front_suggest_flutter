import 'package:flutter/material.dart';
import 'package:suggest/stores/auth_store.dart';
import 'package:suggest/utils/app_routes.dart';
import 'package:suggest/widgets/alert_dialog.dart';

enum AuthMode { Fogot, Login }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _form = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  
  final Map<String, String> _login = {};
  bool _isLoading = false;
  final auth = AuthStore();

  void signIn(login) {
    if (!_form.currentState.validate()) {
      return;
    }
    
    setState(() {
      _isLoading = true;
    });
    
    if(_authMode == AuthMode.Login){
      try{
        auth.signIn(login).then((_) {
          if(auth.msg.value == null){
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          }else{
            AlertDialogWid(context, auth.msg.value);
          }
          setState(() {
            _isLoading = false;
          });
        });
      }catch(e){
        setState(() {
          _isLoading = false;
        });
        AlertDialogWid(context, "Erro no servidor, contate o adm.");
      }
    }else{
      try{
        auth.fogotPassoword(login).then((_) {
          setState(() {
            _isLoading = false;
          });
          AlertDialogWid(context, auth.msg.value);
        });
      }catch(e){
        setState(() {
          _isLoading = false;
        });
        AlertDialogWid(context, "Erro no servidor, contate o adm.");
      }
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
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      _authMode == AuthMode.Login? 'Login': 'Redefina sua senha',
                    ),
                  ),
                  SizedBox(height: 50),
                  if(_authMode == AuthMode.Login)
                    Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: _isLoading,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value.isEmpty || !value.contains('@')){
                              return "Informe um email válido!";
                            }
                            return null;
                          },
                          onChanged: (value) => _login['email'] = value,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          readOnly: _isLoading,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            filled: _isLoading,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value.isEmpty || value.length < 3){
                              return "Informe uma senha válida!";
                            }
                            return null;
                          },
                          onChanged: (value) => _login['password'] = value,
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          readOnly: _isLoading,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: _isLoading,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value.isEmpty || !value.contains('@')){
                              return "Informe um email válido!";
                            }
                            return null;
                          },
                          onChanged: (value) => _login['email'] = value,
                        ),
                      ]
                    ),
                  SizedBox(height: 15),
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ElevatedButton(
                        child: Text(_authMode == AuthMode.Login? 'Entrar' : 'Enviar'),
                        onPressed: () {
                          signIn(_login);
                        },
                      ),
                    ),                   
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextButton(
                        child: Text(_authMode == AuthMode.Login? "Esqueceu a senha?": "Login"),
                        onPressed: () {
                          if(_authMode == AuthMode.Login){
                            setState(() {
                              _authMode = AuthMode.Fogot;
                            });
                          }else{
                            setState(() {
                              _authMode = AuthMode.Login;
                            });
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
