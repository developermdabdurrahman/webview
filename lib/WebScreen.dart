import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WebScreen extends StatefulWidget {

  //String img;
  //String title;
  String url;

  WebScreen({
    //required this.img,
    //required this.title,
    required this.url,
    super.key
  });

  @override
  State<WebScreen> createState() => _WebActivityState(url);
}

class _WebActivityState extends State<WebScreen> {

  //String img;
  //String title;
  String url;

  _WebActivityState( this.url);

  late InAppWebViewController webView;
  double _progress = 0;

  MySnackBar(message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black38,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return WillPopScope(
      onWillPop: () async {
        if (await webView.canGoBack()) {
          webView.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: WebUri.uri(Uri.parse('${url}'))),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (controller, url) {
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1
                  ? SizedBox(
                      height: 3,
                      child: LinearProgressIndicator(
                        value: _progress,
                        color: Colors.orange,
                        backgroundColor: Colors.orange.withOpacity(0.2),
                      ),
                    )
                  : const SizedBox(),
              StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                  print(snapshot.toString());
                  if (snapshot.hasData) {
                    ConnectivityResult? result = snapshot.data;

                    if (result == ConnectivityResult.mobile) {
                      // Connected to mobile
                      return connected();
                    } else if (result == ConnectivityResult.wifi) {
                      // connnected to wifi
                      return connected();
                    } else {
                      // no internet
                      return noInternet();
                    }
                  } else {
                    // show loading...
                    return loading();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
    );
  }

  Widget connected() {
    return const Center(
      child: Text(
        "",
        style: TextStyle(color: Colors.green, fontSize: 20),
      ),
    );
  }

  Widget noInternet() {
    return Container(
      width: MediaQuery.of(context).size.width, // Full width of the screen
      height: MediaQuery.of(context).size.height, // Full height of the screen
      decoration: const BoxDecoration(
        color: Colors.white, // Set your desired background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/nointernet.png',
            height: 300,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0),
            child: const Text(
              "No Internet Connection" ,
              style: TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Check your Connection",
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
