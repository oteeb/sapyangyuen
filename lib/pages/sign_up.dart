import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'sign_in.dart';
import 'dart:core';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  _register() async {
    EasyLoading.dismiss();
    Map<String, String> data = {
      "name": _firstNameController.text,
      "familyName": _lastNameController.text,
      "phone": _phoneController.text,
    };
    EasyLoading.show(status: 'กำลังโหลด...');
    var res = await CallAPI().postRegister(data, 'register');
    var body = convert.jsonDecode(res!.body);
    var dataregister = body;
    if (body.isEmpty) {
      _register();
    }
    if (res.statusCode == 200) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess('${dataregister['message']}'); 
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return signin();
      }));
    } else {
      EasyLoading.dismiss();
      EasyLoading.showInfo('${dataregister['message']}');
    }
  }

  final _formkey = GlobalKey<FormState>();

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'Mitr'),
    fixedSize: const Size(250, 50),
    primary: Color.fromARGB(255, 159, 121, 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 54, 176),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            //padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/img/sy1.jpg',
                height: 230,
                width: 260,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'สมัครสมาชิก',
                style: GoogleFonts.getFont('Mitr',
                    fontSize: 30, color: Color.fromARGB(255, 255, 246, 246)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: 'ชื่อ *',
                      labelText: "ชื่อ * :",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อ !';
                      }
                      final nameRegExp = RegExp(r"^[a-zA-Zก-๏\s]+$");
                      var namevalue = value;
                      if (!nameRegExp.hasMatch(namevalue)) {
                        return 'กรุณากรอกชื่อที่มีแต่ตัวอักษร !';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: 'นามสกุล *',
                      labelText: "นามสกุล * :",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกนามสกุล !';
                      }
                      final lastNameRegExp = RegExp(r"^[a-zA-Zก-๏\s]+$");
                      var lastNamevalue = value;
                      if (!lastNameRegExp.hasMatch(lastNamevalue)) {
                        return 'กรุณากรอกชื่อที่มีแต่ตัวอักษร !';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintText: 'เบอร์โทรศัพท์ *',
                      labelText: "เบอร์โทรศัพท์ * :",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกเบอร์โทรศัพท์ !';
                      }
                      if (value.length < 10) {
                        return 'กรุณากรอกเบอร์โทรศัพท์ให้ครบ 10 หลัก !';
                      }
                      final phoneRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
                      var phonevalue = value;
                      if (!phoneRegExp.hasMatch(phonevalue)) {
                        return 'เบอร์โทรศัพท์ต้องมีตัวเลข 0-9 เท่านั้น !';
                      }
                      if (value.contains(" ")) {
                        return 'เบอร์โทรศัพท์ต้องไม่มีช่องว่าง !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return signin();
                      }));
                    },
                    child: Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        final firstname = _firstNameController.text;
                        final lastName = _lastNameController.text;
                        final phone = _phoneController.text;
                        if (firstname == null &&
                            lastName == null &&
                            phone == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('กรุณากรอกข้อมูล !')),
                          );
                        } else {
                          _register();
                        }
                      }
                    },
                    child: const Text('สมัครสมาชิก'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
