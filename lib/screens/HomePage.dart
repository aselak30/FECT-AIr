import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_air/get_data_api.dart';
import 'package:clean_air/get_data_api2.dart';
import 'package:clean_air/screens/PurpleAir.dart';
import 'package:clean_air/screens/more_details.dart';
import 'package:clean_air/screens/notifications.dart';
import 'package:clean_air/widget/SideNavBar.dart';
import 'package:clean_air/widget/calAQI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String face = 'assets/ic-face-green.svg';

  List<Widget> images = [];

  double pmakurana = 0.0;
  double pmnawalapitiya = 0.0;
  double pmcolombo = 0.0;
  double gregorypm = 0.0;

  List akuAQI = [
    {'AQI': 0.0},
    {'status': "Good"},
    {'Color': Colors.green}
  ];
  List nawalaAQI = [
    {'AQI': 0.0},
    {'status': "Good"},
    {'Color': Colors.green}
  ];
  List colomboAQI = [
    {'AQI': 0.0},
    {'status': "Good"},
    {'Color': Colors.green}
  ];
  List gregoryAQI = [
    {'AQI': 0.0},
    {'status': "Good"},
    {'Color': Colors.green}
  ];
  // var nawalaAQI;
  // var colomboAQI;
  // var gregoryAQI;

  int activeIndex = 0;

  Future getDocs() async {
    setState(() {
      images.add(Container(
        height: 100,
        width: 1000,
        // margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            image: const DecorationImage(
          image: AssetImage("assets/carosel_image.jpg"),
          // image: NetworkImage(
          //     "https://th.bing.com/th/id/R.8a3cdeb6e130e718a37bfbf049073835?rik=3D0sf0aB9DnkxA&pid=ImgRaw&r=0"),
          fit: BoxFit.cover,
        )),
      ));
    });
  }

  waitingList() {
    cal();
    AQIcal();
  }

  void cal() async {
    var place1PM = await fetchData("12451");
    var place2PM = await fetchData("21935");
    var place3PM = await fetchData("28433");
    var place4PM = await fetchData("29677");

    setState(() {
      pmakurana = place1PM;
      pmnawalapitiya = place2PM;
      pmcolombo = place3PM;
      gregorypm = place4PM;
    });
  }

  void AQIcal() async {
    var pmakura = await calculateAQI(pmakurana);
    var pmnwala = await calculateAQI(pmnawalapitiya);
    var pmcolom = await calculateAQI(pmcolombo);
    var pmputta = await calculateAQI(gregorypm);

    setState(() {
      akuAQI = pmakura;
      nawalaAQI = pmnwala;
      colomboAQI = pmcolom;
      gregoryAQI = pmputta;
    });
  }

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDocs();

    // cal();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => waitingList());

    setState(() {});
  }

  GestureDetector card({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoreDetailsAir(color, location, point, pm,
                    Percentage, AQI, image, gdbad, percentCol)));
      },
      child: Card(
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
                      progressColor: color,
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
      ),
    );

    // GestureDetector card({
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
    //   return GestureDetector(
    //     onTap: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => MoreDetailsAir(color, location, point, pm,
    //                   Percentage, AQI, image, gdbad, percentCol)));
    //     },
    //     child: Card(
    //       color: Colors.transparent,
    //       child: Container(
    //         height: 300,
    //         width: 500,
    //         // padding: const EdgeInsets.all(12.0),
    //         child: Column(
    //           children: [
    //             Container(
    //               padding: const EdgeInsets.all(12.0),
    //               height: 50,
    //               width: 500,
    //               child: Text(
    //                 location!,
    //                 style: const TextStyle(fontSize: 25),
    //                 textAlign: TextAlign.start,
    //               ),
    //             ),
    //             Row(
    //               children: [
    //                 Expanded(
    //                   flex: 4,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(30),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       // crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Column(
    //                           children: [
    //                             Text("$point",
    //                                 textAlign: TextAlign.center,
    //                                 style: const TextStyle(
    //                                     color: Colors.black, fontSize: 15)),
    //                           ],
    //                         ),
    //                         Column(
    //                           children: [
    //                             // Text(place1PM),
    //                             Text("$pm",
    //                                 textAlign: TextAlign.center,
    //                                 style: const TextStyle(
    //                                     color: Colors.black,
    //                                     fontSize: 18,
    //                                     fontWeight: FontWeight.bold)),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.all(15),
    //                   child: CircularPercentIndicator(
    //                     animation: true,
    //                     animationDuration: 1000,
    //                     radius: 100,
    //                     lineWidth: 10,
    //                     percent: Percentage!,
    //                     progressColor: percentCol,
    //                     backgroundColor: Color.fromARGB(255, 10, 44, 99),
    //                     circularStrokeCap: CircularStrokeCap.round,
    //                     center: Text(
    //                       "AQI-$AQI",
    //                       style: TextStyle(
    //                           fontSize: 15, fontWeight: FontWeight.bold),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Container(
    //                 padding: const EdgeInsets.all(1.0),
    //                 height: 120,
    //                 width: 500,
    //                 color: color,
    //                 child: Row(
    //                   children: [
    //                     Expanded(
    //                         flex: 4,
    //                         child: Padding(
    //                           padding: EdgeInsets.all(8),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Container(
    //                                   padding: EdgeInsets.only(left: 40),
    //                                   child: image),
    //                               Container(
    //                                 padding: EdgeInsets.only(right: 40),
    //                                 child: Text(
    //                                   gdbad!,
    //                                   style: TextStyle(fontSize: 17),
    //                                   textAlign: TextAlign.center,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         )),
    //                   ],
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        // backgroundColor: Color.fromARGB(255, 0, 136, 151),
        appBar: AppBar(
          title: Text("FECT Air"),
          backgroundColor: Color.fromARGB(255, 0, 16, 53),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   image: const DecorationImage(
          //     image: AssetImage("assets/background.jpg"),fit: BoxFit.cover
          //   )
          // ),

          child: ListView(
            children: [
              // Implement the image carousel
              CarouselSlider(
                items: images,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 180,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      if (mounted) {
                        setState(() => activeIndex = index);
                      }
                    }),
              ),

              const SizedBox(height: 20),

              const Text(
                'Real Time Air Qulity Monitoring',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              card(
                  color: nawalaAQI[2]['Color'],
                  location: "Nawalapitiya",
                  point: pmnawalapitiya,
                  pm: "PM2.5",
                  Percentage: nawalaAQI[0]['AQI'] / 500,
                  AQI: nawalaAQI[0]['AQI'],
                  image: Image.asset("assets/ic-face-green2.png"),
                  gdbad: nawalaAQI[1]['status'],
                  percentCol: nawalaAQI[2]['Color']),
              card(
                  color: akuAQI[2]['Color'],
                  location: "Akurana",
                  point: pmakurana,
                  pm: "PM2.5",
                  Percentage: akuAQI[0]['AQI'] / 500,
                  AQI: akuAQI[0]['AQI'],
                  image: Image.asset("assets/ic-face-green2.png"),
                  gdbad: akuAQI[1]['status'],
                  percentCol: akuAQI[2]['Color']),
              card(
                  color: colomboAQI[2]['Color'],
                  location: "Overseas School of Colombo",
                  point: pmcolombo,
                  pm: "PM2.5",
                  Percentage: colomboAQI[0]['AQI'] / 500,
                  AQI: colomboAQI[0]['AQI'],
                  image: Image.asset("assets/ic-face-green2.png"),
                  gdbad: colomboAQI[1]['status'],
                  percentCol: colomboAQI[2]['Color']),

              card(
                  color: gregoryAQI[2]['Color'],
                  location: "Gregory's Road",
                  point: gregorypm,
                  pm: " PM2.5",
                  Percentage: gregoryAQI[0]['AQI'] / 500,
                  AQI: gregoryAQI[0]['AQI'],
                  image: Image.asset("assets/ic-face-green2.png"),
                  gdbad: gregoryAQI[1]['status'],
                  percentCol: gregoryAQI[2]['Color']),

              const SizedBox(
                height: 10,
              ),

              // Card(
              //   color: Colors.transparent,
              //   shadowColor: Colors.red,
              //   child: Container(
              //     height: 250,
              //     width: 500,
              //     // padding: const EdgeInsets.all(12.0),
              //     child: Column(
              //       children: [
              //         Container(
              //           padding: const EdgeInsets.all(12.0),
              //           height: 57,
              //           width: 500,
              //           child: Text(
              //             "Nawalapitiya!",
              //             style: const TextStyle(
              //                 fontSize: 35, fontWeight: FontWeight.bold),
              //             textAlign: TextAlign.start,
              //           ),
              //         ),
              //         Divider(),
              //         Row(
              //           children: [
              //             Container(
              //               padding: EdgeInsets.only(left: 10, bottom: 5),
              //               child: CircleAvatar(
              //                 radius: 61.0,
              //                 backgroundImage:
              //                     AssetImage('assets/ic-face-green2.png'),
              //                 backgroundColor: Colors.red,
              //               ),
              //             ),
              //             Expanded(
              //               flex: 3,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   // crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Column(
              //                       children: [
              //                         Text("12.1",
              //                             textAlign: TextAlign.center,
              //                             style: const TextStyle(
              //                                 color: Colors.black,
              //                                 fontSize: 30,
              //                                 fontWeight: FontWeight.bold)),
              //                       ],
              //                     ),
              //                     Column(
              //                       children: [
              //                         // Text(place1PM),
              //                         Text("PM2.5 | µg/m³",
              //                             textAlign: TextAlign.center,
              //                             style: const TextStyle(
              //                                 color: Colors.black,
              //                                 fontSize: 14,
              //                                 fontWeight: FontWeight.bold)),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(right: 10),
              //               child: CircularPercentIndicator(
              //                 animation: true,
              //                 animationDuration: 1000,
              //                 radius: 120,
              //                 lineWidth: 10,
              //                 percent: 0.2,
              //                 progressColor: Colors.green,
              //                 backgroundColor: Color.fromARGB(255, 10, 44, 99),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //                 center: Text(
              //                   "AQI-122",
              //                   style: TextStyle(
              //                       fontSize: 30, fontWeight: FontWeight.bold),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Container(
              //             padding: const EdgeInsets.all(1.0),
              //             height: 50,
              //             color: Colors.red,
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                     flex: 4,
              //                     child: Padding(
              //                       padding: EdgeInsets.all(8),
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Container(
              //                             padding: EdgeInsets.only(right: 40),
              //                             child: Text(
              //                               "Unhealthy for sensitive groups",
              //                               style: TextStyle(
              //                                   fontSize: 20,
              //                                   fontWeight: FontWeight.bold),
              //                               textAlign: TextAlign.center,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     )),
              //               ],
              //             )),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
