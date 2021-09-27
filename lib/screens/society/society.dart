import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/society/components/society_header.dart';

class Society extends StatefulWidget {
  const Society({Key? key}) : super(key: key);

  @override
  _SocietyState createState() => _SocietyState();
}

class _SocietyState extends State<Society> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SocietyAppBar(),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SocietyHeader(size: size),
            contentList(size),
            contentList(size),
            contentList(size),
            contentList(size),
            contentList(size),
            contentList(size),
          ],
        ),
      ),
    );
  }

  Container contentList(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: GestureDetector(
        onTap: () => {
          commentFunc(size, false),
        },
        child: Column(
          children: [
            SizedBox(
              width: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/17/48/b8/1748b8d49e757abc69a74218120193c8.jpg'),
              ),
              title: Text(
                'Trong Tam',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins-SemiBold'),
              ),
              subtitle: Text('2/9/2021'),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              title: Text(
                'Today I have some problem !!!',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: ListTile(
                    minLeadingWidth: 2,
                    leading: Icon(
                      Icons.thumb_up,
                      size: 20,
                      color: kPrimaryColor,
                    ),
                    title: Text('1.075 '),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.3 - 10,
                  child: Text(
                    '132 Comments',
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    minLeadingWidth: 2,
                    leading: Icon(Icons.thumb_up_alt_outlined),
                    title: Text('Like'),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      minLeadingWidth: 2,
                      leading: Icon(Icons.textsms_outlined),
                      title: Text('Comment'),
                    ),
                  ),
                  onTap: () => {
                    commentFunc(size, true),
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> commentFunc(Size size, bool autoFocus) {
    return Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          height: Get.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                minLeadingWidth: 2,
                leading: Icon(
                  Icons.thumb_up,
                  size: 20,
                  color: kPrimaryColor,
                ),
                title: Text('1.075 '),
                trailing: Icon(Icons.thumb_up_alt_outlined),
              ),
              Divider(
                height: 0,
              ),
              Flexible(
                child: ListView(
                  children: [
                    listComment(),
                    listComment(),
                    listComment(),
                    listComment(),
                    listComment(),
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    height: 40,
                    width: size.width * 0.8,
                    child: TextField(
                      autofocus: autoFocus,
                      decoration: InputDecoration(
                        hintText: ' Write a comment...',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 1, left: 8),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_rounded,
                          size: 30,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  ListTile listComment() {
    return ListTile(
      minLeadingWidth: 2,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
            'https://i.pinimg.com/564x/17/48/b8/1748b8d49e757abc69a74218120193c8.jpg'),
      ),
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
        child: RichText(
          text: TextSpan(
              text: 'Trong Tam\n',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'PragatiNarrow-Bold',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              children: [
                TextSpan(
                  text: 'I can solve it for you, bro\na\nád\nas',
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 18,
                      fontFamily: 'PragatiNarrow-Regular',
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                )
              ]),
        ),
      ),
    );
  }
}

class SocietyAppBar extends StatelessWidget {
  const SocietyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: TextButton(
        onPressed: () {},
        child: Text(
          'Fit Body',
          style: TextStyle(
              fontFamily: 'Poppins-Bold', fontSize: 30, color: kPrimaryColor),
        ),
      ),
      actions: [
        Container(
            // width: 36,
            // height: 36,
            padding: EdgeInsets.all(0.0001),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ))),
        SizedBox(
          width: 8,
        ),
        Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ))),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
