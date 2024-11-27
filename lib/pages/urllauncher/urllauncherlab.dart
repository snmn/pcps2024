import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllauncherlab extends StatefulWidget {
  const Urllauncherlab({super.key});

  @override
  State<Urllauncherlab> createState() => _UrllauncherlabState();
}

class _UrllauncherlabState extends State<Urllauncherlab> {


  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse("https://season.info.np"))) {
      throw Exception('Could not launch');
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  _launchUrl();
                },
                child: Container(
                  color: Colors.redAccent,
                  padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                  child: Text("URL LAUNCHER LAB"),
                ),
              )
            ],
          ),
        ),
      );
    }
}
