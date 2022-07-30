import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'sign_in.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_province.dart';
import 'dart:core';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  List<String> _provinceitems = [];
  List<String> _districtitems = [];
  List<String> _cantonsitems = [];

  late final Future <List<ModelProvince>?> _modelProvinceData;

  ProvinceDataApi() {
    _modelProvinceData = CallAPI().GetapiProvince();
    
  }



  @override
  void initState() {
    super.initState();
    ProvinceDataApi();
  }
  final _formkey = GlobalKey<FormState>();

  String? _provinceselected = null;
  String? _districtselected = null;
  String? _cantonselected = null;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _idcardController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _housenumberController = TextEditingController();
  TextEditingController _postcodeController = TextEditingController();

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'Mitr'),
    fixedSize: const Size(250, 50),
    primary: Color.fromARGB(255, 26, 62, 110),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _modelProvinceData,
          builder: (context, AsyncSnapshot<List<ModelProvince>?> snapshot) {
            final provincedata = snapshot.data;
            print(snapshot.connectionState);
            if (snapshot.hasData) {
              
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  //itemCount: json_Data == null ? 0 : json_Data.length,
                  itemBuilder: (context, index) {
                    final items = snapshot.data![index].id!.toString();
                    
                    return ListTile(
                      onTap: () {
                        
                      },
                      title: Text(snapshot.data![index].nameTh!),
                      subtitle: Text(items),
                    );
                  });

            } else {
              return Center(child: CircularProgressIndicator());

            }
          },
        ),
      );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color.fromARGB(255, 154, 220, 255),
  //     body: ListView(
  //       children: [
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Image.asset(
  //             'assets/sy.png',
  //             width: 130,
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             'สมัครสมาชิก',
  //             style: GoogleFonts.getFont('Mitr', fontSize: 30),
  //           ),
  //         ),
  //         Form(
  //           key: _formkey,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: TextFormField(
  //                   controller: _firstNameController,
  //                   decoration: InputDecoration(
  //                     labelText: "ชื่อ :",
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                     ),
  //                   ),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'กรุณากรอกชื่อ !';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: TextFormField(
  //                   controller: _lastNameController,
  //                   decoration: InputDecoration(
  //                     labelText: "นามสกุล :",
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                     ),
  //                   ),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'กรุณากรอกเบอร์นามสกุล !';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: TextFormField(
  //                   controller: _idcardController,
  //                   maxLength: 13,
  //                   decoration: InputDecoration(
  //                     labelText: "หมายเลขบัตรประจำตัวประชาชน :",
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                     ),
  //                   ),
  //                   keyboardType: TextInputType.number,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: TextFormField(
  //                   controller: _phoneController,
  //                   keyboardType: TextInputType.number,
  //                   maxLength: 10,
  //                   decoration: InputDecoration(
  //                     labelText: "เบอร์โทรศัพท์ :",
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                     ),
  //                   ),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'กรุณากรอกเบอร์โทรศัพท์ !';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                     child: Container(
  //                       padding: const EdgeInsets.all(10.0),
  //                       height: 80,
  //                       width: 180,
  //                       child: TextFormField(
  //                         controller: _housenumberController,
  //                         decoration: InputDecoration(
  //                           labelText: "บ้านเลขที่ :",
  //                           filled: true,
  //                           fillColor: Colors.white,
  //                           border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Container(
  //                       height: 80,
  //                       width: 180,
  //                       padding: const EdgeInsets.all(10.0),
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButtonFormField2(
  //                           decoration: InputDecoration(
  //                             labelText: "จังหวัด :",
  //                             filled: true,
  //                             fillColor: Colors.white,
  //                             border: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(5.0),
  //                             ),
  //                           ),
                            
  //                           hint: Text(
  //                             'เลือกจังหวัด',
  //                             style: TextStyle(
  //                               fontSize: 16,
  //                               color: Theme.of(context).hintColor,
  //                             ),
  //                           ),
  //                           items: _provinceitems.map(
  //                             (item) {
  //                               return DropdownMenuItem(
  //                                 child: Text(
  //                                   item,
  //                                   style: const TextStyle(
  //                                     fontSize: 16,
  //                                   ),
  //                                 ),
  //                                 value: _provinceselected,
  //                               );
  //                             },
  //                           ).toList(),
                            
  //                           onChanged: (value) {
  //                             setState(() {
  //                               _provinceselected = value as String;
  //                               //print(selectedValue);
  //                             });
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                     child: Container(
  //                       height: 80,
  //                       width: 180,
  //                       padding: const EdgeInsets.all(10.0),
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButtonFormField2(
  //                           decoration: InputDecoration(
  //                             labelText: "อำเภอ :",
  //                             filled: true,
  //                             fillColor: Colors.white,
  //                             border: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(5.0),
  //                             ),
  //                           ),
  //                           hint: Text(
  //                             'เลือกอำเภอ',
  //                             style: TextStyle(
  //                               fontSize: 16,
  //                               color: Theme.of(context).hintColor,
  //                             ),
  //                           ),
  //                           items: _districtitems
  //                               .map((item) => DropdownMenuItem<String>(
  //                                     value: item,
  //                                     child: Text(
  //                                       item,
  //                                       style: const TextStyle(
  //                                         fontSize: 16,
  //                                       ),
  //                                     ),
  //                                   ))
  //                               .toList(),
  //                           value: _districtselected,
  //                           onChanged: (value) {
  //                             setState(() {
  //                               _districtselected = value as String;
  //                               //print(selectedValue);
  //                             });
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Container(
  //                       height: 80,
  //                       width: 180,
  //                       padding: const EdgeInsets.all(10.0),
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButtonFormField2(
  //                           decoration: InputDecoration(
  //                             labelText: "ตำบล :",
  //                             filled: true,
  //                             fillColor: Colors.white,
  //                             border: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(5.0),
  //                             ),
  //                           ),
  //                           hint: Text(
  //                             'เลือกตำบล',
  //                             style: TextStyle(
  //                               fontSize: 16,
  //                               color: Theme.of(context).hintColor,
  //                             ),
  //                           ),
  //                           items: _cantonsitems
  //                               .map((item) => DropdownMenuItem<String>(
  //                                     value: item,
  //                                     child: Text(
  //                                       item,
  //                                       style: const TextStyle(
  //                                         fontSize: 16,
  //                                       ),
  //                                     ),
  //                                   ))
  //                               .toList(),
  //                           value: _cantonselected,
  //                           onChanged: (value) {
  //                             setState(() {
  //                               _cantonselected = value as String;
  //                               //print(selectedValue);
  //                             });
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                     child: Container(
  //                       padding: const EdgeInsets.all(10.0),
  //                       height: 100,
  //                       width: 195,
  //                       child: TextFormField(
  //                         maxLength: 5,
  //                         keyboardType: TextInputType.number,
  //                         decoration: InputDecoration(
  //                           labelText: "รหัสไปรษณีย์ :",
  //                           filled: true,
  //                           fillColor: Colors.white,
  //                           border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Container(
  //                       padding: const EdgeInsets.all(10.0),
  //                       height: 80,
  //                       width: 195,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 padding: const EdgeInsets.all(10.0),
  //                 alignment: Alignment.bottomLeft,
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     Navigator.of(context)
  //                         .push(MaterialPageRoute(builder: (context) {
  //                       return signin();
  //                     }));
  //                   },
  //                   child: Text(
  //                     'เข้าสู่ระบบ',
  //                     style: TextStyle(fontSize: 18),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: ElevatedButton(
  //                   style: style,
  //                   onPressed: () {
  //                     if (_formkey.currentState!.validate()) {
  //                       final name = _firstNameController.text;
  //                       print(_provinceselected);

  //                       ScaffoldMessenger.of(context).showSnackBar(
  //                         const SnackBar(content: Text('โอเค')),
  //                       );
  //                     }
  //                   },
  //                   child: const Text('สมัครสมาชิก'),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
