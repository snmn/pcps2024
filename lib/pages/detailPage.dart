import 'package:flutter/material.dart';

import 'dashboard.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height/4.1,
                  width: size.width,
                  color: Colors.black,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),child:
                  Image.network("https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
                    ,fit: BoxFit.cover,)),
                ),

                Positioned(left: 15,top: 50,child: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,)),

                Positioned(right: 15,top: 50,child: Icon(Icons.share,color: Colors.white,size: 30,)),

                Container(  height: size.height/4.1,
                    width: size.width,child: Center(child: Icon(Icons.play_circle,size: 50,color: Colors.white,)))

              ],
            ),

            Container(
              padding: EdgeInsets.only(top: 15,bottom: 10),
              width: size.width/1.1,
              child: Text("Todays news updates sept 2024",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 28,),overflow: TextOverflow.ellipsis,maxLines: 2,),
            ),

            Container(
              width: size.width/1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Season Maharjan",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                      fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,),
                  Text("29th Sept 2024",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                      fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,)
                ],
              ),
            ),

            Container(
              width: size.width/1.1,
              child: Text("Todays news updates sept 2024Todays news updates "
                  "sept 2024Todays news updates sept 2024Todays news updates "
                  "sept 2024Todays news updates sept 2024Todays news "
                  "updates sept 2024",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 15,),textAlign: TextAlign.justify,overflow: TextOverflow.ellipsis,maxLines: 8,),
            ),


            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.zero,
              height: size.height/2.2,
              width: size.width/1,
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return dashboardPageState.verticalscollfunc(size);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
