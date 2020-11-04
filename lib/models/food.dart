class Recipe {
  int id;
  String title;
  String image;

  Recipe(int id, String title, String image) {
    this.id = id;
    this.title = title;
    this.image = image;
  }

  Recipe.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        image = json['image'];

  Map toJson() {
    return {'id': id, 'title': title, 'image': image};
  }
}
