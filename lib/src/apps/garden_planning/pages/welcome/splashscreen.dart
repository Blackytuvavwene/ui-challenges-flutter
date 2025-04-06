import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeafySplash extends HookConsumerWidget {
  const LeafySplash({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mediaquery height and width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 100,
      width: width,
      color: const Color.fromARGB(255, 108, 227, 112),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/garden_planning/hands.jpeg',
            height: height * 100,
            width: width * 100,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: width * 0.30,
            top: height * 0.55,
            right: width * 0.25,
            child: Text(
              'Leafy',
              style: GoogleFonts.lato(
                fontSize: 68,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ).animate(effects: [
              const FadeEffect(
                delay: Duration(
                  milliseconds: 600,
                ),
                curve: Curves.easeIn,
              ),
              const SlideEffect(
                begin: Offset(0, 0.1),
                delay: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeIn,
              )
            ]),
          )
        ],
      ),
    );
  }
}
