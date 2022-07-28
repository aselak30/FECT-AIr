 Future derection (double derection)async{
   String derec;
   
     if( derection == 0.0 )
    {
      String derec="N";
      return derec;
    }
    else if(derection < 90.0)
    {
      String derec="NE";
      return derec;
    }
    else if(derection == 90.0)
    {
      String derec="E";
      return derec;
    }
    else if(derection < 180.0)
    {
      String derec="SE";
      return derec;
    }
    else if(derection == 180.0)
    {
      String derec="S";
      return derec;
    }
    else if(derection < 270.0)
    {
      String derec="SW";
      return derec;
    }
    else if(derection == 270.0)
    {
      String derec="W";
      return derec;
    }
    else if(derection < 0.0)
    {
      String derec="NW";
      return derec;
    }
    else
    {
      print("Sorry, Something was error");
    }
  }