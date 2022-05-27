import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Federation for Environment,',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            accountEmail: Text('Climate & Technology',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: 
                Image.asset(
                  'assets/Federation_ECT_LOGO_Ver4.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/drawer_back.jpg')),
            ),
          ),

          ListTile(
            leading: Icon(Icons.web),
            title: Text('About FECT'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email Us'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Our Location'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Our Projects'),
            onTap: () => null,
          ),
          
          
          
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}




