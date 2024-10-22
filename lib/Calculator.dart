import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/FinancialManagement.dart';
import 'package:google_fonts/google_fonts.dart';

// Child widget => This widget allows users to input or update their budget and expenses, and categorize them. Once a user makes changes, it sends the updated data back to the parent widget.

class Calculator extends StatefulWidget {
  //A callback function that informs the parent(FinancialManagement) widget whenever the budget or expenses are updated.
  final Function(double, double, Map<String, double>) onFinancesUpdated;
  final double budget;
  final double totalExpenses;
  final Map<String, double>
      initialCategoryExpenses; //a map that tracks the user spending via category تقبل نوعين

  Calculator({
    required this.onFinancesUpdated,
    this.budget = 0,
    this.totalExpenses = 0,
    this.initialCategoryExpenses = const {},
  });

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calculator> {
  double totalBudget = 0;
  double totalExpenses = 0;
  double lastSpending = 0;
  String selectedCategory = '';
  late Map<String, double> categoryExpenses;

  //_budgetController and _expenseController manage text input fields for the budget and expenses
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Entertainments',
      'color': Colors.pink,
      'icon': Icons.emoji_symbols
    },
    {
      'name': 'Groceries',
      'color': Colors.blue,
      'icon': Icons.shopping_bag_rounded
    },
    {'name': 'Shopping', 'color': Colors.green, 'icon': Icons.shopping_cart},
    {'name': 'Transport', 'color': Colors.orange, 'icon': Icons.directions_car},
    {'name': 'Housing', 'color': Colors.red, 'icon': Icons.home},
    {
      'name': 'Restaurants',
      'color': Colors.deepPurpleAccent,
      'icon': Icons.fastfood
    },
    {'name': 'Other', 'color': Colors.grey, 'icon': Icons.add_reaction_sharp},
  ];

  // This method is called when the widget is first created, before it is displayed on the screen.
  //الغرض منها عشان يكون عندنا قيم اوليه
  @override
  void initState() {
    super.initState();
    totalBudget = widget.budget;
    totalExpenses = widget.totalExpenses;
    categoryExpenses = Map.from(widget.initialCategoryExpenses);
    _budgetController.text = totalBudget.toString();
  }

  //This method is called whenever the user adds a new expense.
  void addExpense(String category, double expense) {
    setState(() {
      if (expense > 0) {
        categoryExpenses.update(
          category, (value) => value + expense, ifAbsent: () => expense,
          // ifAbsent => tells the map what to do if the key (category) does not exist.
        );
        totalExpenses += expense;
        lastSpending = expense;

        // Call parent widget to update the finances
        widget.onFinancesUpdated(totalBudget, totalExpenses, categoryExpenses);
      }
    });
  }

  // A helper method that calls onFinancesUpdated to notify the parent widget when any change occurs. like the pie chart
  void processExpenses() {
    widget.onFinancesUpdated(
      totalBudget,
      totalExpenses,
      categoryExpenses,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.87,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xFF638889),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      totalBudget = double.tryParse(value) ?? totalBudget;
                      processExpenses();
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Enter your budget",
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xFF638889),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  onChanged: (value) {
                    double expense = double.tryParse(value) ?? 0.0;
                    if (expense > 0 && selectedCategory.isNotEmpty) {
                      addExpense(selectedCategory, expense);
                      _expenseController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Enter your expenses",
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xFF638889),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 193, 191, 191)
                          .withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categorize your expenses",
                        style: TextStyle(
                            color: Color(0xFF638889),
                            fontSize: 20,
                            fontFamily: "TimesNewRoman",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 13.0,
                        runSpacing: 15.0,
                        children: categories.map((category) {
                          return FilterChip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                category['icon'],
                                color: category['color'],
                              ),
                            ),
                            label: Text(
                              category['name'],
                              style: TextStyle(
                                color: Color.fromARGB(255, 39, 38, 38),
                                fontSize: 18,
                                fontFamily: "TimesNewRoman",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            selected: selectedCategory == category['name'],
                            onSelected: (bool selected) {
                              setState(() {
                                selectedCategory =
                                    selected ? category['name'] : '';
                              });
                            },
                            selectedColor: category['color'].withOpacity(0.4),
                            showCheckmark: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: category['color'], width: 2),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text(
                  'Done',
                  style: TextStyle(
                    color: Color(0xFF638889),
                    fontSize: 20,
                    fontFamily: "TimesNewRoman",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(Icons.done_all_rounded),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF638889),
                  side: BorderSide(color: Color(0xFF638889), width: 1.5),
                  minimumSize: const Size(350, 50),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Since TextEditingController holds resources, it’s important to clean them up when the widget is no longer used.
  @override
  void dispose() {
    _budgetController.dispose();
    _expenseController.dispose();
    super.dispose();
  }
}
