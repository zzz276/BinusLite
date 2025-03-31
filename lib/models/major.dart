class Major {
  String name;
  String faculty;
  String foundedYear;
  String overview;
  String region;
  String? videoLink;
  String? catalogueLink;

  Major({
    required this.name,
    required this.region,
    required this.faculty,
    required this.foundedYear,
    required this.overview,
    this.videoLink,
    this.catalogueLink
  });
}
