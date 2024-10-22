import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  const Trip({super.key});

  @override
  TripState createState() => TripState();
}

class TripState extends State<Trip> {
  Set<String> select = {'Airplane'};

  void updateSelected(Set<String> newSelection) {
    setState(() {
      select = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String userName = "Hello, Rama";
    final Color customColor = Color(0xFF638889);
    // content based on the selected segment
    Widget selectedScreen =select.contains('Airplane') ? Airplane() : Caravan();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    userName + "👋",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: customColor,
                      fontFamily: "TimesNewRoman",
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
        centerTitle: false, // Keep title aligned to the left
      ),
      body: Column(
        children: [
          // Segmented Button for switching between screens
          SizedBox(
            height: 90,
            child: Center(
              child: SegmentedButton(
                multiSelectionEnabled: false,
                segments: <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Airplane',
                    label: Text('Airplane',
                        style: TextStyle(
                            fontFamily: 'TimesNewRoman',
                            fontWeight: FontWeight.bold)),
                    icon: Icon(Icons.airplanemode_active),
                  ),
                  ButtonSegment<String>(
                    value: 'Caravan',
                    label: Text('Caravan',
                        style: TextStyle(
                            fontFamily: 'TimesNewRoman',
                            fontWeight: FontWeight.bold)),
                    icon: Icon(Icons.directions_car),
                  ),
                ],
                selected: select,
                onSelectionChanged: updateSelected,
                showSelectedIcon: false,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 253, 243, 227)),
                ),
              ),
            ),
          ),
          // Display the selected screen content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.elasticOut,
                  )),
                  child: child,
                );
              },
              child: selectedScreen,
            ),
          ),
        ],
      ),
    );
  }
}

class Airplane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // تحكمتلي فالفراغ اللي بالنص بين الود[ت اللي شايله الصور
              children: [
                RahaalCustomWidget().destinationCard(
                  imagePath: "images/mexico.png",
                  title: "Palenque, Mexico",
                  price: "6000 SR",
                ),
                RahaalCustomWidget().destinationCard(
                  imagePath: "images/hawaiian.png",
                  title: "Hawaiian Island",
                  price: "9000 SR",
                ),
              ]),
          SizedBox(
            height: 20,
          ),
          Row(
            //father row 2 for third and fourth img
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RahaalCustomWidget().destinationCard(
                imagePath: "images/turkiye.png",
                title: "Cappadocia, Türkiye",
                price: "5500 SR",
              ),
              RahaalCustomWidget().destinationCard(
                imagePath: "images/alula.png",
                title: "Alula, Saudi Arabia",
                price: "7000 SR",
              ),
            ],
          )
        ]));
  }
}

class Caravan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(height: 15),
          Row(
              //father row of all
              //there is outer the center
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // تحكمتلي فالفراغ اللي بالنص بين الودكت اللي شايله الصور
              children: [
                Stack(// inside the father row
                    children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        30), // Adjust to change corner radius
                    child: SizedBox(
                      width: 200,
                      height: 298,
                      child: Image.asset(
                        "images/caravan.png",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30, // Adjust based on your design
                    left: 16,
                    right: 16,
                    child: Container(
                      padding:
                          EdgeInsets.all(8), // Padding inside the container
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.7), // rec background
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      child: Column(
                        children: [
                          // Title
                          Text(
                            'Lebanon , Turkey , Georgia',
                            style: TextStyle(
                                fontFamily: 'TimesNewRoman',
                                fontSize: 11,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Days: 14 , People:3 , Budget : 10000 ',
                            style: TextStyle(
                                fontFamily: 'TimesNewRoman',
                                fontSize: 8,
                                color: Colors.amber[900],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ]),
        ]));
  }
}

class RahaalCustomWidget extends StatelessWidget {
  RahaalCustomWidget({super.key});

  Widget destinationCard({
    required String imagePath,
    required String title,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: 200,
              height: 298,
              child: Image.asset(imagePath),
            ),
          ),
          Positioned(
            bottom: 39,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'TimesNewRoman',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'TimesNewRoman',
                            fontSize: 14,
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget StarRating() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < 5 ? Icons.star : Icons.star,
          color: index < 4 ? Colors.amber[900] : Colors.grey,
          size: 15,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
