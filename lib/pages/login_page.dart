import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preguntasapp/services/auth_services.dart';
import 'package:preguntasapp/widget/widget.dart';
//import 'package:quizapp2/services/auth.dart';
//import 'package:quizapp2/widget/widget.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //final AuthService _authService = AuthService();

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  void _login(context) async {
    var service = AuthService();
    var email = emailEditingController.text;
    var password = passwordEditingController.text;
    var token = await service.login(email, password);

    if (token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario o contraseña incorrecta'),
        ),
      );
      return;
    }

    emailEditingController.clear();
    passwordEditingController.clear();

    FocusManager.instance.primaryFocus?.unfocus();

    Navigator.pushNamed(context, 'quizscreen');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('assets/quiz.jpg')),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Correo electronico",
                  ),
                  controller: emailEditingController,
                ),
                SizedBox(
                  height: 6,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Contraseña"),
                  controller: passwordEditingController,
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _login(context),
                    child: Text('Iniciar Sesión'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes cuenta? ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      child: Text('Registrate'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
