import 'package:riverpod/riverpod.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/models/fruit_veg_model.dart';

// create an enum for the type of fruit
enum FruitType { green, yellow }

// create a list of demo data to fill products
final fruitsVegDemoListProvider = Provider<List<FruitVegModel>>((ref) {
  return [
    FruitVegModel(
      fruitName: 'Kiwi',
      imageUrl: 'assets/images/fruits_and_veg_ui/kiwi.png',
      price: 12.50,
      description:
          'Low in calories, rich in vitamin C and a good source of dietary fiber',
      type: FruitType.green,
    ),
    FruitVegModel(
      fruitName: 'Mango',
      imageUrl: 'assets/images/fruits_and_veg_ui/mango.png',
      price: 7.25,
      description:
          'A fruit with potent highs in vitamin C, vitamin K and fiber',
      type: FruitType.yellow,
    ),
    FruitVegModel(
      fruitName: 'Orange',
      imageUrl: 'assets/images/fruits_and_veg_ui/orange.png',
      price: 3,
      description: 'Best watery fruit low in calories and high vitamin C',
      type: FruitType.yellow,
    ),
    FruitVegModel(
      fruitName: 'Pear',
      imageUrl: 'assets/images/fruits_and_veg_ui/pear.png',
      price: 9.75,
      description:
          'Very low calorie count but still giving you high contents of vitamin C and fiber',
      type: FruitType.green,
    ),
  ];
});
