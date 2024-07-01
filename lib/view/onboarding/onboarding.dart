// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/shared/componente.dart';
import '../../helper/shared.dart';
import '../../madules/Register/who.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static const String id = "OnBoarding";
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int? page;
  PageController _controller = PageController();
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                page = value;
              });
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, i) {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      onBoardingList[i].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 170,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      child: Text(
                        onBoardingList[i].title,
                        style: TextStyle(
                            fontSize: 26,
                            color: (page == 1) ? Colors.white : defultColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 30,
                    right: 30,
                    child: Text(
                      onBoardingList[i].body,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 20,
                          color: (page == 1) ? Colors.white : defultColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, whoscrean.id);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: (page == 1)
                            ? Colors.white
                            : (page == 2)
                                ? Colors.black
                                : defultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 30, end: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      width: 30,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: page == 0
                            ? defultColor
                            : const Color.fromRGBO(175, 196, 240, 1.0),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      width: 35,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: page == 1
                            ? defultColor
                            : const Color.fromRGBO(175, 196, 240, 1.0),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      width: 35,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: page == 2
                            ? defultColor
                            : const Color.fromRGBO(175, 196, 240, 1.0),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (page == onBoardingList.length - 1) {
                      CacheHelper.saveData(key: "splash", value: true).then(
                        (value) => Navigator.pushNamed(context, whoscrean.id),
                      );
                    }
                    _controller.nextPage(
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    width: (page == onBoardingList.length - 1) ? 160 : 60,
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: defultColor),
                    child: page == onBoardingList.length - 1
                        ? const Text(
                            'Join A Community',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        : const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
