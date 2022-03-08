import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/widgets/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);


  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _hidePassword = true;
  bool ?isChecked=false;

  String? email;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
        child: Form(

          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///1. TextField = no validation
              ///2. TextFormField= has validation

              Text(
                "Sign Up ",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 10),
              TextFormField(
                // controller: _emailController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autofocus: true,

                /// important functions
                onChanged: (val) {
                  print(val);
                },
                onFieldSubmitted: (submitedVal) {
                  print(submitedVal);
                },

                // focusNode: emailFocusNode,
                style: TextStyle(color: Colors.purple, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // enabledBorder: InputBorder(),
                  // disabledBorder: InputBorder(),
                ),

              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,

                /// important functions
                onChanged: (val) {
                  print(val);
                },
                onFieldSubmitted: (submitedVal) {
                  print(submitedVal);
                },

                focusNode: emailFocusNode,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email *",
                  hintText: "mail@website.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // enabledBorder: InputBorder(),
                  // disabledBorder: InputBorder(),
                ),

                validator: (currentVal) {
                  if (currentVal == null) {
                    return "Email cannot be null";
                  }
                  if (currentVal.isEmpty) {
                    return "Email cannot be empty";
                  }

                  if (!currentVal.contains("@")) {
                    return "Enter a valid email";
                  }
                  /// success case
                  return null;
                },
              ),

              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _hidePassword,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  labelText: "Password *",
                  hintText: "Enter your password (Min. 8 character)",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      _hidePassword = !_hidePassword;
                      print(_hidePassword);
                      setState(() {});
                    },
                    child: Icon(Icons.visibility_off),
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val;
                      });
                    },
                  ),
                  SizedBox(width: 5), //Size
                  Text(
                    'I agree to the ',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(color:Colors.blueAccent,fontSize: 17.0),
                  ),
                ],
              ), //

              SizedBox(height: 10),

              MaterialButton(
                elevation: 8,
                textColor: Colors.white,
                height: 45,
                minWidth: 430,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 8),
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  final formState = _formKey.currentState;
                  // _emailController.clear();

                  if (formState != null) {
                    formState.save();
                    // final email = _emailController.text;
                    // final _password = _passwordController.text;

                    bool _isValidated = formState.validate();
                  }
                },
                child: Text("Sign Up"),
                color: Colors.blue,

              ),
              SizedBox(height: 15),
              Row(
                  children: [
                    Text(
                      "Already have an account? ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
                    ),

                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: new Text("Login",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize:18,fontWeight: FontWeight.w700,color: Colors.blueAccent),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
