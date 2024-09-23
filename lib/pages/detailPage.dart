import 'package:flutter/material.dart';

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
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height/4.1,
                  width: size.width,
                  color: Colors.blue,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),child:
                  Image.network("https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
                    ,fit: BoxFit.cover,)),
                ),

                Positioned(left: 15,top: 50,child: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,)),

                Positioned(right: 15,top: 50,child: Icon(Icons.share,color: Colors.white,size: 30,)),

                Center(child: Icon(Icons.play_circle,size: 50,color: Colors.white,))

              ],
            ),
          ],
        ),
      ),
    );
  }
}
