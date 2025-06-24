import 'package:flutter/material.dart';

class HomeMiddleWidget extends StatelessWidget {
  const HomeMiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "인기 여행지",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("전체 여행지 보기"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
          ),
        )
      ],
    );
  }
}
