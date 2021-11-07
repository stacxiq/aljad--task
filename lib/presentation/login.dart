import 'package:flutter/material.dart';
import 'package:test1/data_layer/notifier/user_notifier.dart';
import 'package:test1/data_layer/repositories/authentication.dart';
import 'package:test1/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String userName;
  late String password;
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  late UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xff50AEA0), Color(0xff4276AE)],
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 340,
            height: 340,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserNameField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPasswordField(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Do You forget your Password ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildSubmitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildUserNameField() {
    return TextFormField(
      controller: userNameController,
      onChanged: (value) => setState(() {
        userName = userNameController.text;
      }),
      decoration: const InputDecoration(
        label: Text(
          'Enter your name',
          style: TextStyle(color: Colors.white),
        ),
        focusColor: Colors.white,
        fillColor: Colors.white,
        suffixIcon: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) =>
          value!.isEmpty ? ' User Name is required' : validateUserName(value),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onChanged: (value) => setState(() {
        password = passwordController.text;
      }),
      decoration: const InputDecoration(
        label: Text(
          'Enter your password',
          style: TextStyle(color: Colors.white),
        ),
        focusColor: Colors.white,
        fillColor: Colors.white,
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) =>
          value!.isEmpty ? ' Password is required' : validatePassword(value),
    );
  }

  String? validateUserName(String value) {
    if (value.length < 4)
      return 'Enter Valid User Name';
    else
      return null;
  }

  String? validatePassword(String value) {
    if (value.length < 5)
      return 'Enter Valid Password';
    else
      return null;
  }

  Center _buildSubmitButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            try {
              _userProvider.getUser(
                  username: userName, password: password, ctx: context);
            } catch (e) {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return Text('data');
                  });
            }
          }
        },
        child: Container(
          width: 190,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}
