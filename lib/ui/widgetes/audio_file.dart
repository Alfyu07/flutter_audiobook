import 'package:audioplayers/audioplayers.dart';
import 'package:ebooks_app/shared/app_textstyle.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();
  String path = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  // final String path =
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  final List _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    widget.advancedPlayer.onPlayerCompletion.listen((p) {
      setState(() {
        isPlaying = false;
        _position = const Duration(seconds: 0);
      });
    });

    widget.advancedPlayer.setUrl(path);
  }

  Widget btnLoop() => IconButton(
        icon: Icon(
          Icons.loop,
          size: 20,
          color: isLoop ? Colors.blue : Colors.black87,
        ),
        onPressed: () {
          if (isLoop) {
            widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
            setState(() {
              isLoop = false;
            });
          } else {
            widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
            setState(() {
              isLoop = true;
            });
          }
        },
      );
  Widget btnShuffle() => IconButton(
        onPressed: () {},
        icon: const ImageIcon(
          AssetImage('img/loop.png'),
          size: 20,
          color: Colors.black87,
        ),
      );
  Widget btnStart() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: IconButton(
          icon: Icon(
            isPlaying ? _icons[1] : _icons[0],
            size: 50,
            color: Colors.blue,
          ),
          onPressed: () {
            if (!isPlaying) {
              widget.advancedPlayer.play(path);
              setState(() {
                isPlaying = true;
              });
              return;
            } else {
              widget.advancedPlayer.pause();
              setState(() {
                isPlaying = false;
              });
            }
          },
        ),
      );

  Widget btnForward() => IconButton(
        onPressed: () {},
        icon: const ImageIcon(
          AssetImage('img/forward.png'),
          size: 15,
          color: Colors.black87,
        ),
      );
  Widget btnBackward() => IconButton(
        onPressed: () {},
        icon: const ImageIcon(
          AssetImage('img/backword.png'),
          color: Colors.black87,
          size: 15,
        ),
      );

  Widget btnFwd10() => IconButton(
      onPressed: () {
        const add10s = Duration(seconds: 10);
        final tmpPosition = _position + add10s;
        setState(() {
          changeToSecond(tmpPosition.inSeconds.toInt());
        });
      },
      icon: const Icon(
        Icons.forward_10,
        size: 30,
        color: Colors.black87,
      ));
  Widget btnBwd10() => IconButton(
      onPressed: () {
        const min10s = Duration(seconds: 10);
        final tmpPosition = _position - min10s;
        setState(() {
          changeToSecond(tmpPosition.inSeconds.toInt());
        });
      },
      icon: const Icon(
        Icons.replay_10,
        size: 30,
        color: Colors.black87,
      ));

  Widget loadAsset() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          btnLoop(),
          btnBackward(),
          btnBwd10(),
          btnStart(),
          btnFwd10(),
          btnForward(),
          btnShuffle(),
        ],
      );

  Slider buildSlider() => Slider(
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      activeColor: Colors.red[400],
      inactiveColor: Colors.grey,
      onChanged: (value) {
        setState(() {
          changeToSecond(value.toInt());
        });
      });

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
                style: medium.copyWith(fontSize: 16, color: Colors.grey),
              ),
              Text(
                _duration.toString().split(".")[0],
                style: medium.copyWith(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        buildSlider(),
        loadAsset()
      ],
    );
  }
}
