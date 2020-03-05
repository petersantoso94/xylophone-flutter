import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
    var colorList = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.green.shade900,
      Colors.blue,
      Colors.purple,
    ];
    void playNote(int noteIndex) {
      _assetsAudioPlayer.stop();
      _assetsAudioPlayer.open('assets/note$noteIndex.wav');
      _assetsAudioPlayer.play();
    }

    Widget buildKey(int idx) => Expanded(
          child: FlatButton(
            color: colorList[idx - 1 % 7],
            onPressed: () {
              playNote(idx);
            },
          ),
        );

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1),
              buildKey(2),
              buildKey(3),
              buildKey(4),
              buildKey(5),
              buildKey(6),
              buildKey(7),
            ],
          ),
        ),
      ),
    );
  }
}
