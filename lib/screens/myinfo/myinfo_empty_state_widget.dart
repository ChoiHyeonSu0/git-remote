import 'package:flutter/material.dart';

class MyinfoEmptyStateWidget extends StatelessWidget {
  Function(bool) showForm;
  MyinfoEmptyStateWidget(this.showForm);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 100,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 24,),
          Text(
              "사용자 정보가 없습니다.",
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
          SizedBox(height: 16,),
          ElevatedButton(
              onPressed: () {
                showForm(true);
              },
              child: Text("정보 입력하기")
          )

        ],
      ),
    );
  }
}
