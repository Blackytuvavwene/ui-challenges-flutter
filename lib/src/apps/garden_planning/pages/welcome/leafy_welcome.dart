import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_challenges_app/src/apps/garden_planning/pages/welcome/splashscreen.dart';

class LeafyWelcome extends HookConsumerWidget {
  const LeafyWelcome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mediaquery height and width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // drag values that updates
    final dragLength = useState<double>(50);
    final backgroundTrackOpacity = useState<double>(1);

    // dragtarget global key
    final dragTargetKey = GlobalKey();
    // draggable position
    final draggablePosition = useState<Offset>(Offset.zero);

    // function to constrain draggable to drag target
    void constrainPositionToDragTarget() {
      // get dragtarget render
      final dragTargetRenderBox =
          dragTargetKey.currentContext?.findRenderObject() as RenderBox;

      //get the dragtarget position, size and draggable size
      final dragTargetPosition = dragTargetRenderBox.localToGlobal(Offset.zero);
      final dragTargetSize = dragTargetRenderBox.size;
      final draggableSize = Size(
        width * 0.16,
        height * 0.08,
      );

      // get bounds of drag target
      final leftBound = dragTargetPosition.dx;
      final rightBound = leftBound + dragTargetSize.width;
      final topBound = dragTargetPosition.dy;
      final bottomBound = topBound + dragTargetSize.height;

      // prevent overlap
      if (draggablePosition.value.dx < leftBound) {
        draggablePosition.value = Offset(leftBound, draggablePosition.value.dy);
      }
      if (draggablePosition.value.dx + draggableSize.width > rightBound) {
        draggablePosition.value =
            Offset(rightBound, draggablePosition.value.dy);
      }
      if (draggablePosition.value.dy < topBound) {
        draggablePosition.value = Offset(draggablePosition.value.dx, topBound);
      }
      if (draggablePosition.value.dy + draggableSize.height > bottomBound) {
        draggablePosition.value =
            Offset(draggablePosition.value.dx, bottomBound);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 144, 93, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.015,
          ),
          Text(
            'Leafy',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 56,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ).animate(effects: [
            const FadeEffect(
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            ),
            const SlideEffect(
              begin: Offset(0, 1),
              delay: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInOut,
            )
          ]),
          SizedBox(
            height: height * 0.015,
          ),
          Image.asset(
            'assets/images/garden_planning/potplant.png',
            height: height * 0.45,
            width: width * 0.8,
            fit: BoxFit.fill,
          ).animate(effects: [
            const FadeEffect(
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            )
          ]),
          SizedBox(
            height: height * 0.04,
          ),
          const Text(
            'Smart Garden Planning',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate(effects: [
            const FadeEffect(
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            ),
            const SlideEffect(
              begin: Offset(-1, 0),
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            )
          ]),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'Plan, grow and manage your \ngarden effortlessly',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              // fontWeight: FontWeight.bold,
              color: Colors.white60,
            ),
          ).animate(effects: [
            const FadeEffect(
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            ),
            const SlideEffect(
              begin: Offset(-1, 0),
              delay: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeInOut,
            )
          ]),
          SizedBox(
            height: height * 0.04,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width * 0.9,
              height: height * 0.08,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(
                  255,
                  255,
                  255,
                  0.5,
                ),
              ),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    left: draggablePosition.value.dx,
                    top: draggablePosition.value.dy,
                    child: Draggable(
                      data: 'leafyLogin',
                      onDragStarted: () {
                        dragLength.value = 50;
                        // reset draggable position
                        // draggablePosition.value = Offset.zero;
                        // reset background track opacity
                        backgroundTrackOpacity.value = 1;
                      },
                      onDragUpdate: (details) {
                        // update draggable position
                        draggablePosition.value += details.delta;
                        // update width
                        dragLength.value += details.delta.dx;
                        // constrain
                        constrainPositionToDragTarget();
                      },
                      onDragEnd: (details) {
                        // reset draggable
                        draggablePosition.value = Offset.zero;
                        // navigate to login
                        context.pushNamed('leafyLogin');
                      },
                      axis: Axis.horizontal,
                      feedback: Container(
                        // color: Colors.red,
                        height: height * 0.08,
                        width: width * 0.16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 221, 221, 221),
                        ),
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                      childWhenDragging: Container(
                        // color: Colors.red.shade300,
                        height: height * 0.08,
                        width: dragLength.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(204, 180, 180, 180),
                        ),
                      ),
                      child: Container(
                        // color: Colors.white,
                        height: height * 0.08,
                        width: width * 0.16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 215, 214, 214),
                        ),
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: DragTarget(
                        key: dragTargetKey,
                        onAcceptWithDetails: (details) {
                          // navigate to login page
                          context.pushNamed(details.data.toString());
                          // show snackbar
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Dropped: $details')));
                        },
                        hitTestBehavior: HitTestBehavior.opaque,
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            height: height * 0.09,
                            width: width * 0.20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child:
                                const Icon(Icons.keyboard_double_arrow_right),
                          );
                        }),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Start now'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
