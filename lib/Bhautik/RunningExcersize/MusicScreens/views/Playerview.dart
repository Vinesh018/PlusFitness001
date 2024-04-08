import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:plus_fitness/Bhautik/constansts/spotifydata.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Mainplayerscreen extends StatefulWidget {
  @override
  State<Mainplayerscreen> createState() => _MainplayerscreenState();
}

class _MainplayerscreenState extends State<Mainplayerscreen> {
  String artistName = 'Tablo(Epic High)';
  String songName = 'Sleeping beauty';
  String musictrackid = ' 6rWblGW0pBcB3uygxBuWZV';
  final player = AudioPlayer();
  Duration? duration;

  @override
  void initState() {
    final credentials = SpotifyApiCredentials(
        CustomeString.Clientid, CustomeString.Clientsecreate);
    final spotify = SpotifyApi(credentials);
    spotify.tracks.get(musictrackid).then(
      (track) async {
        String? tempsongName = track.name;
        if (tempsongName != null) {
          final yt = YoutubeExplode();
          final video = (await yt.search.search(tempsongName)).first;
          final videoid = video.id.value;
          duration = video.duration;

          setState(() {});
          var manifest = await yt.videos.streamsClient.getManifest(videoid);
          var audiourl = manifest.audioOnly.first.url;
          player.play(UrlSource(audiourl.toString()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Signing Now',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?t=st=1712309904~exp=1712310504~hmac=18004f1dacbe6f06ef8662943bb2eda60597dced77bcb428975479e95a239065',
                            scale: 1),
                        radius: 10,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        artistName,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Center(
              child: ArtWorkimage(
            image:
                'https://img.freepik.com/free-photo/bird-colorful-colorful-flowers-generative-ai_206725-752.jpg?t=st=1712315155~exp=1712315755~hmac=e10d571e217116408b54a8465c08344865084360e91b728aacb6152ffda6584b',
          )),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songName,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FontMain',
                            fontSize: 22),
                      ),
                      Text(
                        artistName,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FontMain',
                            fontSize: 17),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              StreamBuilder(
                stream: player.onPositionChanged,
                builder: (context, data) {
                  return ProgressBar(
                    progress: data.data ?? Duration(seconds: 8),
                    buffered: Duration(seconds: 50),
                    total: duration ?? Duration(minutes: 4),
                    baseBarColor: Colors.white,
                    bufferedBarColor: Colors.grey,
                    thumbColor: Colors.white,
                    progressBarColor: Colors.green,
                    timeLabelTextStyle: TextStyle(color: Colors.green),
                    onSeek: (duration) {
                      print('User selected a new time: $duration');
                    },
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.lyrics_outlined,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 68,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.loop, color: Colors.green)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ArtWorkimage extends StatelessWidget {
  final String image;

  const ArtWorkimage({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
    );
  }
}
