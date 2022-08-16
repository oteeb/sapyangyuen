import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class intropage1 extends StatelessWidget {
  const intropage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 40, 54, 176),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/img/mask.png',
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'หน้ากากอนามัย KN95',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'หน้ากากใยสังเคราะห์ขึ้นรูปคล้องหู แบบพับได้ สามารถดักกรองฝุ่นที่มีอนุภาคขนาดเล็ก, ละออง ฝอยสารเคมีและเชื้อโรคได้ดี ผ่านการทดสอบประสิทธิภาพการกรอบแบคทีเรีย (BFE) ได้มากกว่า 99% จาก Nelson Labs ประเทศสหรัฐอเมริกา',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
