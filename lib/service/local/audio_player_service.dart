import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static List<String> musicPath = [
    "music/music1.mp3",
    "music/music2.mp3",
    "music/music3.mp3",
  ];
  static List<String> musicTitles = [
    
    "O'rtog'imga tegib ketgan qiz",
    "Sariyah-Samehtak",
    "Adham Soliyev",
  ];
  static List<bool> musicStatus =
      List.generate(musicPath.length, (index) => false);
  static AudioPlayer audioPlayer = AudioPlayer();
  static PlayerState audioState = PlayerState.paused;
  static AudioCache? audioCache;

  static play(String path) async {
    await audioPlayer.play(AssetSource(path));
    audioState = PlayerState.playing;
  }

  static pause() async {
    await audioPlayer.pause();
    audioState = PlayerState.paused;
  }

  static next(String nextAudioPath) async {
    await audioPlayer.play(AssetSource(nextAudioPath));
    audioState = PlayerState.playing;
  }

  static back(String previosAudioPath) async {
    await audioPlayer.play(AssetSource(previosAudioPath));
    audioState = PlayerState.playing;
  }

  static stop() async {
    await audioPlayer.stop();
    audioState = PlayerState.stopped;
  }
}
