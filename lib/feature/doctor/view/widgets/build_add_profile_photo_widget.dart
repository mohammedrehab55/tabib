import 'package:flutter/material.dart';
import 'package:tabib/core/theme/color_manager.dart';

class BuildAddProfilePhotoWidget extends StatelessWidget {
  const BuildAddProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ColorManager.lighGrey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.photo_camera,
                  size: 50,
                  color: ColorManager.grey,
                ),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 12,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.photo_camera),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
