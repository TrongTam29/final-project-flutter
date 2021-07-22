import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideo extends StatefulWidget {
  DetailVideo({required this.url});
  final String url;

  @override
  _DetailVideoState createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          var textStyle =
              TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      child: player,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Dumbblell Chest Press',
                      style: textStyle,
                    ),
                    subtitle: Text('Gym guide - Chest'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)),
                        color: HexColor('#DFCDCD'),
                        elevation: 10,
                        child: Container(
                          width: size.width * 0.3 - 5,
                          height: size.height * 0.2 - 20,
                          child: ListView(
                            children: [
                              ListTile(
                                title: Icon(Icons.access_alarm_outlined),
                                trailing: Text(
                                  'Reps',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Text(
                                '8 - 12',
                                style: textStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)),
                        color: HexColor('#D8D0E0'),
                        elevation: 10,
                        child: Container(
                          width: size.width * 0.3 - 5,
                          height: size.height * 0.2 - 20,
                          child: ListView(
                            children: [
                              ListTile(
                                title: Icon(Icons.fact_check_outlined),
                                trailing: Text(
                                  'Sets',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Text(
                                '3 - 4',
                                style: textStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)),
                        color: HexColor('#DAD2D2'),
                        elevation: 10,
                        child: Container(
                          width: size.width * 0.3 - 5,
                          height: size.height * 0.2 - 20,
                          child: ListView(
                            children: [
                              ListTile(
                                title: Icon(
                                  Icons.skip_next_outlined,
                                  size: 30,
                                ),
                                trailing: Text(
                                  'Break',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Text(
                                '20s - 30s',
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                      style: TextStyle(
                          fontFamily: 'Poppins-Light',
                          fontSize: 16,
                          color: Colors.black,
                          height: 2),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
