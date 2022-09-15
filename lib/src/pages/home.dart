import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/components/post_widget.dart';
import 'package:flutter_clone_instagram/src/controller/home_controller.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://assets-global.website-files.com/6005fac27a49a9cd477afb63/6057684e5923ad2ae43c8150_bavassano_homepage_before.jpg',
          size: 60,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
              // ... -> List 배열을 나열하겠다는 의미
              100,
              (index) => AvatarWidget(
                  thumbPath:
                      'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                  type: AvatarType.TYPE1,
                  size: 60)),
        ],
      ),
    );
  }

  Widget _postList() {
    return Obx(() => Column(
          children: List.generate(controller.postList.length,
              (index) => PostWidget(post: controller.postList[index])).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: ImageData(IconsPath.logo, width: 270),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                  IconsPath.directMessage,
                  width: 50,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ));
  }
}
