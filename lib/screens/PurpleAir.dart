
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




class PurpleAir extends StatefulWidget {
  const PurpleAir({ Key? key }) : super(key: key);

  @override
  _PurpleAirState createState() => _PurpleAirState();
}

class _PurpleAirState extends State<PurpleAir> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PurpleAir")),
      body: const WebView(
        // initialUrl: "https://www.google.com/",
        initialUrl: "https://map.purpleair.com/1/mAQI/a10/p604800/cC0#6.69/7.617/80.803",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}