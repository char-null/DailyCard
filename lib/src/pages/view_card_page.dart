import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailycard/src/pages/add_card_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewCardPage extends StatelessWidget {
  const ViewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    '2022년',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Ns',
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: CarouselSlider(
            items: [
              card(context, 1),
              card(context, 2),
              card(context, 3),
              card(context, 4),
              card(context, 5),
              card(context, 6),
              card(context, 7),
              card(context, 8),
              card(context, 9),
              card(context, 10),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.7,
              autoPlay: true,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        elevation: 10,
        onPressed: () {
          Get.to(() => const AddCardPage());
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  Widget card(BuildContext context, int index) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 500,
          front: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  offset: const Offset(0, 15),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                )
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage('assets/images/food$index.jpeg'),
                  fit: BoxFit.fitWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned.fill(
                          top: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.transparent.withOpacity(0.1),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffC9D6FF),
                                  Color(0xffE2E2E2),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('yyyy. MM. dd', 'ko_kr')
                              .format(DateTime.now()),
                          style: const TextStyle(
                            fontFamily: 'Ns',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 2),
                    //   decoration: BoxDecoration(
                    //     color: Colors.transparent.withOpacity(0.7),
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //   child: const Text(
                    //     '음식',
                    //     style: TextStyle(
                    //       fontFamily: 'Ns',
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 2),
                    //   decoration: BoxDecoration(
                    //     color: Colors.transparent.withOpacity(0.7),
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //   child: const Text(
                    //     '도쿄',
                    //     style: TextStyle(
                    //       fontFamily: 'Ns',
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      '#일본 ',
                      style: TextStyle(fontFamily: 'Gamja', fontSize: 18),
                    ),
                    Text(
                      '#도쿄 ',
                      style: TextStyle(fontFamily: 'Gamja', fontSize: 18),
                    ),
                    Text(
                      '#음식 ',
                      style: TextStyle(fontFamily: 'Gamja', fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
          back: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  offset: const Offset(0, 15),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                ),
              ],
              gradient: const LinearGradient(
                colors: [
                  //애매
                  // Color(0xff0F2027),
                  // Color(0xff203A43),
                  // Color(0xff2C5364),
                  //good
                  Color(0xffC9D6FF),
                  Color(0xffE2E2E2),

                  // Color(0xff7F7FD5),
                  // Color(0xff86A8E7),
                  // Color(0xff91EAE4),
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'さやちゃんバカ! ',
                    style: TextStyle(
                      fontFamily: 'Gamja',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'さやちゃんバカ! ',
                    style: TextStyle(
                        fontFamily: 'Hm',
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
