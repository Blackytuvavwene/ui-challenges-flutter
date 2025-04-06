import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/data/demo.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/models/fruit_veg_model.dart';

// function to return card color based on fruit type
Color cardColor(FruitType? fruitType) {
  return switch (fruitType) {
    FruitType.green => Colors.green.shade200,
    FruitType.yellow => Colors.yellow.shade200,
    _ => Colors.blue
  };
}

// function to return cart button based on fruit type
Color cartButtonColor(FruitType? fruitType) {
  return switch (fruitType) {
    FruitType.green => Colors.green,
    FruitType.yellow => Colors.yellow,
    _ => Colors.blue.shade200
  };
}

class FruitVegProductCard extends HookConsumerWidget {
  const FruitVegProductCard({
    super.key,
    required this.fruitDetails,
  });
  final FruitVegModel fruitDetails;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // padding: EdgeInsets.all(
      //   16,
      // ),
      width: 30,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              28,
            ),
          ),
          color: cardColor(fruitDetails.type)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: InkWell(
                onTap: () {
                  // navigate to product details page
                  context.goNamed(
                    'productDetails',
                    extra: fruitDetails,
                  );
                },
                child: Image.asset(
                  fruitDetails.imageUrl,
                  // scale: 1.4,
                  width: 100,
                  height: 120,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: InkWell(
              onTap: () {
                // navigate to product details page
                context.goNamed(
                  'productDetails',
                  extra: fruitDetails,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruitDetails.fruitName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'P ${fruitDetails.price.toString()}',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(
                  30,
                  90,
                ),
                backgroundColor: cartButtonColor(fruitDetails.type),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      28,
                    ),
                    bottomRight: Radius.circular(
                      28,
                    ),
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
