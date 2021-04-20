import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
    @required this.items,
    this.onPressed,
    this.selectedIndex = 0,
  }) : super(key: key);

  final List<NavBarItem> items;
  final ValueChanged<int> onPressed;
  final int selectedIndex;

  List<Widget> _buildNavBarItems() {
    return items.asMap().entries.map((entry) {
      int index = entry.key;
      NavBarItem item = entry.value;

      return IconButton(
        onPressed: onPressed == null ? null : () => onPressed(index),
        icon: Icon(
          item.iconData,
          color: index == selectedIndex ? Colors.pink : Colors.grey,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildNavBarItems(),
      ),
    );
  }
}

class NavBarItem {
  const NavBarItem({
    @required this.iconData,
  });

  final IconData iconData;
}
