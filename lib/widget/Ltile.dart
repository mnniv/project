import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LTile extends StatelessWidget {
  String name;
  IconData icon;
  String route;
  LTile({
    required this.icon,
    required this.name,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
          Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
