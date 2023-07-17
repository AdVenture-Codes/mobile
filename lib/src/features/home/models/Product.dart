import 'package:flutter/material.dart';

import '../../../constants/images_string.dart';

class Product {
  final String? title, image, star, reviews;
  final controller;
  late List<String>? items = [];
  final double? price;

  Product({
    this.title,
    this.image,
    this.star,
    this.reviews,
    this.price,
    this.controller,
    this.items,
  });
}

List<Ingredient> ingredients = [
  Ingredient(titleIng: "Egg", imageIng: tMenuIngredientsImage1),
  Ingredient(titleIng: "Avocado", imageIng: tMenuIngredientsImage2),
  Ingredient(titleIng: "Spinach", imageIng: tMenuIngredientsImage3),
  Ingredient(titleIng: "Egg", imageIng: tMenuIngredientsImage1),
  Ingredient(titleIng: "Avocado", imageIng: tMenuIngredientsImage2),
  Ingredient(titleIng: "Spinach", imageIng: tMenuIngredientsImage3),
];
List<Product> demo_products = [
  Product(
      title: "Avocado and Egg Toast",
      image: tMenuImage1,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Mac and Cheese",
      image: tMenuImage2,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Power bowl",
      image: tMenuImage3,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Vegetable Salad",
      image: tMenuImage4,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Curry Salmon",
      image: tMenuImage5,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Yogurt and Fruits",
      image: tMenuImage6,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
];

List<Product> Product_Drink = [
  Product(
      title: "Hibiscus tea Starbucks Coffee Drink",
      image: tMenuDrinkImage1,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Iced coffee Latte Almond milk Milkshake",
      image: tMenuDrinkImage2,
      reviews: " (165 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Hibiscus tea Starbucks Coffee Drink",
      image: tMenuDrinkImage3,
      reviews: " (150 reviews) ",
      star: "4.9",
      price: 10.40),
  Product(
      title: "Matcha Chocolate cake Coffee Starbucks Frappuccino",
      image: tMenuDrinkImage4,
      reviews: " (100 reviews) ",
      star: "4.9",
      price: 10.00),
  Product(
      title: "Iced coffee Latte",
      image: tMenuDrinkImage5,
      reviews: " (120 reviews) ",
      star: "4.9",
      price: 5.40),
];
List<Tab> tabs = [
  Tab(child: Text("Eat")),
  Tab(child: Text("Drink")),
  Tab(child: Text("Dessert")),
  Tab(child: Text("Burguers")),
  Tab(child: Text("Sandawich")),
  Tab(child: Text("Snacks")),
  Tab(child: Text("Tea and Juice")),
];

//TRUE ................
class ProductD {
  final String? title, image, star, reviews, price, subtitle;

  final List<Ingredient>? ingredients;
  final List<Topping>? toppings;

  ProductD({
    this.title,
    this.image,
    this.star,
    this.reviews,
    this.price,
    this.subtitle,
    this.ingredients,
    this.toppings,
  });
}

class Ingredient {
  final String? titleIng, imageIng;

  Ingredient({
    this.titleIng,
    this.imageIng,
  });
}

class Topping {
  final String? titleTopp, priceTopp;

  Topping({
    this.titleTopp,
    this.priceTopp,
  });
}

List<ProductD> Drinks = [
  ProductD(
    title: "Hibiscus tea Starbucks Coffee Drink",
    image: tMenuDrinkImage1,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Milk", imageIng: ""),
      Ingredient(titleIng: "Coffee", imageIng: ""),
      Ingredient(titleIng: "Nestle", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Double Espresso", priceTopp: "15.50"),
      Topping(titleTopp: "Breve", priceTopp: "14.50"),
      Topping(titleTopp: "Cappuccino", priceTopp: "16.50")
    ],
  ),
  ProductD(
    title: "Iced coffee Latte Almond milk Milkshake",
    image: tMenuDrinkImage2,
    reviews: " (165 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Milk", imageIng: ""),
      Ingredient(titleIng: "Coffee", imageIng: ""),
      Ingredient(titleIng: "Nestle", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Double Espresso", priceTopp: "15.50"),
      Topping(titleTopp: "Breve", priceTopp: "14.50"),
      Topping(titleTopp: "Cappuccino", priceTopp: "16.50")
    ],
  ),
  ProductD(
    title: "Hibiscus tea Starbucks Coffee Drink",
    image: tMenuDrinkImage3,
    reviews: " (150 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Milk", imageIng: ""),
      Ingredient(titleIng: "Coffee", imageIng: ""),
      Ingredient(titleIng: "Nestle", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Double Espresso", priceTopp: "15.50"),
      Topping(titleTopp: "Breve", priceTopp: "14.50"),
      Topping(titleTopp: "Cappuccino", priceTopp: "16.50")
    ],
  ),
  ProductD(
    title: "Matcha Chocolate cake Coffee Starbucks Frappuccino",
    image: tMenuDrinkImage4,
    reviews: " (100 reviews) ",
    star: "4.9",
    price: "10.00",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Milk", imageIng: ""),
      Ingredient(titleIng: "Coffee", imageIng: ""),
      Ingredient(titleIng: "Nestle", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Double Espresso", priceTopp: "15.50"),
      Topping(titleTopp: "Breve", priceTopp: "14.50"),
      Topping(titleTopp: "Cappuccino", priceTopp: "16.50")
    ],
  ),
  ProductD(
    title: "Iced coffee Latte",
    image: tMenuDrinkImage5,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "5.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Milk", imageIng: ""),
      Ingredient(titleIng: "Coffee", imageIng: ""),
      Ingredient(titleIng: "Nestle", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Double Espresso", priceTopp: "15.50"),
      Topping(titleTopp: "Breve", priceTopp: "14.50"),
      Topping(titleTopp: "Cappuccino", priceTopp: "16.50")
    ],
  ),
];
//True Foods
List<ProductD> Foods = [
  ProductD(
    title: "Avocado and Egg Toast",
    image: tMenuImage1,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
  ProductD(
    title: "Mac and Cheese",
    image: tMenuImage2,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
  ProductD(
    title: "Power bowl",
    image: tMenuImage3,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
  ProductD(
    title: "Vegetable Salad",
    image: tMenuImage4,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
  ProductD(
    title: "Curry Salmon",
    image: tMenuImage5,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
  ProductD(
    title: "Yogurt and Fruits",
    image: tMenuImage6,
    reviews: " (120 reviews) ",
    star: "4.9",
    price: "10.40",
    subtitle:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    ingredients: [
      Ingredient(titleIng: "Egg", imageIng: ""),
      Ingredient(titleIng: "Avocado", imageIng: ""),
      Ingredient(titleIng: "Spinach", imageIng: ""),
    ],
    toppings: [
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
      Topping(titleTopp: "Extra eggs", priceTopp: "4.20"),
      Topping(titleTopp: "Extra Spanich", priceTopp: "2.80"),
      Topping(titleTopp: "Extra bread", priceTopp: "1.80"),
    ],
  ),
];
