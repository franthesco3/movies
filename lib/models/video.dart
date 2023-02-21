class Video {
  final String id;
  final String key;
  final String name;

  Video.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        key = map['key'],
        name = map['name'];
}
