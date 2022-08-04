import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_province.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Future<List<ModelProvince>?> _modelProvinceData;

  ProvinceDataApi() {
    _modelProvinceData = CallAPI().GetapiProvince();
  }

  @override
  void initState() {
    super.initState();
    ProvinceDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _modelProvinceData,
        builder: (context, AsyncSnapshot<List<ModelProvince>?> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    title: Text(snapshot.data![index].nameTh!),
                    subtitle: Text(snapshot.data![index].nameEn!),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
