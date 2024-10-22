import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/Home.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfilePage(),
//     );
//   }
// }

class SimpleBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20.0), // Space under the navigation bar
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 20), // Creates the cut effect on left and right
        padding: EdgeInsets.symmetric(
            vertical: 10), // Padding inside the navigation bar
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the bar
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Light shadow color
              spreadRadius: 5, // Shadow spread
              blurRadius: 10, // Smooth shadow
              offset: Offset(0, 3), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Space evenly along horizontal axis
          children: [
            CircleAvatar(
              radius: 20, // Size of the circle
              backgroundColor: Color(0xFF638889), // Green circle background
              child: IconButton(
                icon: Icon(Icons.person,
                    color: Colors.white), // White person icon
                onPressed: () {
                  // Handle person icon press
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFF638889)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  //to change pages (routes) in Flutter, // pushes the new page onto it and then removes all previous page
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) =>
                      false, // This removes all previous routes
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: Color(0xFF638889)),
              onPressed: () {
                // Handle bookmark icon press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 25, horizontal: 26), // Padding for the container
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 235, 234), // Background color
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          Colors.white, // the color of background avtar
                      backgroundImage: NetworkImage(
                          'https://edequitylab.org/wp-content/uploads/2022/12/Screen-Shot-2022-12-01-at-10.21.56-AM.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Rama Sabbagh',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "TimesNewRoman",
                      ),
                    ),
                    Text('ramasabbaghh20@gmail.com',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 83, 82, 82),
                          fontFamily: "TimesNewRoman",
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    // Buttons with white background
                    _buildMenuItem(context, Icons.edit, 'Edit Profile',
                        Icons.arrow_forward_ios, () {
                      // Navigate to edit profile page
                    }),
                    _buildMenuItem(context, Icons.help, 'Help & Support',
                        Icons.arrow_forward_ios, () {
                      // Navigate to help & support page
                    }),
                    _buildMenuItem(context, Icons.settings, 'Setting',
                        Icons.arrow_forward_ios, () {
                      // Navigate to settings page
                    }),
                    _buildMenuItem(context, Icons.logout, 'Logout',
                        Icons.arrow_forward_ios, () {
                      // Add logout functionality
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SimpleBottomNavBar(),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    IconData trailingIcon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8), // Space between cards
      child: ListTile(
          leading: Icon(
            icon,
            color: Color(0xFF638889), // color of icons
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xFF638889),
              fontFamily: "TimesNewRoman",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: Icon(trailingIcon,
              color: Color(0xFF638889)), // Add trailing icon here.head of arrow
          onTap: onTap,
          tileColor: Colors.white),
    );
  }
}
