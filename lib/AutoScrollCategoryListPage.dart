import 'package:flutter/material.dart';

class AutoScrollCategoryListPage extends StatefulWidget {
  @override
  _AutoScrollCategoryListPageState createState() => _AutoScrollCategoryListPageState();
}


class _AutoScrollCategoryListPageState extends State<AutoScrollCategoryListPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..addListener(() {
        _scroll();
      });

    _startAutoScroll();
  }
  

  void _startAutoScroll() {
    _animationController.repeat(reverse: false);
  }

  void _scroll() {
    _scrollOffset += 1;
    if (_scrollController.position.maxScrollExtent - _scrollOffset <= 0) {
      _scrollOffset = 0;
      _scrollController.jumpTo(0);
    }

    _scrollController.jumpTo(_scrollOffset);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 1000,
        itemBuilder: (context, index) {
          return categoryTile(
            _getCategoryIcon(index % 4),
            _getCategoryLabel(index % 4),
            const Color.fromARGB(255, 247, 247, 247),
          );
        },
      ),
    );
  }

  IconData _getCategoryIcon(int index) {
    switch (index) {
      case 0:
        return Icons.place;
      case 1:
        return Icons.directions_bike;
      case 2:
        return Icons.directions_bus;
      case 3:
        return Icons.restaurant;
      default:
        return Icons.category;
    }
  }

  String _getCategoryLabel(int index) {
    switch (index) {
      case 0:
        return "Map";
      case 1:
        return "Activities";
      case 2:
        return "Transportation";
      case 3:
        return "Food";
      default:
        return "Category";
    }
  }

  Widget categoryTile(IconData icon, String label, Color backgroundColor) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: Color(0xFF638889)),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF638889),
              fontWeight: FontWeight.bold,
              fontFamily: "TimesNewRoman",
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}