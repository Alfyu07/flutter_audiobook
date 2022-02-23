import 'package:audioplayers/audioplayers.dart';
import 'package:ebooks_app/ui/widgetes/audio_file.dart';
import 'package:flutter/material.dart';
import '../../shared/app_colors.dart' as app_colors;
import '../../shared/app_textstyle.dart' as textstyle;

class DetailAudiopage extends StatefulWidget {
  const DetailAudiopage({Key? key}) : super(key: key);

  @override
  State<DetailAudiopage> createState() => _DetailAudiopageState();
}

class _DetailAudiopageState extends State<DetailAudiopage> {
  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: app_colors.audioBluishBackground,
      body: Stack(
        children: [
          // Search and back icon
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: app_colors.audioBlueBackground,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.2,
            height: screenHeight * 0.45,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.14),
                    Text(
                      "THE WATER CURE",
                      style: textstyle.bold
                          .copyWith(fontSize: 24, fontFamily: "Avenir"),
                    ),
                    Text(
                      "Martin Hyatt",
                      style: textstyle.regular.copyWith(
                        fontSize: 18,
                        fontFamily: "Avenir",
                      ),
                    ),
                    AudioFile(
                      advancedPlayer: advancedPlayer,
                    ),
                  ],
                )),
          ),

          Positioned(
            top: screenHeight * 0.1,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
                color: app_colors.audioGreyBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('img/pic-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
          //audio player section

          //add to playlist
        ],
      ),
    );
  }
}
