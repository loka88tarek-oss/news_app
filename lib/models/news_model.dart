class NewsModel {
  String id;
  String image;
  String title;
  String authorizedBy;
  String authorizedAt;
  NewsModel({
    required this.id,
    required this.authorizedAt,
    required this.authorizedBy,
    required this.image,
    required this.title,
  });
}
