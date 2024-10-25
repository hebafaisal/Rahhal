import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/Home.dart';
import 'package:flutter_application_rahhal/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  bool IsPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity, 
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, 

                  children: [
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: Image(image: AssetImage("images/logo.png")),
                    ),

                    Container(
                        width: 300, 
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField(
                          textInputAction:
                              TextInputAction.next, 
                          decoration: InputDecoration(
                            labelText: "Username", 
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF638889)), 
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(
                                      0xFF638889)), 
                              borderRadius: BorderRadius.circular(
                                  50.0), 
                            ), 
                            prefixIcon: Icon(Icons.person),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 2, color: Colors.red),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors
                                      .red), 
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            floatingLabelStyle:
                                WidgetStateTextStyle.resolveWith((states) {
                              if (states.contains(MaterialState.error)) {
                                return const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                );
                              }
                              return const TextStyle(
                                color: Color(0xFF638889),
                                fontSize: 15,
                              );
                            }),
                            // Error style (for the error message)
                            errorStyle: const TextStyle(
                              color: Colors.red, // Error text color
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the username'; 
                            }
                            return null;
                          },
                        )),

                    Container(
                      width: 300, 
                      margin: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF638889)), 
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color:
                                    Color(0xFF638889)), 
                            borderRadius: BorderRadius.circular(
                                50.0), 
                          ), 
                          prefixIcon: Icon(Icons.phone),
                          errorStyle: const TextStyle(
                            color: Colors.red, 
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number'; 
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                        width: 300, 
                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Color(0xFF638889)), 
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(
                                        0xFF638889)), 
                                borderRadius: BorderRadius.circular(
                                    50.0), 
                              ), //widget
                              prefixIcon: Icon(Icons.email),
                              errorStyle: const TextStyle(
                                color: Colors.red, 
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the email'; 
                            }
                            return null;
                          },
                        )),

                    Container(
                        width: 300, 
                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: !IsPasswordVisible,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Color(0xFF638889)), 
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(
                                        0xFF638889)), 
                                borderRadius: BorderRadius.circular(
                                    50.0), // Circular border on focus
                              ), 
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  IsPasswordVisible
                                      ? Icons.visibility //true
                                      : Icons.visibility_off, //false
                                ),
                                onPressed: () {
                                  setState(() {
                                    IsPasswordVisible = !IsPasswordVisible;
                                  });
                                },
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.red, // Error text color
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password'; 
                            }
                            return null;
                          },
                        )),

                    Container(
                        width: 300, 
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Color(0xFF638889)), 
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(
                                        0xFF638889)), 
                                borderRadius: BorderRadius.circular(
                                    50.0), 
                              ), 
                              prefixIcon: Icon(Icons.password),
                              errorStyle: const TextStyle(
                                color: Colors.red, 
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password'; 
                            }
                            return null;
                          },
                        )),
                    SizedBox(height: 15),
                    //SIGN UP BUTTON
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      }, //END ON pressed
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 120, vertical: 13)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(
                            color:
                                Color.fromRGBO(99, 136, 137, 1), // Border color
                            width: 2, // Border width
                          ),
                        )),
                      ),
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(99, 136, 137, 1))),
                    ),

                    SizedBox(height: 10),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label: const Text('Sign in with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF638889),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(300, 50),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),

                    SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 100, 94, 94),
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign In',
                              style: TextStyle(color: Color(0xFF638889)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] 

                  ),
            )));
  }
}
