import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/SignIn.dart';

class StartUp extends StatelessWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Extends the body behind the app bar if necessary
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              "images/startUp.png", // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          // Content that goes on top of the image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  //like padding
                  child: const Text(
                    "Explore the world \nwith us!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 136, 137),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                       fontFamily: 'TimesNewRoman',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 190),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, // provide info for where the navigate from
                      MaterialPageRoute(
                          builder: (context) =>
                              SignIn()), //transition animation when navigating
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        //define properties that depend on a widget’s interactive state
                        Color.fromARGB(255, 99, 136, 137)),
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 130, vertical: 15)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
                  ),
                  child: const Text("Get Start",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TimesNewRoman',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 252, 253, 253))),
                ),
                // SizedBox(height: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
