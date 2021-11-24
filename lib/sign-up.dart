// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}
final _formKey = GlobalKey<FormState>();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
   
    // formkey
    final focus = FocusNode();
    final focus1 = FocusNode();
    final focus2 = FocusNode();

    // controllers
    TextEditingController password = TextEditingController();
    TextEditingController cpassword = TextEditingController();

    //img list
    List img = ['f.png', 'g.png'];

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'CarCare',
                    style: TextStyle(
                        fontSize: 60,
                        color: Color(0xFF93DEFF),
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign Up ',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(focus);
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (!value!.isNotEmpty) {
                                return "Please Enter a Vaild Name";
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: ' Name',
                              hintText: 'Haitham',
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            focusNode: focus,
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(focus1);
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (!value!.endsWith('.com') &&
                                  !value.isNotEmpty &&
                                  !value.contains('@')) {
                                return "Please Enter a Vaild Email";
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: ' Email',
                              hintText: 'Example@Gmail.com',
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: focus1,
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(focus2);
                            },
                            controller: password,
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password should be more than 6 characters  ";
                              }
                              if (value.isEmpty) {
                                return 'please enter a password';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock),
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: ' Password',
                                hintText: ''),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            focusNode: focus2,
                            controller: cpassword,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            validator: (value) {
                              if (password.text != cpassword.text) {
                                return "Password dosn't match please enter a valid one ";
                              }
                              if (value!.isEmpty) {
                                return 'Please ReEnter the password';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock_clock),
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: ' Confirm Password',
                                hintText: ''),
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Congrats'),
                        ));
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF93DEFF),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fixedSize: Size(200, 50)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        'Already Have An Account ? ',
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF606470),
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF606470),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
