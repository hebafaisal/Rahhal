// import 'signUp.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // for centering everything
        child: Container(
          width: 390,
          height: 844,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ), //Container for the image

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
                        borderRadius:
                            BorderRadius.circular(50.0), // Circular border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF638889)), // Custom color on focus
                        borderRadius: BorderRadius.circular(
                            50.0), // Circular border on focus
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Password Field
                Container(
                  width: 350, // Fixed field width
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(50.0), // Circular border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF638889)), // Custom color on focus
                        borderRadius: BorderRadius.circular(
                            50.0), // Circular border on focus
                      ),
                    ),
                    obscureText: true, // to hide it
                  ),
                ),
                const SizedBox(height: 50),
                // Sign-in Button
                ElevatedButton(
                  onPressed: () {}, // for the DB
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xFF638889), // Set text color
                      fontSize: 18, // Set font size
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF638889),
                      ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => signUp()),
                    // );
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
    );
  }
}
