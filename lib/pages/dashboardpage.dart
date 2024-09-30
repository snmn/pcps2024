import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return DashboardpageState();
  }
}
class DashboardpageState extends State<Dashboardpage>{

  horizontalscrollitem(var size, int color){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Container(
            height: size.height/5,
            width: size.width/1.5,
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
              ,fit: BoxFit.cover,),
              // Image.asset("images/bg.png"
              // ,fit: BoxFit.cover,),
            ),
          ),
        ),

        Positioned(
          bottom: 30,
          left: 15,
          child: Container(
            width: size.width/2,
            child: Text("Todays news updates sept 2024",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 28,),overflow: TextOverflow.ellipsis,maxLines: 2,),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 15,
          child: Container(
            width: size.width/2,
            child: Text("23rd Sept 2024",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,
                fontSize: 15,),overflow: TextOverflow.ellipsis,maxLines: 1,),
          ),
        ),
      ],
    );
  }

  verticalitem(var size, int color){
    return Container(
      height: size.height/5,
      width: size.width/1.2,
      margin: EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(15),

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
            width: size.width,
              height: size.height/5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return horizontalscrollitem(size, 0xff5121fff);
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: size.height/1.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffff55555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xfff333555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xff222f555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffffff555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffffff555),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}