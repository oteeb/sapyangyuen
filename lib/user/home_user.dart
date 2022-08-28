import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_user.dart';
import 'package:sapyangyuen/pages/sign_in.dart';
import 'package:sapyangyuen/user/calendar.dart';
import 'package:sapyangyuen/user/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';
import 'home.dart';
import 'dart:convert' as convert;

class homeuser extends StatefulWidget {
  const homeuser({Key? key}) : super(key: key);

  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {
  String? finatoken;
  String? fname;
  String? lname;
  String? fullname;
  
  Future getdatasharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var datatoken = sharedPreferences.getString('token');
    setState(() {
      finatoken = datatoken;
    });
    var res = await CallAPI().getUserToken(finatoken, 'auth/users');
    var datares = convert.jsonDecode(res!.body);
    var data = UserModel.fromJson(datares);
    setState(() {
      fname = data.data?.user![0].name;
      lname = data.data?.user![0].familyName;
      fullname = '$fname'+' '+'$lname';
    });

    //print(data.data?.user![0].familyName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatasharedPreferences();
    fullname == null ? fullname = "กำลังโหลด..." : fullname;
        
  }

  void removeSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
  }

  int screensindex = 0;
  final screens = [
    Home(),
    calendar(),
    profile(),
    contact(),
  ];
  @override
  Widget build(BuildContext context) {
    EasyLoading.dismiss();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$fullname",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.black,
              tooltip: 'Logout',
              onPressed: () {
                EasyLoading.show(status: 'กำลังโหลด...');
                removeSharedPreferences();
                EasyLoading.dismiss();
                EasyLoading.showSuccess('ออกจากระบบ สำเร็จ !');
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return signin();
                }));
              },
            ),
          ),
        ],
      ),
      body: screens[screensindex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'หน้าหลัก'),
          TabItem(icon: Icons.calendar_month, title: 'ปฏิทิน'),
          TabItem(icon: Icons.person, title: 'โปรไฟล์'),
          TabItem(icon: Icons.contacts, title: 'การติดต่อ'),
        ],
        initialActiveIndex: screensindex, //optional, default as 0
        onTap: (index) => setState(() => screensindex = index),
        backgroundColor: Color.fromARGB(255, 40, 54, 176),
      ),
    );
  }
}
