import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> createToken(String code) async {
  var headers = {
    'Authorization':
        'Basic NGUxMGNkMzktNTYwYy00NTlmLTljNmEtNDM2ZTkwZDRkNzZiOjgwMzljNmE5LTdlODItNGQwMi1iZTBlLWNkMmRkNmIwMTc4Yg==',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie':
        'AWSALB=CO7qq4Z9Nfi5V19Wqegfa4MO3wppkrKiTg34xI8OwcL6Q8RXYttPEO23/at1EzDL5gJxy5KBR23UNvBpMUlf7hunveDiJ7rld4BeuMaO2bFVtXyx9bz35qUAmG7X; AWSALBCORS=CO7qq4Z9Nfi5V19Wqegfa4MO3wppkrKiTg34xI8OwcL6Q8RXYttPEO23/at1EzDL5gJxy5KBR23UNvBpMUlf7hunveDiJ7rld4BeuMaO2bFVtXyx9bz35qUAmG7X'
  };
  var request = http.Request(
      'POST', Uri.parse('https://polarremote.com/v2/oauth2/token'));
  request.bodyFields = {'grant_type': 'authorization_code', 'code': code};
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  String responseString = await response.stream.bytesToString();

  return responseString.substring(17, 49);
}

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key});
  final Completer<WebViewController> controller;
  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  late String token;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl:
              'https://flow.polar.com/oauth2/authorization?response_type=code&client_id=4e10cd39-560c-459f-9c6a-436e90d4d76b',
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) async {
            setState(() {
              loadingPercentage = 100;
            });
            if (url.contains("code")) {
              List<String> splitUrL = url.toString().split("code=");

              String code = splitUrL[1];
              String s = await createToken(code);
              setState(() {
                token = s;
                //token = 'abd614bcaef99145445f5a9e18f70f7f';
              });
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('token', token);

              print(token);
//'/userInformation'    '/activity'    '/exercises' sleep
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/sleep', (Route<dynamic> route) => false);
            }
          },
          /*navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.prevent;
          },*/
          javascriptMode: JavascriptMode.unrestricted,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
