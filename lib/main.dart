import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
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
            onPressed: _launchURL,
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
    precacheImage(new AssetImage('images/robot1.png'), context);
    precacheImage(new AssetImage('images/robot2.png'), context);
    precacheImage(new AssetImage('images/robot3.png'), context);
    precacheImage(new AssetImage('images/robot4.png'), context);
    precacheImage(new AssetImage('images/robot5.png'), context);
    precacheImage(new AssetImage('images/robot6.png'), context);
    precacheImage(new AssetImage('images/robot7.png'), context);
    precacheImage(new AssetImage('images/robot8.png'), context);
    precacheImage(new AssetImage('images/robot9.png'), context);
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            robotNumber = Random().nextInt(7) + 2;
            print(robotNumber);
          });
        },
        child: Image.asset('images/robot$robotNumber.png'),
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
