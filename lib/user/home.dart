import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:sapyangyuen/api/callapi/callapi.dart';
import 'package:sapyangyuen/api/model/model_province.dart';
import 'package:sapyangyuen/user/video_player.dart';
import 'dart:convert';
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
      backgroundColor: Color.fromARGB(255, 197, 197, 197),
      body: FutureBuilder(
        future: _modelProvinceData,
        builder: (context, AsyncSnapshot<List<ModelProvince>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
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
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        snapshot.data![index].nameTh!,
                                        style: TextStyle(
                                            fontSize: 20,
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
                                        snapshot.data![index].id.toString(),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.black),
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
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 400,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) =>
                                      setState(() => activeindex = index),
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Stack(
                                  children: <Widget>[
                                    Container(
                                      color: Color.fromARGB(255, 37, 147, 153),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.65,
                                      width: MediaQuery.of(context).size.width,
                                      //child: Text("itemIndex.toString()"),
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
                                            width: 45.0,
                                            child: Text(
                                              '${itemIndex + 1}/${snapshot.data!.length.toString()}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: activeindex,
                                  count: 5,
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
                      SizedBox(
                        height: 8,
                      ),

                      videoPlayer(),

                      SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                  // return ListTile(
                  //   onTap: () {},
                  //   title: Text(snapshot.data![index].nameTh!),
                  //   subtitle: Text(snapshot.data![index].nameEn!),
                  // );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
