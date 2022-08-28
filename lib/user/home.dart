import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_home.dart';
import 'package:sapyangyuen/api/model/model_province.dart';
import 'package:sapyangyuen/user/loading/loading.dart';
import 'package:sapyangyuen/user/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeindex = 0;
  bool img_vdo = false;

  var _modelProvinceData;
  var _newmodelProvinceData;
  
  


  ProvinceDataApi() {
    _modelProvinceData = CallAPI().GetapiProvince();
  }

  NewProvinceDataApi() {
    _newmodelProvinceData = CallAPI().GetapiProvince();
  }

  Future refresh() async {
    NewProvinceDataApi();
    setState(() {
      _modelProvinceData = _newmodelProvinceData;
    });
  }
late List data;
    Future<HomeModel> getdatasharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var datatoken = sharedPreferences.getString('token');
    var res = await CallAPI().getHome(datatoken, 'activity/images');

    var datares = convert.jsonDecode(res!.body);
    var data = HomeModel.fromJson(datares);

    print(data.data![1].createdAt);
    return (data);
  }

  @override
  void initState() {
    super.initState();
    //ProvinceDataApi();
    getdatasharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 197, 197),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder<HomeModel>(
          future: getdatasharedPreferences(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              
              return ListView.builder(
                  itemCount: data.data! == null ? 0 : data.data!.length,
                  itemBuilder: (BuildContext context, index) {

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          data.data![index].title.toString(),
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          DateFormat('dd/MM/yyyy').format(DateTime.parse(data.data![2].createdAt.toString())),
                                          textAlign: TextAlign.end,
                                          style: TextStyle(fontSize: 12,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Container(
                                    width: 380,
                                    child: Text(
                                      'ddfdsfdfsdfdsfzdsvzdsssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssvzdvzdvdvdvzdvzdvzvdvdcsdcsdzdvzdvzsdvdsvdszgdfgdtrhdtfhxfhgfhdfhdta',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    CarouselSlider.builder(
                                      options: CarouselOptions(
                                        height: 400,
                                        //autoPlay: true,
                                        viewportFraction: 1.0,
                                        enableInfiniteScroll: true,
                                        onPageChanged: (index, reason) =>
                                            setState(() => activeindex = index),
                                      ),

                                      itemCount: data.data!.length,
                                      itemBuilder: (BuildContext context,
                                              int itemIndex,
                                              int pageViewIndex) => 
                                          Container(
                                        color:
                                            Color.fromARGB(255, 37, 147, 153),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        
                                        child: Text("${itemIndex+1}"),
                                      ),
                                      
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            color:
                                                Color.fromARGB(77, 50, 71, 72),
                                            height: 20.0,
                                            width: 55.0,
                                            child: Text(
                                              '${activeindex + 1}/${data.data!.length.toString()}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: activeindex,
                                    count: data.data!.length,
                                    effect: ScrollingDotsEffect(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return loadingHome();
            }
          },
        ),
      ),
    );
  }
}
