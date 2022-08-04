import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up.dart';
import 'sign_in.dart';
import 'package:sapyangyuen/user/home_user.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 69, 118),
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
                child: Image.asset(
                  'assets/sy.png',
                  //color: Colors.white,
                  height: 250,
                  width: 250,
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
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.white),
                    
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
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 3, 144, 0)),
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
                    return homeuser();
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
                      Color.fromARGB(255, 129, 198, 90)),
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
                      .push(MaterialPageRoute(builder: (context) {
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
