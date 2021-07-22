import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/components/appBar.dart';

class ListVideo extends StatelessWidget {
  const ListVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: "Chest",
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.2 + 10,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/images.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#C4C4C4'),
                    ),
                    child: Text(
                      'Dumbblell Chest Press',
                      style: TextStyle(
                          fontFamily: 'Poppins-SemiBold', fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
