
class Show {
  final int id;
  final String name;
  final String image;
  final String description;
  final String language;
  final double rating;
  final String time;

  Show({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.language,
    required this.rating,
    required this.time,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      name: json['name'],
      image: json['image'] != null ? json['image']['medium'] : '',
      description: json['summary'] ?? '',
      language: json['language'] ?? '',
      rating: json['rating']['average'] != null ? json['rating']['average'].toDouble() : 0.0,
      time: json['schedule']['time'] ?? '',
    );
  }
}
