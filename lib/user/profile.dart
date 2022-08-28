import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? finatoken;
  String? fname;
  String? lname;
  String? fullname;
  var dataloading;

  Future<UserModel> getdatasharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var datatoken = sharedPreferences.getString('token');
    var res = await CallAPI().getUserToken(datatoken, 'auth/users');
    var datares = convert.jsonDecode(res!.body);
    var data = UserModel.fromJson(datares);
    // print(data.data?.user![0].name);
    // print(data);
    return (data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 197, 197),
      body: FutureBuilder<UserModel?>(
        future: getdatasharedPreferences(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Center(
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 300,
                          color: Color.fromARGB(255, 40, 54, 176),
                        ),
                        Positioned(
                          left: 135,
                          top: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                child: Image.asset(
                                  'assets/img/sy1.jpg',
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Container(
                              width: 150,
                              height: 150,
                              color: Color.fromARGB(255, 197, 197, 197),
                            ),
                          ),
                        ),
                        if (data.data?.user![0].profileImage == null)
                          Positioned(
                            top: 130,
                            left: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Container(
                                width: 130,
                                height: 130,
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Image.asset(
                                  'assets/img/profile.png',
                                ),
                              ),
                            ),
                          ),
                        if (data.data?.user![0].profileImage != null)
                          Positioned(
                            top: 130,
                            left: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Container(
                                width: 130,
                                height: 130,
                                color: Color.fromARGB(255, 255, 0, 0),
                                child: Image.network(
                                    '${data.data?.user![0].profileImage}'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: 350,
                  height: 40,
                  child: Text(
                    '${data.data?.user![0].name} ${data.data?.user![0].familyName}',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (data.data?.user![0].province != null)
                  Container(
                    //alignment: Alignment.center,
                    width: 350,
                    height: 40,
                    //color: Color.fromARGB(255, 255, 7, 226),
                    child: Text(
                      'สาขา ${data.data?.user![0].province}',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (data.data?.user![0].province == null)
                  Container(
                    //alignment: Alignment.center,
                    width: 350,
                    height: 50,
                    //color: Color.fromARGB(255, 255, 7, 226),
                    child: Text(
                      'กรุณาเพิ่มข้อมูลจังหวัดของคุณ !',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    Positioned(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 300,
                          height: 150,
                          color: Color.fromARGB(208, 255, 255, 255),
                          //child: Text('คุณมีคะแนนสะสม'),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        width: 180,
                        height: 150,
                        child: Text(
                          'คุณมีคะแนนสะสม',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 180,
                      child: Container(
                        alignment: Alignment.center,
                        height: 130,
                        width: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 180,
                      child: Container(
                        //color: Color.fromARGB(255, 215, 2, 2),
                        alignment: Alignment.center,
                        width: 120,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '10',
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'คะแนน',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
