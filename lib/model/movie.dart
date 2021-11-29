class Movie {
  final String id;
  final String fullTitle;
  final String image;
  final String imDbRating;

  Movie(this.id, this.fullTitle, this.image, this.imDbRating);

  Movie.formJson(Map<String, dynamic> map)
      : id = map['id'],
        fullTitle = map['fullTitle'],
        image = map['image'],
        imDbRating = map['imDbRating'];

  @override
  String toString() {
    return fullTitle;
  }
}
