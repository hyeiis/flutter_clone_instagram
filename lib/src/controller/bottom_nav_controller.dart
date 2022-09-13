import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      // 히스토리 누적
      bottomHistory.add(value); //뒤로가기 되게끔 페이지 값 더해줌
    }
    // if (bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // } //같은 페이지 여러 번 누른 것 히스토리에 반영x & home->search->home이면 0 1 0 이 아니라 0 1 에서 1 0 으로
    // bottomHistory.add(value); //뒤로가기 되게끔 페이지 값 더해줌
    // -> 히스토리 누적 안되고 순서 변경되게 해서 페이지가 리스트에 누적되지 않음
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
                message: '종료하시겠습니까?',
                title: '시스템',
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
