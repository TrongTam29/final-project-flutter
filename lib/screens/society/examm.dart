import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CommentExercise extends StatelessWidget {
  const CommentExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final channel = IOWebSocketChannel.connect('ws://192.168.1.7:3000');
  var user = FirebaseAuth.instance.currentUser;
  List<String> messages = [];
  // @override
  // void initState() {
  //   super.initState();
  //   channel.stream.listen((event) {
  //     print(event);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) messages.add('${snapshot.data}');
                return Flexible(
                  child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minLeadingWidth: 2,
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                user!.photoURL!,
                              )),
                          title: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]),
                            child: RichText(
                              text: TextSpan(
                                  text: '${user!.displayName}\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: messages[index],
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 17,
                                          fontFamily: 'PragatiNarrow-Regular',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    )
                                  ]),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
            Divider(
              height: 2,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 0, left: 0),
                  height: 40,
                  width: size.width * 0.8 - 15,
                  child: TextField(
                    controller: _controller,
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
                  margin: EdgeInsets.only(bottom: 10, left: 5),
                  child: IconButton(
                      onPressed: () {
                        comment();
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        size: 30,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Comment _comment = Comment(userId: 1, exerciseId: 1, comment: 'commnet');
  Future<void> comment() async {
    channel.sink.add(exerciseCommentModelToJson(_comment));

    // channel.sink.add(_controller.text);
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
