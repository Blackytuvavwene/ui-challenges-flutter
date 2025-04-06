import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/data/demo.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/widgets/product_card.dart';

class FruitsAndVegUIHome extends HookConsumerWidget {
  const FruitsAndVegUIHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // our controller to search for fruits
    final fruitsTextEditingController =
        useTextEditingController(text: 'Search your fruits');

    // read a demo of our data and display it as products
    final fruitsVegData = ref.watch(fruitsVegDemoListProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning!',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                Text(
                  'Davvv More',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: CircleAvatar(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_2_rounded,
                    ),
                  ),
                ),
              )
            ],
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            pinned: true,
            title: Form(
              child: TextFormField(
                controller: fruitsTextEditingController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      14,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverFillRemaining(
            child: GridView.builder(
                itemCount: fruitsVegData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 40,
                  childAspectRatio: 0.64,
                ),
                padding: const EdgeInsets.all(
                  26,
                ),
                itemBuilder: (context, index) {
                  return FruitVegProductCard(
                    fruitDetails: fruitsVegData[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
