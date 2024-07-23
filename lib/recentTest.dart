import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllRecentContest extends StatefulWidget {
  const AllRecentContest({super.key});

  @override
  State<AllRecentContest> createState() => _AllRecentContestState();
}

class _AllRecentContestState extends State<AllRecentContest> {
  List list = [];
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/recent.json").then((
        value) {
      setState(() {
        list = json.decode(value);
      });
    });
    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((
        value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    int _currentIndex = 0;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text("Recent Contest",style: TextStyle(color: Color(0xFF69c5df),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),

          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top:20 ,left: 20, right: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(

                        children: [

                          for(int i = 0; i < info.length; i++)

                            Container(
                              height: 270,
                              margin: const EdgeInsets.only(bottom: 30),

                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed("/detail", arguments: {
                                    "title": info[i]["title"].toString(),
                                    "text": info[i]["text"].toString(),
                                    "name": info[i]["name"].toString(),
                                    "img": info[i]["img"].toString(),
                                    "time": info[i]["time"].toString(),
                                    "prize": info[i]["prize"].toString(),

                                  });
                                },


                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20),
                                  height: 220,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 20,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: i.isEven
                                          ? Color(0xFF69c5df)
                                          : Color(0xFF9294cc)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                info[i]["title"],
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white
                                                ),
                                              ),
                                              Expanded(child: Container())
                                            ],
                                          )
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: width,
                                        child: Text(
                                          info[i]["text"],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFb8eefc)
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Divider(thickness: 1.0,),
                                      Row(
                                          children: [for(int i = 0; i < 4; i++)
                                            Container(

                                              width: 50,
                                              height: 50,
                                              child: Container(

                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(25),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          info[i]["img"],
                                                        ),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            )
                                          ]


                                      ),
                                    ],

                                  ),
                                )
                                ,),
                            ),
                        ]),
                  ),
                ),
              ],
            ))
    );
  }

}
