class CardModel {
  final String image;
  final String title;
  final String type;
  final int total;

  const CardModel(
      {required this.image,
      required this.title,
      required this.type,
      required this.total});

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
      image: json["image"],
      title: json["title"],
      type: json["type"],
      total: json["total"]);
}
