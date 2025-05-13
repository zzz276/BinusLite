class Major {
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

  Major({
    required this.name,
    required this.region,
    required this.faculty,
    required this.foundedYear,
    required this.duration,
    required this.title,
    required this.overview,
    required this.career,
    this.videoLink,
    this.catalogueLink
  });
}
