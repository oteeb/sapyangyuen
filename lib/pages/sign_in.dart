import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'home_page.dart';
import 'sign_up.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _isObscure = true;
  final _formkey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _firstpasswordController = TextEditingController();

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'Mitr'),
    fixedSize: const Size(250, 50),
    primary: Color.fromARGB(255, 218, 165, 32),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 54, 176),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Text(
              'เข้าสู่ระบบ',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: Align(
                          widthFactor: 0.0,
                          heightFactor: 0.0,
                          child: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                        ),
                        hintText: 'ชื่อ',
                        labelText: "ชื่อ :",
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
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: _firstpasswordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'รหัสผ่าน',
                        labelText: "รหัสผ่าน :",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                        var passNonNullValue = value ?? "";
                        if (passNonNullValue.isEmpty) {
                          return ("กรุณากรอกรหัสผ่าน !");
                          // } else if (passNonNullValue.length < 8) {
                          //   return ("รหัสผ่านต้องมีความยาวมากกว่า 8 ตัวอักษร");
                          // } else if (!regex.hasMatch(passNonNullValue)) {
                          //   return ("Password should contain upper,lower,digit and Special character ");
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 80,
                        width: 195,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) {
                              return signup();
                            }));
                          },
                          child: Text(
                            'สมัครสมาชิก',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 80,
                        width: 195,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return signup();
                            }));
                          },
                          child: Text(
                            'ลืมรหัสผ่าน ?',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('โอเค')),
                          );
                        }
                      },
                      child: const Text('เข้าสู่ระบบ'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
