import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListVideo extends StatefulWidget {
  ListVideo({required this.url});
  final String url;

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: true,
        autoPlay: false,
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: kBackgroundColor,
            // ),
            body: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 35),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: player,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
