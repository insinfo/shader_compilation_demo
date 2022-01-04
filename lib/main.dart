import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shader compilation error',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home Page'),
            ElevatedButton(
              child: Text('Go to WebViewPage'),
              onPressed: () {
                Navigator.push(ctx,
                    MaterialPageRoute(builder: (context) => WebViewPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBar(
          title: Text('WebView Page'),
        ),
        Expanded(
            child: Stack(children: <Widget>[
          WebView(
            initialUrl: 'https://www.riodasostras.rj.gov.br/coronavirus/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {},
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container(),
        ])),
      ],
    ));
  }
}
