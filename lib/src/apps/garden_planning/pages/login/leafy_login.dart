import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeafyLogin extends HookConsumerWidget {
  const LeafyLogin({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // text editing controllers
    final emailTextController =
        useTextEditingController(text: 'Enter your email');
    final passwordTextController =
        useTextEditingController(text: 'Enter your password');

    // mediaquery sizes
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/garden_planning/watering.jpeg',
              height: height * 0.3,
              width: width * 0.9,
              // fit: BoxFit.fill,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            const Text(
              'Login to Access\nYour Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailTextController,
                    // initialValue: emailTextController.text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      // labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 150, 164, 171),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(46),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 150, 164, 171),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  TextFormField(
                    controller: passwordTextController,
                    // initialValue: passwordTextController.text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Color.fromARGB(255, 150, 164, 171),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(46),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 150, 164, 171)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        // label: const Text('Enter your password'),
                        icon: const Icon(
                          Icons.check_box_outlined,
                        ),
                      ),
                      const Text('Enter your password'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        width * 0.9,
                        height * 0.06,
                      ),
                      backgroundColor: const Color.fromRGBO(20, 144, 93, 1),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 1,
                            child: ColoredBox(
                              color: Color.fromARGB(255, 150, 164, 171),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        const Text('Or login with'),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        const Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 1,
                            child: ColoredBox(
                              color: Color.fromARGB(255, 150, 164, 171),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.85,
                    height: height * 0.05,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          'assets/images/socials/google.svg',
                          height: 30,
                          width: 30,
                        ),
                        SvgPicture.asset(
                          'assets/images/socials/facebook.svg',
                          height: 30,
                          width: 30,
                        ),
                        SvgPicture.asset(
                          'assets/images/socials/apple.svg',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      // const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(20, 144, 93, 1),
                            )),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color.fromRGBO(20, 144, 93, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
