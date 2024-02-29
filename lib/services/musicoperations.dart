import 'package:newproject/models/music.dart';

class musicOperations {
  musicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          'Idol-Yoasobi',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTse9Odsob7VCO3GuEQyslgO4_IwgpDhBZ5h8S9ZtXGyRFWI-3JdAfo67z8PTPPSYAbDt8&usqp=CAU',
          'Oshi no ko opening-1',
          'https://api.spotify.com/v1/tracks/11dFghVXANMlKmJXsNCbNl'),
      Music(
          'Tengaku',
          'https://c-fa.cdn.smule.com/rs-s35/arr/ec/3b/43b69060-bc0c-4063-93a9-1c6c7292ce7d.jpg',
          'tengaku by wagakki band',
          '')
    ];
  }
}
