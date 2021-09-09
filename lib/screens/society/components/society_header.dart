import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SocietyHeader extends StatelessWidget {
  const SocietyHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.1,
          color: Colors.white,
          child: GestureDetector(
            onTap: () => {
              Get.bottomSheet(
                SingleChildScrollView(
                  child: Container(
                    height: size.height * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                    child: Wrap(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/564x/17/48/b8/1748b8d49e757abc69a74218120193c8.jpg'),
                          ),
                          title: Text(
                            'Trong Tam',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Poppins-SemiBold'),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Post',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor('#E68F839C')),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: size.width,
                          child: TextField(
                            cursorHeight: 25,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: TextStyle(fontSize: 25),
                              border: InputBorder.none,
                            ),
                            autofocus: true,
                          ),
                        ),
                        Center(
                            child: Image.asset(
                          "assets/images/add_image.png",
                          width: size.width * 0.3,
                          height: size.height * 0.2,
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/17/48/b8/1748b8d49e757abc69a74218120193c8.jpg'),
                ),
                SizedBox(
                  width: 14,
                ),
                Image.asset(
                  'assets/images/society_seach.jpg',
                  width: size.width * 0.8,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
