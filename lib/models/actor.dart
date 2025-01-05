import 'dart:convert';

class Actor {
  int id;
  String name;
  String profilePath;
  String biography;
  String birthday;
  double popularity;
  String placeOfBirth;
  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.biography,
    required this.birthday,
    required this.popularity,
    required this.placeOfBirth,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      id: map['id'] as int,
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      biography: map['biography'] ?? '',
      birthday: map['birthday'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      placeOfBirth: map['place_of_birth'] ?? '',
    );
  }

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));
}
