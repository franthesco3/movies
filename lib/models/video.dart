class Video {
  final String id;
  final String key;
  final String name;
  final String type;

  Video.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        key = map['key'],
        name = map['name'],
        type = map['type'];
}
