

import 'package:flutter/material.dart';


import 'package:webview/Themes/DarkTheme.dart';
import 'package:webview/Themes/LightTheme.dart';
import 'package:webview/WebScreen.dart';

void main() {
  runApp(const SportifyApp());
}

class SportifyApp extends StatelessWidget {
  const SportifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: true,
      title: 'Driver24u',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: ThemeMode.light,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      /*appBar: AppBar(
        title: Text('SPORTIFY'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _launchURL('mailto:Office@softroom.de');
                });
              },
              icon: const Icon(Icons.support_agent)),
          IconButton(
              onPressed: () {
                AboutAppDialog(
                    'Premium sports channels, Top Quality, Fair Prices, Unbeatable Streaming.');
              },
              icon: const Icon(Icons.info)),
        ],
      ),*/
      body: WebScreen(url: 'https://digitaldriverservice.com/',),
      /*drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text('SPORTIFY'),
                accountEmail: Text('Office@softroom.de'),
                currentAccountPicture: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48),
                      child: Image.asset('assets/images/logo.jpg'),
                    ),
                  ),
                ),
                onDetailsPressed: () {
                  setState(() {
                    _launchURL('mailto:Office@softroom.de');
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('Contact us'),
              onTap: () {
                setState(() {
                  _launchURL('mailto:Office@softroom.de');
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              },
            ),
          ],
        ),
      ),*/
    );
  }


}
