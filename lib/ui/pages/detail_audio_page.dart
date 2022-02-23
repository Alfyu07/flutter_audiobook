import 'package:audioplayers/audioplayers.dart';
import 'package:ebooks_app/ui/widgetes/audio_file.dart';
import 'package:flutter/material.dart';
import '../../shared/app_colors.dart' as app_colors;
import '../../shared/app_textstyle.dart' as textstyle;

class DetailAudiopage extends StatefulWidget {
  final books;
  final int index;
  const DetailAudiopage({Key? key, required this.books, required this.index})
      : super(key: key);

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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                      widget.books[widget.index]["title"],
                      style: textstyle.bold
                          .copyWith(fontSize: 24, fontFamily: "Avenir"),
                    ),
                    Text(
                      widget.books[widget.index]["text"],
                      style: textstyle.regular.copyWith(
                        fontSize: 18,
                        fontFamily: "Avenir",
                      ),
                    ),
                    AudioFile(
                      advancedPlayer: advancedPlayer,
                      audioPath: widget.books[widget.index]["audio"],
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
                      image: AssetImage(widget.books[widget.index]["img"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //add to playlist

          Positioned(
            top: screenHeight * 0.7,
            left: 0,
            right: 0,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add to Playlist',
                      style: textstyle.bold.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.books.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 100,
                            height: 140,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(widget.books[index]["img"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
