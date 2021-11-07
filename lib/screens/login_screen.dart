import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log In",
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    labelText: "Email",
                    labelStyle: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: widget.emailController.text.trim(),
                        password: widget.passwordController.text.trim(),
                      );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
