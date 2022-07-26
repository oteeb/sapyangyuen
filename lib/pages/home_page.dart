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
      
          backgroundColor: Color.fromARGB(255, 154, 220, 255),
          body: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Image.asset(
                        'assets/sy.png',
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        height: 180,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          //overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
                          shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 12, 0, 187)),
                          minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                          shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return signup();

                            })
                          );
                        },
                        child: Text('ลงทะเบียน',style: GoogleFonts.getFont('Mitr'),),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          //overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
                          shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 110, 108, 232)),
                          minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                          shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return signin();

                            })
                          );
                        },
                        child: Text('เข้าสู่ระบบ',style: GoogleFonts.getFont('Mitr'),),
                      ),
                    ],
                  )
                ],
              )));
    
  }
}