import 'dart:convert';

import 'package:foodie/models/recipe.dart';
import 'package:http/http.dart';

class ApiServices {
  // I used Food API (https://spoonacular.com/food-api)
  static const String apiKey = '314bae5598df408784a24b763d7366b1';
  String foodUrl =
      "https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey";

  String juiceUrl =
      'https://api.spoonacular.com/food/products/search?query=juice&apiKey=$apiKey';
  String cookieUrl =
      'https://api.spoonacular.com/food/products/search?query=cookie&apiKey=$apiKey';
  String burgerUrl =
      "https://api.spoonacular.com/food/menuItems/search?query=pizza&number=5&apiKey=$apiKey";

  Future<List<Recipe>> getFoods() async {
    try {
      var foods = List<Recipe>();
      Response response =
          await get(foodUrl, headers: {'Content-Type': 'application/json'});
      print("response status ${response.statusCode}");
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData['results'][0]);
      Iterable foodList = responseData['results'];
      foods = foodList.map((food) => Recipe.fromJson(food)).toList();
      return foods;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<List<Recipe>> getJuices() async {
    try {
      var beers = List<Recipe>();
      Response response =
          await get(juiceUrl, headers: {'Content-Type': 'application/json'});
      print("response status beer ${response.statusCode}");
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData['products'][0]);
      Iterable beerList = responseData['products'];
      beers = beerList.map((beer) => Recipe.fromJson(beer)).toList();
      return beers;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<List<Recipe>> getCookies() async {
    try {
      var cookies = List<Recipe>();
      Response response =
          await get(cookieUrl, headers: {'Content-Type': 'application/json'});
      print("response status cookie ${response.statusCode}");
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData['products'][0]);
      Iterable cookieList = responseData['products'];
      cookies = cookieList.map((cookie) => Recipe.fromJson(cookie)).toList();
      return cookies;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<List<Recipe>> getBurgers() async {
    try {
      var burgers = List<Recipe>();
      Response response =
          await get(burgerUrl, headers: {'Content-Type': 'application/json'});
      print("response status burger ${response.statusCode}");
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData['menuItems'][0]);
      Iterable burgerList = responseData['menuItems'];
      burgers = burgerList.map((burger) => Recipe.fromJson(burger)).toList();
      return burgers;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
