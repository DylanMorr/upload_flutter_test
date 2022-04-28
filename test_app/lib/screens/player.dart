/*
 * File: player.dart
 * Project: Flutter music player
 * Created Date: Wednesday February 17th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_app/screens/commons/player_buttons.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(
          "https://firebasestorage.googleapis.com/v0/b/flutter-project-2022.appspot.com/o/songs%2FSam%20Fender%20-%20Seventeen%20Going%20Under%20(Official%20Video).mp3?alt=media&token=2e9be580-4afa-42e9-8fb0-7030e96e5cd9")),
      AudioSource.uri(Uri.parse(
          "https://firebasestorage.googleapis.com/v0/b/flutter-project-2022.appspot.com/o/songs%2FEDEN%20-%20xo%20(official%20audio).mp3?alt=media&token=d2512aee-ff95-464f-be90-56d16bb5ebe1")),
      AudioSource.uri(Uri.parse(
          "https://firebasestorage.googleapis.com/v0/b/flutter-project-2022.appspot.com/o/songs%2FSam%20Fender%20-%20Dead%20Boys%20(Official%20Video).mp3?alt=media&token=c91a9a3b-464f-4323-b612-35ee7d602c3b")),
    ]))
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayerButtons(_audioPlayer),
      ),
    );
  }
}
