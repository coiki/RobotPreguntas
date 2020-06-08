import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
      MaterialApp(
        home: RobotPage(),
      ),
    );

class RobotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('A420 Respuestas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            'Haz una pregunta sobre tu jefe',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'y toca al robot en sus partes íntimas.',
            style: TextStyle(fontSize: 14.0),
          ),
          // DisplayedText(), //removing this, to push to git
          Robot(),
          FlatButton(
            onPressed: () {
              final player = AudioCache();
              player.play('audios/sonido2.mp3');
              _launchURL();
            },
            child: Image(
              image: AssetImage('images/anuncio.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class Robot extends StatefulWidget {
  @override
  _RobotState createState() => _RobotState();
}

class _RobotState extends State<Robot> {
  int robotNumber = 1;

  @override
  Widget build(BuildContext context) {
    //Audio player creation
    final player = AudioCache();

    // To force stop after playing each sound.
    player.fixedPlayer;

    //Assets caching (images and mp3s)
    precacheImage(new AssetImage('images/Artboard1.png'), context);
    precacheImage(new AssetImage('images/Artboard2.png'), context);
    precacheImage(new AssetImage('images/Artboard3.png'), context);
    precacheImage(new AssetImage('images/Artboard4.png'), context);
    precacheImage(new AssetImage('images/Artboard5.png'), context);
    precacheImage(new AssetImage('images/Artboard6.png'), context);
    precacheImage(new AssetImage('images/Artboard7.png'), context);
    precacheImage(new AssetImage('images/Artboard8.png'), context);
    precacheImage(new AssetImage('images/Artboard9.png'), context);
    precacheImage(new AssetImage('images/Artboard10.png'), context);
    precacheImage(new AssetImage('images/Artboard11.png'), context);
    precacheImage(new AssetImage('images/Artboard12.png'), context);
    precacheImage(new AssetImage('images/Artboard13.png'), context);
    precacheImage(new AssetImage('images/Artboard14.png'), context);
    precacheImage(new AssetImage('images/Artboard15.png'), context);
    precacheImage(new AssetImage('images/Artboard16.png'), context);
    /*player.load("audios/1.mp3");
    player.load("audios/2.mp3");
    player.load("audios/3.mp3");
    player.load("audios/4.mp3");
    player.load("audios/5.mp3");
    player.load("audios/6.mp3");
    player.load("audios/7.mp3");
    player.load("audios/8.mp3");
    player.load("audios/9.mp3");
    player.load("audios/10.mp3");
    player.load("audios/11.mp3");
    player.load("audios/12.mp3");
    player.load("audios/13.mp3");
    player.load("audios/14.mp3");
    player.load("audios/15.mp3");
    player.load("audios/16.mp3");*/

    // Returned Widget
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            robotNumber = Random().nextInt(15) + 1;
            player.play('audios/$robotNumber.mp3'); // Plays the sound
          });
        },
        child: Image.asset(
            'images/Artboard$robotNumber.png'), // Displays the robot PNGs that display the message
      ),
    );
  }
}

class DisplayedText extends StatefulWidget {
  @override
  _DisplayedTextState createState() => _DisplayedTextState();
}

class _DisplayedTextState extends State<DisplayedText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: TypewriterAnimatedTextKit(
          onTap: () {
            print(
              _getPhrase(),
            );
            setState(() {
              _getPhrase();
            });
          },
          text: [
            _getPhrase(),
          ],
          isRepeatingAnimation: false,
          textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
    );
  }
}

_launchURL() async {
  const url = 'https://afterworkenespanol.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_getPhrase() {
  var randomizado = "";
  var phrases = [
    "Tu jefe es un INCOMPETENTE",
    "Tu jefe es un CABRÓN",
    "Tu jefa es IMBÉCIL",
    "Tu jefa no sirve para nada",
    "Tu jefe es un caraverga"
  ];
  randomizado = phrases[Random().nextInt(4)];
  return randomizado;
}
