class HymnEntity {
  final id;
  final hymnId;
  final title;
  final description;
  final totalNumOfSongs;
  final songs;

  HymnEntity(this.id, this.hymnId, this.title, this.description,
      this.totalNumOfSongs, this.songs);

  @override
  int get hashCode =>
      id.hashCode ^
      hymnId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      totalNumOfSongs.hashCode ^
      songs.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HymnEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          hymnId == other.hymnId &&
          description == other.description &&
          totalNumOfSongs == other.totalNumOfSongs &&
          songs == other.songs &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      'title': title,
      'hymnId': hymnId,
      'description': description,
      'totalNumOfSongs': totalNumOfSongs,
      'songs': songs,
      'id': id
    };
  }

  @override
  String toString() {
    return 'HymnEntity {title: $title, hymnId: $hymnId, description: $description, totalNumOfSongs: $totalNumOfSongs, songs: $songs,  id: $id}';
  }

  static HymnEntity fromJson(Map<String, Object> json) {
    return HymnEntity(
      json['_id'] as String,
      json['hymnId'] as int,
      json['title'] as String,
      json['description'] as String,
      json['totalNumOfSongs'] as String,
      json['songs'] as List<dynamic>,
    );
  }
}
