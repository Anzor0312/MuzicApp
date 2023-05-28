import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:muzic/service/local/audio_player_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: IconButton(
                  onPressed: () async {
                    await AudioPlayerService.play(
                        AudioPlayerService.musicPath[index]);
                    setState(() {});
                  },
                  icon: AudioPlayerService.musicStatus[index] == true
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_circle_outlined)),
            ),
            title: Text(AudioPlayerService.musicTitles[index]),
          );
        },
        itemCount: AudioPlayerService.musicTitles.length,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_outlined)),
            IconButton(
                onPressed: () {},
                icon: AudioPlayerService.audioState == PlayerState.playing
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.skip_next_outlined)),
          ],
        ),
      ),
    );
  }
}
