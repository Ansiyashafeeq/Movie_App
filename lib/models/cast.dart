
class Cast {
  final String name;
  final String image;
  final String gender;
  final String birthday;
  final String deathday;

  Cast({
    required this.name,
    required this.image,
    required this.gender,
    required this.birthday,
    required this.deathday,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['person']['name'],
      image: json['person']['image'] != null ? json['person']['image']['medium'] : '',
      gender: json['person']['gender'] ?? '',
      birthday: json['person']['birthday'] ?? '',
      deathday: json['person']['deathday'] ?? '',
    );
  }
}
