import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/detail%20cardio/component/timer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailCardio extends StatefulWidget {
  DetailCardio({required this.url, required this.nameCarido});
  final String url;
  final String nameCarido;

  @override
  _DetailCardioState createState() => _DetailCardioState();
}

class _DetailCardioState extends State<DetailCardio> {
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
        Size size = MediaQuery.of(context).size;
        var textStyle = TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  child: player,
                ),
                ListTile(
                  title: Text(
                    widget.nameCarido,
                    style: textStyle,
                  ),
                  subtitle: Text(
                    'Cardio and Lose weight',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.height * 0.1 - 60,
                    ),
                    TimerApp(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
