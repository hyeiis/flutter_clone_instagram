import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          100,
          (index) => Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          ),
        ),
      ),
    );
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
            // _postList(),
          ],
        ));
  }
}
