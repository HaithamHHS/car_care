// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as icon;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    
    List img = ['f.png', 'g.png'];
    return Scaffold(
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
                  'Sign In ',
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
                          textInputAction:TextInputAction.next ,
                          onFieldSubmitted: (String value) {
                            FocusScope.of(context).requestFocus(focus);
                          },
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
                          focusNode: focus,
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password should be more than 6 characters  ";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: ' Password',
                              hintText: ''),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF606470),
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
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
                    'Sign In',
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
                  height: 25,
                ),
                Text(
                  'OR',
                  style: TextStyle(fontSize: 16, color: Color(0xFF606470)),
                ),
                SizedBox(
                  height: 15,
                ),
               
                Wrap(
                  children: List<Widget>.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade500,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('img/' + img[index]),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'Dont Have An Account ? ',
                      style: TextStyle(fontSize: 17),
                    ),

                    InkWell(onTap:() => Navigator.pushNamed(context, 'sign-up'),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF606470),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
