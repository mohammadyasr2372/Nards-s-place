import 'package:dashbord_cafe/features/place_of_study/presentation/pages/first_pages/walkthroght_pages.dart';
import 'package:flutter/material.dart';
import 'package:dashbord_cafe/core/constants/constants.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({super.key});

  @override
  State<PageSplash> createState() => _PageSplashState();
}

PageController controller = PageController();

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2400))
        .then((value) => setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagesWalkthroght()));
            }));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 2 / 10,
            ),
            Container(
              width: width / 3,
              height: height * 2 / 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/cosel logo.png',
                      ))),
            ),
            SizedBox(
              height: height * 2 / 10,
              child: const Text(
                'COSEL',
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: width * 9.5 / 10,
              height: height * 4 / 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/Capture.PNG',
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
