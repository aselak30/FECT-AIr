import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_air/get_data_api.dart';
import 'package:clean_air/widget/calAQI.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MoreDetailsAir extends StatefulWidget {
  MoreDetailsAir(this.color, this.Location, this.point, this.pm,
      this.Percentage, this.AQI, this.image, this.gdbad, this.percentCol);

  var color;
  var Location;
  var point;
  var pm;
  var Percentage;
  var AQI;
  var image;
  var gdbad;
  var percentCol;

  // const MoreDetailsAir(String? location, {Key? key}) : super(key: key);

  @override
  State<MoreDetailsAir> createState() => _MoreDetailsAirState();
}

class _MoreDetailsAirState extends State<MoreDetailsAir> {
//     double pmakurana = 0.0;
//   double pmnawalapitiya = 0.0;
//   double pmcolombo = 0.0;
//   double gregorypm = 0.0;

//   List akuAQI = [{'AQI': 0.0}, {'status': "Good"}, {'Color': Colors.green}];
//   List nawalaAQI = [{'AQI': 0.0}, {'status': "Good"}, {'Color': Colors.green}];
//   List colomboAQI = [{'AQI': 0.0}, {'status': "Good"}, {'Color': Colors.green}];
//   List gregoryAQI = [{'AQI': 0.0}, {'status': "Good"}, {'Color': Colors.green}];

// waitingList() {
//   cal();
//   AQIcal();
// }

//   void cal()async{
//     var place1PM = await fetchData("12451");
//     var place2PM = await fetchData("21935");
//     var place3PM = await fetchData("28433");
//     var place4PM = await fetchData("29677");

//     setState(() {
//       pmakurana=place1PM;
//       pmnawalapitiya=place2PM;
//       pmcolombo=place3PM;
//       gregorypm=place4PM;
//     });
//   }

//    void AQIcal()async{
//     var pmakura= await calculateAQI(pmakurana);
//     var pmnwala= await calculateAQI(pmnawalapitiya);
//     var pmcolom= await calculateAQI(pmcolombo);
//     var pmputta= await calculateAQI(gregorypm);

//     setState(() {
//       akuAQI=pmakura;
//       nawalaAQI=pmnwala;
//       colomboAQI=pmcolom;
//       gregoryAQI=pmputta;
//     });

//   }

// Timer? timer;

// @override
// void dispose() {
//   timer?.cancel();
//   super.dispose();
// }

// void initState() {
//     // TODO: implement initState
//     super.initState();

//     // cal();
//     timer = Timer.periodic(Duration(seconds: 2), (Timer t) => waitingList());

//     setState(() {});
//   }

Card card({
    Color? color,
    String? location,
    double? point,
    String? pm,
    double? Percentage,
    double? AQI,
    Image? image,
    String? gdbad,
    Color? percentCol,
  }) {
    return Card(
        color: Colors.transparent,
        shadowColor: color,
        child: Container(
          height: 250,
          width: 500,
          // padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                height: 57,
                width: 500,
                child: Text(
                  location!,
                  style: const TextStyle(
                      fontSize: 34, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5,bottom: 5),
                    child: CircleAvatar(
                      radius: 61.0,
                      backgroundImage: AssetImage("assets/ic-face-green2.png"),
                      backgroundColor: color,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("$point",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: [
                              // Text(place1PM),
                              Text("PM2.5 | µg/m³",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: 120,
                      lineWidth: 10,
                      percent: Percentage!,
                      progressColor: Colors.green,
                      backgroundColor: Color.fromARGB(255, 10, 44, 99),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "AQI-$AQI",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                          padding: const EdgeInsets.all(1.0),
                          height: 50,
                          color: color,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 40),
                                          child: Text(
                                            "$gdbad",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          )),
            ],
          ),
        ),
    );
     


  // Card card({
  //   Color? color,
  //   String? location,
  //   double? point,
  //   String? pm,
  //   double? Percentage,
  //   double? AQI,
  //   Image? image,
  //   String? gdbad,
  //   Color? percentCol,
  // }) {
  //   return Card(
  //     color: Colors.transparent,
  //     child: Container(
  //       height: 300,
  //       width: 500,
  //       // padding: const EdgeInsets.all(12.0),
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(12.0),
  //             height: 50,
  //             width: 500,
  //             child: Text(
  //               location!,
  //               style: const TextStyle(fontSize: 25),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           Row(
  //             children: [
  //               Expanded(
  //                 flex: 4,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(30),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     // crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Column(
  //                         children: [
  //                           Text("$point",
  //                               textAlign: TextAlign.center,
  //                               style: const TextStyle(
  //                                   color: Colors.black, fontSize: 15)),
  //                         ],
  //                       ),
  //                       Column(
  //                         children: [
  //                           // Text(place1PM),
  //                           Text("$pm",
  //                               textAlign: TextAlign.center,
  //                               style: const TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize: 18,
  //                                   fontWeight: FontWeight.bold)),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.all(15),
  //                 child: CircularPercentIndicator(
  //                   animation: true,
  //                   animationDuration: 1000,
  //                   radius: 100,
  //                   lineWidth: 10,
  //                   percent: Percentage!,
  //                   progressColor: percentCol,
  //                   backgroundColor: Color.fromARGB(255, 10, 44, 99),
  //                   circularStrokeCap: CircularStrokeCap.round,
  //                   center: Text(
  //                     "AQI-$AQI",
  //                     style:
  //                         TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Container(
  //               padding: const EdgeInsets.all(1.0),
  //               height: 120,
  //               width: 500,
  //               color: color,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                       flex: 4,
  //                       child: Padding(
  //                         padding: EdgeInsets.all(8),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                                 padding: EdgeInsets.only(left: 40),
  //                                 child: image),
  //                             Container(
  //                               padding: EdgeInsets.only(right: 40),
  //                               child: Text(
  //                                 gdbad!,
  //                                 style: TextStyle(fontSize: 17),
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )),
  //                 ],
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 136, 151),
        appBar: AppBar(
          title: Text(widget.Location),
          backgroundColor: Color.fromARGB(255, 0, 16, 53),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              card(
                  color: widget.color,
                  location: widget.Location,
                  point: widget.point,
                  pm: "PM2.5",
                  Percentage: widget.Percentage,
                  AQI: widget.AQI,
                  image: widget.image,
                  gdbad: widget.gdbad,
                  percentCol: widget.percentCol),
              // ShaderMask(
              //   shaderCallback: (rect) {
              //     return SweepGradient(
              //             startAngle: 0.0,
              //             endAngle: 21,
              //             // 0.0 , 0.5 , 0.5 , 1.0
              //             center: Alignment.center,
              //             colors: [Colors.blue, Colors.grey.withAlpha(55)])
              //         .createShader(rect);
              //   },
              //   child: Container(
              //     padding: EdgeInsets.all(15),
              //     child: Stack(
              //       children: [
              //         Container(
              //           child: CircularPercentIndicator(
              //             animation: true,
              //             animationDuration: 1000,
              //             radius: 100,
              //             lineWidth: 10,
              //             percent: 0.4,
              //             progressColor: Color.fromARGB(255, 9, 42, 206),
              //             // backgroundColor: Color.fromARGB(255, 10, 44, 99),
              //             circularStrokeCap: CircularStrokeCap.round,
              //             center: Text(
              //               "1.8Kmh",
              //               style: TextStyle(
              //                   fontSize: 15, fontWeight: FontWeight.bold),
              //             ),
              //             // fillColor: Colors.white,
              //           ),
              //         ),
              //         Container(
              //           width: 100,
              //           height: 100,
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                   image: Image.asset("assets/radial_scale.png")
              //                       .image)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
