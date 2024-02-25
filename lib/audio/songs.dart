const Set<Song> songs = {
  Song('091_Heartbound_OST_Windup_Wonders.mp3', 'Windup_Wonders',
      artist: 'Pirate Software'),
  Song('100_Heartbound_OST_Meandering_Shadows.mp3.mp3', 'Meandering_Shadows',
      artist: 'Pirate Software'),
};

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}
