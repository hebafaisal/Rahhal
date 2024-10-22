import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/FinancialManagement.dart';
import 'package:flutter_application_rahhal/Trip.dart';
import 'AutoScrollCategoryListPage.dart';
import 'profile.dart';

class SimpleBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //is what will be drawn to the screen as the widget's visual structure
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
              color: Colors.grey.withOpacity(
                  0.5), // Shadow color .withOpacity(0.5) make it the color more light
              spreadRadius: 5, // the shodow around the nav
              blurRadius: 10, // the shadow make it smothly
              offset: Offset(0, 3), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, //it means that the children inside the Row will be spaced evenly along the horizontal axis
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Color(0xFF638889)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            CircleAvatar(
              radius: 20, // Size of the circle
              backgroundColor: Color(0xFF638889), // Green circle background
              child: IconButton(
                icon:
                    Icon(Icons.home, color: Colors.white), // White person icon
                onPressed: () {},
              ),
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

// HomePage implementation
class HomePage extends StatelessWidget {
  final String userName =
      "Hello, Rama"; // Replace with dynamic user data if needed
  final Color customColor = Color(0xFF638889);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // body of the mobile
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // horizental alignment
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0, // Change the avatar size
                    backgroundImage: NetworkImage(
                        'https://edequitylab.org/wp-content/uploads/2022/12/Screen-Shot-2022-12-01-at-10.21.56-AM.png'), // Replace with actual avatar URL
                  ),
                  SizedBox(width: 10), // Space between avatar and name
                  Text(
                    userName + " 👋",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TimesNewRoman",
                      color: customColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 35,
                    color: customColor,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.list,
                      size: 35,
                    ), // Bell icon
                    tooltip: 'list', // Tooltip for the list icon
                    color: customColor,
                    onPressed: () {
                      print("Notifications button pressed");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        centerTitle:
            false, //ensures that the custom title layout with the user avatar and name remains left-aligned, with differ devices
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // start the element in the vertical
          crossAxisAlignment:
              CrossAxisAlignment.start, //aligh x axis to the left side
          children: [
            // the space between app bar and body
            SizedBox(height: 36),
            Container(
              child: Row(
                children: [
                  Text(
                    "Where do you want to go?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TimesNewRoman",
                      color: customColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

// Search Icon
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for exciting tours',
                hintStyle: TextStyle(
                  color: customColor, // Set the color of the hint text here
                  fontSize: 15,
                  fontFamily:
                      "TimesNewRoman", // You can also adjust the font size if needed
                ),

                enabledBorder: OutlineInputBorder(
                  // to draw the search container
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors
                        .transparent, // Set enabled border color to transparent
                  ),
                ),
                prefixIcon: Icon(Icons.search), // search icon inleft side
                fillColor: Color.fromARGB(255, 244, 241, 241),
                filled: true, // To ensure the background is fiiled
              ),
            ),

            SizedBox(height: 50),
// Categoreies fields
            Container(
              child: Row(
                children: [
                  Text(
                    "What we offer?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TimesNewRoman",
                      color: Color(0xFF638889),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            AutoScrollCategoryListPage(),

            SizedBox(height: 60),
// Our services
            Container(
              child: Row(
                children: [
                  Text(
                    "Our Services",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TimesNewRoman",
                      color: Color(0xFF638889),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 160, // Set height for the bottom section
              child: ListView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                children: [
                  bottomBox(Icons.tour, "100+ Top tours"), // First box
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinancialManagement()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.zero, // Make button rectangular
                      ),
                    ),
                    child: bottomBox(
                        Icons.account_balance_wallet, "Financial management"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Trip()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.zero, // Make button rectangular
                      ),
                    ),
                    child: bottomBox(Icons.map, "Ready Trips"), // Third box
                  ), // Third box
                  bottomBox(
                      Icons.alarm, "Create your own trip"), // Fourth box
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          SimpleBottomNavBar(), // bottomNavigationBar This property specifies the widget that will be displayed at the bottom of the screen.
    );
  }
}

// This method builds a category tile with an icon, label, and background color
Widget categoryTile(IconData icon, String label, Color backgroundColor) {
  return Container(
    width: 100, // Width of each category card
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    // Space between each category
    decoration: BoxDecoration(
      color: backgroundColor, // Background color (white or light gray)
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black12, // Slight shadow effect to give it elevation
          blurRadius: 8.0, // How much the shadow should blur
          offset: Offset(2, 2), // Position of the shadow
        ),
      ],
    ),
    // Style Icons and Texts
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Align items to center
      children: [
        Icon(icon, // the icon in the method
            size: 40,
            color: Color(0xFF638889)), // Icon in the category tile
        SizedBox(height: 10), // Space between icon and label
        Text(
          label, // we called in metheds
          style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF638889),
              fontWeight: FontWeight.bold,
              fontFamily: "TimesNewRoman"), // Style for category label
          textAlign: TextAlign.center, // Center the text inside the tile
        ),
      ],
    ),
  );
}

// This method builds the bottom box with an icon and label
Widget bottomBox(IconData icon, String label) {
  return Container(
    // what this function will produce when it is called.
    width: 170, // Width of each box
    margin:
        // EdgeInsets.symmetric(horizontal: 8.0),
        EdgeInsets.symmetric(horizontal: 8.0), // Space between each box
    decoration: BoxDecoration(
      color: const Color.fromARGB(
          255, 247, 247, 247), // Background color of the box
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black12, // Slight shadow for elevation
          blurRadius: 4.0, // Blur radius for shadow
          offset: Offset(0, 2), // Position of the shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Align content to center
      children: [
        // Icon(icon, size: 40, color: Color(0xFF638889)),
        CircleAvatar(
          radius: 27, // border size of the circle
          backgroundColor: Color(0xFF638889), // Green circle background
          child: IconButton(
            icon: Icon(icon,
                size: 30,
                color: Color.fromARGB(
                    255, 255, 255, 255)), // Use `icon` as a named parameter
            onPressed: () {
              // Define what happens when the button is pressed
            },
          ),
        ),
        SizedBox(height: 10), // Space between icon and label
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "TimesNewRoman",
            color: Color(0xFF638889),
          ),
          textAlign: TextAlign.center, // Align label to center
        ),
      ],
    ),
  );
}
