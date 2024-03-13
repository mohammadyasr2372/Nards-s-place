import 'package:dashbord_cafe/features/place_of_study/presentation/pages/first_pages/first_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class PagesWalkthroght extends StatefulWidget {
  const PagesWalkthroght({super.key});

  @override
  State<PagesWalkthroght> createState() => _PagesWalkthroghtState();
}

class _PagesWalkthroghtState extends State<PagesWalkthroght> {
  num index = 1;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(height * 0.25 / 15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height / 15,
            ),
            // Container( height: height/4,width: width*9/10, decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(assetName))),)
            Image.asset(
              index == 1
                  ? 'assets/images/onedetails.png'
                  : index == 2
                      ? 'assets/images/twodetails.png'
                      : 'assets/images/threedetails.png',
              fit: BoxFit.fill,
              width: 400,
              height: height * 8 / 15,
            ),
            SizedBox(
              height: height * 0.5 / 15,
            ),
            SizedBox(
              height: height * 2 / 15,
              child: Text(
                index == 1
                    ? 'Learn anytime\n and anywhere'
                    : index == 2
                        ? 'Find The perfect\n Space'
                        : 'Define Cozy spot?\n it’s us ',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: MyContainer(
                    isSelected: index == 1,
                    index: 1,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: MyContainer(
                    isSelected: index == 2,
                    index: 2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: MyContainer(
                    isSelected: index == 3,
                    index: 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.75 / 15,
            ),
            InkWell(
              onTap: () {
                if (index == 1 || index == 2) {
                  setState(() {
                    index += 1;
                  });
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageFirst()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffF05984),
                    width: 1,
                  ),
                  color: const Color(0xffF05984),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 311,
                height: height * 1 / 15,
                child: Center(
                  child: Text(
                    index == 1
                        ? 'Next '
                        : index == 2
                            ? 'Next '
                            : 'Start ',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.isSelected, required this.index});
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: (index == 1 && isSelected)
          ? 'isSelected'
          : (index == 2 && isSelected)
              ? 'isSelected'
              : (index == 3 && isSelected)
                  ? 'isSelected'
                  : (index == 1 && !isSelected)
                      ? 'NisSelected'
                      : (index == 2 && !isSelected)
                          ? 'NoisSelected'
                          : (index == 3 && !isSelected)
                              ? 'NotisSelected'
                              : '',
      child: Container(
        width: isSelected ? 20 : 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // shape: BoxShape.circle,
          color: isSelected
              ? const Color.fromARGB(255, 130, 223, 235)
              : const Color.fromARGB(255, 145, 215, 224),
        ),
      ),
    );
  }
}
//    class pages extends StatelessWidget {
//   const pages({super.key});

//   @override
//   Widget build(BuildContext context) {
// return Scaffold(body: Column(children: [PageView()]),);
//   }
// }