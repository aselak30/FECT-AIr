// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http; 

// // Future fetchData(String id) async {
// //     var API_URL =  'https://api.purpleair.com/v1/sensors/$id';
// //     final response = await http.get(Uri.parse(API_URL), headers: {'X-API-Key': 'FCE38E58-D15E-11EC-B330-42010A800004'},);
// //     // final data = json.decode(response.body);
// //     final data= response.body;
// //     final pm1=await jsonDecode(data)['sensor']['stats_a']['pm2.5'];
// //     final pm2= await jsonDecode(data)['sensor']['stats_b']['pm2.5'];


// //     final avgpm=(pm1+pm2)/2;
// //     double avgpm2 = (avgpm).roundToDouble();
 
// //     return avgpm2;
    
// //     // return data;


// //   }



//   void getData() async{
//     String cityname="kandy";
//     http.Response response= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=5ad97be3f85e1b2f0066ff293d266499'));
    
//     if(response.statusCode==200){
//       String data=response.body;

      
//       var longitude=jsonDecode(data)['coord']['lon'];
//       var watherdiscription=jsonDecode(data)['weather'][0]['main'];
//       var temporature=jsonDecode(data)['main']['temp'];
//       var timezone=jsonDecode(data)['name'];
//       var wind=jsonDecode(data)['wind']["speed"];

     
//       print(wind);

//     }else{
//       print(response.statusCode);
//     }


//   }
 