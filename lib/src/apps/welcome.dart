import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_challenges_app/src/apps/garden_planning/pages/welcome/splashscreen.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mediaquery height and width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Challenges'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  'This app shows my UI challenges made in flutter',
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                CardLink(
                  onTap: () => context.go('/fruits_veg_ui'),
                  uiName: 'Fruits and Vegetables',
                  routeName: '/fruits_veg_ui',
                  color: Colors.blueGrey,
                  uiPlaceholder: 'assets/images/ui/fruitsveg.png',
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                CardLink(
                  onTap: () {
                    //show loading screen for a few seconds before showing dialog
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const LeafySplash();
                        });

                    // delay for a few seconds
                    Future.delayed(const Duration(seconds: 3), () {
                      context.pop();
                    }).then(
                      (value) => context.go('/leafy'),
                    );
                  },
                  uiName: 'Garden Planning UI',
                  routeName: '/leafy',
                  color: Colors.green,
                  uiPlaceholder: 'assets/images/ui/gardenplanning.webp',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// show a loading spinner
class WelcomeSpinner extends StatelessWidget {
  const WelcomeSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

// ui card link
class CardLink extends HookConsumerWidget {
  const CardLink({
    super.key,
    required this.onTap,
    required this.uiName,
    required this.routeName,
    required this.color,
    required this.uiPlaceholder,
  });

  // route details and action
  final void Function() onTap;
  final String uiName;
  final String routeName;
  final Color color;
  final String uiPlaceholder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(uiPlaceholder),
            const SizedBox(
              height: 16,
            ),
            Text(
              uiName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
