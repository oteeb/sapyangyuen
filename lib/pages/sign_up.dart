import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'sign_in.dart';
import 'dart:core';
import 'package:sapyangyuen/api/model/model_province.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var _provinceitems = [];
  var _districtitems = [];
  var _cantonsitems = [];
  String? _provinceselected;
  String? _districtselected;
  String? _cantonselected;
  String? test = "";

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _idcardController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _housenumberController = TextEditingController();
  TextEditingController _postcodeController = TextEditingController();

  _register() async {
    Map<String, String> data = {
      "name": "${_firstNameController.text}",
      "familyName": "${_lastNameController.text}",
      //'"cardId"':'"${_idcardController.text}"',
      "phone": _phoneController.text,
      //'"houseNumber"':'"${_housenumberController.text}"',
      // '"province"':'"${_provinceselected}"',
      // '"amphur"':'"${_districtselected}"',
      // '"district"':'"${_cantonselected}"',
      //'"postcode"':'"${_postcodeController.text}"',
    };
    var res = await CallAPI().postRegister(data, 'register');

    var body = convert.jsonDecode(res!.body);
    var dataregister = body;
    print(dataregister['message']);
    if (res.statusCode == 200) {
      EasyLoading.showSuccess('${dataregister['message']}');
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    //     return signin();
    // }));
    } else {
      EasyLoading.showInfo('${dataregister['message']}');
      
    }
    
  }

  // this will help to show the widget after
  bool isprovinceSelected = false;
  bool isStateSelected = false;
  bool ispostcodeSelected = false;

  //late ModelProvince _dataproapi;

  String url =
      "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/countries%2Bstates%2Bcities.json";

  //http get request to get data from the link
  Future GetDataProvince() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        _provinceitems = jsonResponse;
      });

      print(_provinceitems);
    }
  }

  @override
  void initState() {
    super.initState();
    GetDataProvince();
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
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/img/sy1.jpg',
                width: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'สมัครสมาชิก',
              style: GoogleFonts.getFont('Mitr',
                  fontSize: 30, color: Color.fromARGB(255, 255, 246, 246)),
            ),
          ),
          if (_provinceitems.isEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 230,
                ),
                Text(
                  'กำลังโหลด...',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                CircularProgressIndicator()
              ],
            )
          else
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
                      controller: _idcardController,
                      maxLength: 13,
                      decoration: InputDecoration(
                        hintText: 'หมายเลขบัตรประจำตัวประชาชน',
                        labelText: "หมายเลขบัตรประจำตัวประชาชน :",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 80,
                          width: 180,
                          child: TextFormField(
                            controller: _housenumberController,
                            decoration: InputDecoration(
                              hintText: 'บ้านเลขที่',
                              labelText: "บ้านเลขที่ :",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          width: 180,
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              isDense: true,
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "จังหวัด :",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              hint: Text(
                                'เลือกจังหวัด',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: _provinceitems.map(
                                (item) {
                                  return DropdownMenuItem<String>(
                                      value: item["name"],
                                      child: Text(item["name"]));
                                },
                              ).toList(),
                              value: _provinceselected,
                              onChanged: (value) {
                                setState(() {
                                  _districtitems = [];
                                  _provinceselected = value!;
                                  for (int i = 0;
                                      i < _provinceitems.length;
                                      i++) {
                                    if (_provinceitems[i]["name"] == value) {
                                      _districtitems =
                                          _provinceitems[i]["states"];
                                    }
                                  }
                                  isprovinceSelected = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isprovinceSelected)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 180,
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2<String>(
                                decoration: InputDecoration(
                                  labelText: "อำเภอ :",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                hint: Text(
                                  'เลือกอำเภอ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                isDense: true,
                                isExpanded: true,
                                items: _districtitems.map(
                                  (dt) {
                                    return DropdownMenuItem<String>(
                                        value: dt["name"],
                                        child: Text(dt["name"]));
                                  },
                                ).toList(),
                                value: _districtselected,
                                onChanged: (value) {
                                  setState(() {
                                    _cantonsitems = [];
                                    _districtselected = value!;
                                    for (int i = 0;
                                        i < _districtitems.length;
                                        i++) {
                                      if (_districtitems[i]["name"] == value) {
                                        _cantonsitems =
                                            _districtitems[i]["cities"];
                                      }
                                    }
                                    isStateSelected = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 180,
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2<String>(
                                decoration: InputDecoration(
                                  labelText: "ตำบล :",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                hint: Text(
                                  'เลือกตำบล',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                isDense: true,
                                isExpanded: true,
                                items: _cantonsitems.map((ct) {
                                  return DropdownMenuItem<String>(
                                      value: ct["name"],
                                      child: Text(ct["name"]));
                                }).toList(),
                                value: _cantonselected,
                                onChanged: (value) {
                                  setState(() {
                                    _cantonselected = value!;

                                    ispostcodeSelected = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Container(),
                  if (ispostcodeSelected)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 100,
                            width: 195,
                            child: TextFormField(
                              controller: _postcodeController..text = '$test',
                              maxLength: 5,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'รหัสไปรษณีย์',
                                labelText: "รหัสไปรษณีย์ :",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 80,
                            width: 195,
                          ),
                        ),
                      ],
                    )
                  else
                    Container(),
                  Container(
                    padding: const EdgeInsets.all(10.0),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          final firstname = _firstNameController.text;
                          final lastName = _lastNameController.text;
                          final idcard = _idcardController.text;
                          final phone = _phoneController.text;
                          final housenumber = _housenumberController.text;
                          final province = _provinceselected;
                          final district = _districtselected;
                          final canton = _cantonselected;
                          final postcode = _postcodeController.text;
                          if (firstname == null &&
                              lastName == null &&
                              phone == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('กรุณากรอกข้อมูล !')),
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
