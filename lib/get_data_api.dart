import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future fetchData(String id) async {
  var API_URL = 'https://api.purpleair.com/v1/sensors/$id';
  final response = await http.get(
    Uri.parse(API_URL),
    headers: {'X-API-Key': 'FCE38E58-D15E-11EC-B330-42010A800004'},
  );
  // final data = json.decode(response.body);
  if (response.statusCode == 200) {
    final data = response.body;
    final pm1 = await jsonDecode(data)['sensor']['stats_a']['pm2.5'];
    final pm2 = await jsonDecode(data)['sensor']['stats_b']['pm2.5'];

    final avgpm = (pm1 + pm2) / 2;
    double avgpm2 = (avgpm).roundToDouble();

    return avgpm2;
  } else {
    print(response.statusCode);
  }
  // return data;
}
