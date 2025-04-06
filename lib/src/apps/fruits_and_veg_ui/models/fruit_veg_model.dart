import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/data/demo.dart';

class FruitVegModel {
  final String fruitName;
  final String imageUrl;
  final double price;
  final int? quantity;
  final double? totalPrice;
  final String description;
  final FruitType? type;

  // create constructor
  FruitVegModel({
    required this.fruitName,
    required this.imageUrl,
    required this.price,
    this.quantity,
    this.totalPrice,
    required this.description,
    this.type,
  });
}
