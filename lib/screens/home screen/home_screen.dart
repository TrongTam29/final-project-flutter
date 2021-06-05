import 'package:flutter/material.dart';
import 'package:my_app/screens/home%20screen/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeAppBar(), body: Body());
  }

  // ignore: non_constant_identifier_names
  AppBar HomeAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: null,
      title: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          'Fit Body',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
            fontFamily: 'AdventPro',
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_horiz_outlined),
          onPressed: () {},
          tooltip: 'Menu',
          iconSize: 30,
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
        )
      ],
    );
  }
}
