import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  const GridContainer(
      {super.key,
      required this.title,
      required this.route,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    TextStyle(color: Theme.of(context).scaffoldBackgroundColor, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
