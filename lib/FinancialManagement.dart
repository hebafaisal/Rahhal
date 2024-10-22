import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/Calculator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

// Parent widget => This widget is responsible for displaying the financial summary, including total budget, total spending, and a pie chart showing expenses by category. It also provides an option for users to update their finances by opening a calculator interface.

// How the Data is Passed???? IMPORTENR to read it :}
// 1. When a user clicks the "Calculate your budget" button line 198, a modal bottom sheet opens, displaying the Calculator widget. During this process, the parent widget passes its data to the child widget.
// 2. Once the user interacts with the calculator and updates either their budget or adds new expenses, the Calculator widget sends the updated data back to the parent widget using a callback function onFinancesUpdated in line 9.

class FinancialManagement extends StatefulWidget {
  @override
  _FinancialManagementState createState() => _FinancialManagementState();
}

class _FinancialManagementState extends State<FinancialManagement> {
  double totalBudget = 0;
  double totalSpending = 0;
  double remainingBudget = 0;
  Map<String, double> categoryExpenses =
      {}; //a map that tracks the user spending via category تقبل نوعين

  final List<Map<String, dynamic>> categories = [
    {'name': 'Entertainments', 'color': Colors.pink},
    {'name': 'Groceries', 'color': Colors.blue},
    {'name': 'Shopping', 'color': Colors.green},
    {'name': 'Transport', 'color': Colors.orange},
    {'name': 'Housing', 'color': Colors.red},
    {'name': 'Restaurants', 'color': Colors.deepPurpleAccent},
    {'name': 'Other', 'color': Colors.grey},
  ];

  // This function updates the financial data and automatically updates the UI.
  void _updateFinances(
      double budget, double spending, Map<String, double> expensesByCategory) {
    setState(() {
      totalBudget = budget;
      totalSpending = spending;
      remainingBudget = totalBudget - totalSpending;
      categoryExpenses = expensesByCategory;
    });
  }

  //This function finds the matching color for each expense category. If no match is found, it defaults to grey.
  List<Color> getColorList() {
    return categoryExpenses.keys.map((categoryName) {
      final category = categories.firstWhere(
        (cat) => cat['name'] == categoryName,
        orElse: () => {'name': 'Unknown', 'color': Colors.grey},
      );
      return category['color'] as Color;
    }).toList();
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // margin: EdgeInsets.only(top: 20),
            child: Text(
              "Financial Report",
              style: TextStyle(
                  color: Color(0xFF638889),
                  fontSize: 30,
                  fontFamily: "TimesNewRoman",
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: 350,
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 193, 191, 191).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                Text(
                  "Where did your money go?",
                  style: TextStyle(
                    color: Color(0xFF638889),
                    fontSize: 20,
                    fontFamily: "TimesNewRoman",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                categoryExpenses.isNotEmpty
                    ? PieChart(
                        // This part shows the pie chart if expenses exist
                        dataMap: categoryExpenses,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 2.7,
                        colorList: getColorList(),
                        chartType: ChartType.disc,
                        ringStrokeWidth: 32,
                        // centerText: "Expenses",
                        legendOptions: LegendOptions(
                          showLegendsInRow: true,
                          legendPosition: LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: GoogleFonts.alata(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 39, 38, 38),
                            ),
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          decimalPlaces: 1,
                        ),
                      )
                    : Text(
                        // This part is like else, if not exist show this message
                        "No expenses available",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 4, 4),
                          fontSize: 20,
                          fontFamily: "TimesNewRoman",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ]),
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 193, 191, 191).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total Budget: ${remainingBudget.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Color(0xFF638889),
                  fontSize: 22,
                  fontFamily: "TimesNewRoman",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 193, 191, 191).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total expenses: ${totalSpending.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Color(0xFF638889),
                  fontSize: 22,
                  fontFamily: "TimesNewRoman",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 45),

          //An "Calculate your budget" button at the bottom of the page. When clicked, it opens a Calculator (a custom widget) where the user can update the budget and expenses.
          ElevatedButton.icon(
            onPressed: () {
              //A bottom sheet is a panel that slides up from the bottom of the screen and typically contains additional options or interactive elements.
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                //This builds the widget to display in the bottom sheet. In this case its a Calculator widget.
                builder: (context) => Calculator(
                  onFinancesUpdated:
                      _updateFinances, // Passes the function to update finances. the purpose? When the user makes changes inside the calculator, this function will handle updating the displayed budget and expenses.
                  budget: totalBudget,
                  totalExpenses: totalSpending,
                  initialCategoryExpenses: categoryExpenses,
                ),
                isScrollControlled: true,
              );
            },
            icon: Icon(Icons.calculate),
            label: Text(
              'Calculate your budget',
              style: TextStyle(
                color: Color(0xFF638889),
                fontSize: 20,
                fontFamily: "TimesNewRoman",
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF638889),
              side: BorderSide(color: Color(0xFF638889), width: 1.5),
              minimumSize: const Size(350, 50),
            ),
          ),
        ], // children
      ),
    );
  }
}
