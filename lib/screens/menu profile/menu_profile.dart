import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/login/login_controller.dart';
import 'package:my_app/screens/nitrition%20screen/components/user_bmi.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    var user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    var userBmi = UserBmi();
    return Scaffold(
      backgroundColor: HexColor('#5E96AE'),
      body: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user!.photoURL ??
                          'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                    ),
                    title: Text(
                      user.displayName ?? 'Trainer',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(user.email ?? 'User@gmail.com'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => Text(
                          'BMI: \t\t\t ' + userBmi.bmiUser.value,
                        ),
                      ),
                      Obx(() => Text('Height: ${userBmi.weightUser.value}  Kg'))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.alarm,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Alarm',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.build,
                    color: Colors.black,
                  ),
                  title: Text(
                    'BMI tool',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4 - 20,
                ),
                ListTile(
                  onTap: () {
                    controller.logoutGoogle();
                    controller.logOut();
                    Get.to(() => HelloScreen());
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
