import 'package:flutter/material.dart';
import 'package:lab1/model/newsapi.dart';

import '../api/get.dart';

class Dashboardpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return DashboardpageState();
  }
}
class DashboardpageState extends State<Dashboardpage>{

 late Future<NewsApi?> _futureNewsApi ;

  horizontalscrollitem(var size, Articles articledata){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Container(
            height: size.height/5,
            width: size.width/1.5,
            decoration: BoxDecoration(
          //    color: Color(color),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(articledata.urlToImage!
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
            child: Text(articledata!.title!,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 28,),overflow: TextOverflow.ellipsis,maxLines: 2,),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 15,
          child: Container(
            width: size.width/2,
            child: Text(articledata.publishedAt!,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureNewsApi =  GetApi().getNewsApicall();
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
            FutureBuilder(
                future: _futureNewsApi,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  switch (snapshot.connectionState){
                    case ConnectionState.none:
                      return CircularProgressIndicator();
                      // internet not working
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                      // progress bar //loading
                    case ConnectionState.waiting:
                      //loading
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      //ui
                      if(snapshot.hasData){

                        NewsApi data = snapshot.data;
                        return Column(
                          children: [
                            Container(
                              width: size.width,
                              height: size.height/5,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.articles!.length,
                                itemBuilder: (context, index) {
                                  return horizontalscrollitem(size, data.articles![index]);
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
                        );
                      }else{
                        // no data
                        return CircularProgressIndicator();
                      }
                  }
                }),





          ],
        ),
      ),
    );
  }

}