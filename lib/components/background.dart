import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
   Background ({Key? key, required this.child,
    this.topImage = "assets/image/main_top.png",
    this.bottomImage = "assets/image/login_bottom.png",

  }) : super(key: key);

  final String topImage;
  final String bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                bottomImage,
                width: 160,
              ),
            ),
            SafeArea(
                child: child
            ),
          ],
        ),
      ),
    );
  }
}
