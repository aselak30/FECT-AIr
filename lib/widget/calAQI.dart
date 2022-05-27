import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

Future calculateAQI(double value)async{
 double AQI;
     if( value <= 12.0 )
    {
      AQI=4.16666667*value;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Good"}, {'Color': Colors.green}];
      return send;
      
 
    }
    else if(value <= 35.4)
    {
      AQI=((100-51)/(35.4-12.1))*(value-12.1)+51;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Modarate"}, {'Color': Colors.yellow}];
      return send;
    
 
    }
    else if(value <= 55.4)
    {

      AQI=((150-101)/(55.4-35.5))*(value-35.5)+101;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Unhealthy for sensitive groups"}, {'Color': Colors.orange}];
      return send;
      
 
    }
    else if(value <= 150.4)
    {
      AQI=((200-151)/(150-55.5))*(value-55.5)+151;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Unhealthy"}, {'Color': Colors.red}];
      return send;
    
 
    }
    else if(value <= 250.4)
    {
      AQI=((300-201)/(250.4-150.5))*(value-150.5)+201;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Very Unhealthy"}, {'Color': Colors.purple}];
      return send;
      
 
    }
    else if(value <= 350.4)
    {
      AQI=((400-301)/(350.4-250.5))*(value-250.5)+301;
      double AQI1 = (AQI).roundToDouble();
      var send = [{'AQI': AQI1}, {'status': "Hazardous"}, {'Color': Color.fromARGB(255, 85, 6, 0)}];
      return send;
     
 
    }
    else if(value <= 500.4)
    {
      AQI=((500-401)/(500.4-350.5))*(value-350.5)+401;
      double AQI1 = (AQI).roundToDouble();
       var send = [{'AQI': AQI1}, {'status': "Hazardous"}, {'Color': Color.fromARGB(255, 85, 6, 0)}];
      return send;
     
    }
    else
    {
 
      print("Sorry, Something was error");
 
    }
  }
