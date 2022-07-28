import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future getdatapm(String id) async {
 
  var API_URL = 'https://api.purpleair.com/v1/sensors/$id';
  final response = await http.get(
    Uri.parse(API_URL),
    headers: {'X-API-Key': 'FCE38E58-D15E-11EC-B330-42010A800004'},
  );
  // final data = json.decode(response.body);
  if (response.statusCode == 200) {
    try{
          final data = response.body;
          final now = await jsonDecode(data)['sensor']['stats_a']['pm2.5'];
          final _10min = await jsonDecode(data)['sensor']['stats_b']['pm2.5_10minute'];
          final _30min = await jsonDecode(data)['sensor']['stats_b']['pm2.5_30minute'];
          final _1hr = await jsonDecode(data)['sensor']['stats_b']['pm2.5_60minute'];
          final _6hr = await jsonDecode(data)['sensor']['stats_b']['pm2.5_6hour'];
          final _day = await jsonDecode(data)['sensor']['stats_b']['pm2.5_24hour'];
          final week = await jsonDecode(data)['sensor']['stats_b']['pm2.5_1week'];
          final humidity = await jsonDecode(data)['sensor']['humidity'];
          final temperature = await jsonDecode(data)['sensor']['temperature'];
          final pressure = await jsonDecode(data)['sensor']['pressure'];


           var send1 = [
             {'now': now}, 
             {'10min': _10min}, 
             {'30min': _30min},
             {'1hr': _1hr},
             {'6hr': _6hr},
             {'day': _day},
             {'week': week},
             {'humidity': humidity},
             {'temperature': temperature},
             {'pressure': pressure},
             ];
            return send1;
    }catch(e){
      print(e);
    }

  } else {
    print(response.statusCode);
  }
 
  // return data;
}
