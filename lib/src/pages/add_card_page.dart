import 'dart:io';

import 'package:dailycard/src/controller/card_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(CardController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '카드추가',
          style: TextStyle(fontFamily: 'Ns', color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: const Color(0xfffafafa),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.black, fontFamily: 'Ns'),
            ),
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Center(child: card(context))),
          ],
        ),
      ),
    );
  }

  Widget card(BuildContext context) {
    return GetBuilder<CardController>(builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.7,
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 500,
          front: DottedBorder(
            color: _.pickedImg == null ? Colors.black : Colors.transparent,
            borderPadding: const EdgeInsets.all(0.1),
            borderType: BorderType.RRect,
            dashPattern: [10, 3],
            radius: const Radius.circular(15),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                image: _.pickedImg != null
                    ? DecorationImage(
                        image: FileImage(File(_.pickedImg!.path)),
                        fit: BoxFit.fitWidth)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    offset: const Offset(0, 15),
                    spreadRadius: 3.0,
                    blurRadius: 20.0,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: !_.isLoading
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('yyyy. MM. dd', 'ko_kr')
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () => _.pickImg(),
                              child: Icon(
                                CupertinoIcons.camera,
                                size: 40,
                                color: _.pickedImg != null
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Ns'),
                          cursorColor: Colors.white.withOpacity(0.7),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.4),
                            // helperText: '태그는 띄어쓰기로 구분해주세요!',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            helperStyle: const TextStyle(fontFamily: 'Ns'),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: ' #태그',
                            hintStyle: const TextStyle(
                              fontFamily: 'Ns',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
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
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    });
  }
}
