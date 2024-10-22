import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/Home.dart';
import 'package:flutter_application_rahhal/signUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() {
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool IsPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey, // Associated with the Form widget
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                    ),
                  ),

                  // Email Field Container
                  Container(
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xFF638889)),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red), // Red border on focused error
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        // Default floating label style (color will change based on error state)
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
                          return 'Please enter the email'; // This triggers the error state
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Password Field
                  Container(
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        // Consistent border across all states
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xFF638889)),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
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
                          color: Colors.red,
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
                      ),
                      obscureText: !IsPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Sign-in Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFF638889),
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(
                            width: 2, color: Color(0xFF638889)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Google Sign-in Button
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF638889),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(350, 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign-up page
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 100, 94, 94),
                          fontSize: 18,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(color: Color(0xFF638889)),
                          ),
                        ],
                      ),
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
