class Major {
  int id;
  String name;
  String faculty;
  String title;
  String overview;
  String career;
  String region;
  String? videoLink;
  String? catalogueLink;
  int foundedYear;
  int duration;
  bool isWatched;

  Major({
    required this.id,
    required this.name,
    required this.faculty,
    required this.title,
    required this.overview,
    required this.career,
    required this.region,
    this.videoLink,
    this.catalogueLink,
    required this.foundedYear,
    required this.duration,
    required this.isWatched
  });

  factory Major.fromJson(Map<String, dynamic> json) => Major(
    id: json['id'] as int,
    name: json['name'].toString(),
    faculty: json['faculty'].toString(),
    title: json['title'].toString(),
    overview: json['overview'].toString(),
    career: json['career'].toString(),
    region: json['region'].toString(),
    videoLink: json['videoLink'].toString(),
    catalogueLink: json['catalogueLink'].toString(),
    foundedYear: json['foundedYear'] as int,
    duration: json['duration'] as int,
    isWatched: json['isWatched'] as bool
  );
}
