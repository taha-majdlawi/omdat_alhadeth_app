

import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';

class HadethScreenBottomSheet extends StatelessWidget {
  const HadethScreenBottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.soundUrl,
  });

  final double screenWidth;
  final double screenHeight;
  final String soundUrl ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: screenWidth * 0.15,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'تشغيل الصوت',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Reem kufi',
            ),
          ),
          SizedBox(height: 10),
          Slider(
            value: 0.3,
            onChanged: (value) {},
            activeColor: AppColors.darkPrimary,
            inactiveColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('0:45'), Text('3:20')],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 40,
                onPressed: () {},
              ),
              SizedBox(width: 15),
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.darkPrimary,
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 40,
                onPressed: () {},
              ),
              SizedBox(width: 15),
              // زر التكرار
              IconButton(
                icon: Icon(Icons.repeat),
                //color: AppColors.darkPrimary,
                iconSize: 30,
                onPressed: () {
                  // هنا ضع الكود لتفعيل التكرار
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
