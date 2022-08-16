import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class intropage2 extends StatelessWidget {
  const intropage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 40, 54, 176),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/img/food_supplement.png',           
          ),
           SizedBox(
            height: 25,
          ),
          Text(
            'ผลิตภัณฑ์เสริมอาหาร',
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
                'เป็นตัวช่วยควบคุมน้ําหนักดูแลรูปร่าง ลดหน้าท้อง ขจัดไขมันส่วนเกิน โดยเร่งการเผาผลาญไขมันส่วนเกินที่มีอยู่เดิมออก แล้วยังอุดมไปด้วยสารสกัดที่ช่วยปกป้องผิวจากการเสื่อมสลายทํา ให้ผิวพรรณดูเปล่งปลั่ง กระจ่างใส เป็นตัวช่วยควบคุม น้ําหนัก ดูแลรูปร่าง ลดหน้าท้อง ขจัดไขมันส่วนเกิน',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}