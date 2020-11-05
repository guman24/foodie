import 'dart:convert';

class Recipe {
  int id;
  String title;
  String image;
  String restaurantChain;

  Recipe(int id, String title, String image, String restaurantChain) {
    this.id = id;
    this.title = title;
    this.image = image;
    this.restaurantChain = restaurantChain;
  }

  Recipe.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        restaurantChain = json['restaurantChain'],
        image = json['image'];

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'restaurantChain': restaurantChain
    };
  }
}
