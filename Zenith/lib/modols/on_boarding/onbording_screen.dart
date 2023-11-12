import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/Components/components.dart';
import '../../../shared/styles/colors.dart';

var controlnextpadge = PageController();
bool islast = false;

class OnBordingShop extends StatefulWidget {
  const OnBordingShop({super.key});

  @override
  State<OnBordingShop> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<OnBordingShop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prinarycolor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: prinarycolor, statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                tapSkipOnboarding(context);
              },
              child:
              const Text('Skip', style: TextStyle(color: Color.fromARGB(255, 243, 243, 243))),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: PageView.builder(
              itemBuilder: (context, index) => buildpadge(padges[index]),
              itemCount: padges.length,
              controller: controlnextpadge,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  if (index == padges.length - 1) {
                    islast = true;
                  } else {
                    islast = false;
                  }
                });
              },
            ),
          ),
          Container(
            height: 75,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topRight: Radius.zero,
                    topLeft: Radius.circular(150))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                    controller: controlnextpadge,
                    count: padges.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: secondarycolor,
                      dotHeight: 20,
                      dotWidth: 25,
                      spacing: 10,
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (islast == false) {
                controlnextpadge.nextPage(
                    duration: const Duration(milliseconds: 500), curve: Curves.easeInBack);
              } else {
                tapSkipOnboarding(context);
              }
            });
          },
          child: const Icon(
            Icons.navigate_next_rounded,
            size: 50,
          )),
    );
  }
}
