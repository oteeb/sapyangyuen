import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up.dart';
import 'sign_in.dart';


class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 54, 176),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/img/sy1.jpg',
                    height: 250,
                    width: 280,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 300,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    'ยินดีต้อนรับสู่ทรัพย์ยั่งยืน กรุณากด สมัครสมาชิก เพื่อสมัครสมาชิก หรือ กด เข้าสู่ระบบ เพื่อเข้าสู่ระบบ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  //overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
                  shadowColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 159, 121, 24)),
                  minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return signup();
                  }));
                },
                child: Text(
                  'สมัครสมาชิก',
                  style: GoogleFonts.getFont('Mitr'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  //overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
                  shadowColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 218, 165, 32)),
                  minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return signin();
                  }));
                },
                child: Text(
                  'เข้าสู่ระบบ',
                  style: GoogleFonts.getFont('Mitr'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
