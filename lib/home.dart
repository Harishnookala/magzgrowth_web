import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Repository/routes.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return OrientationBuilder(

      builder: (context, orient) {

        return orient == Orientation.portrait

            ? _VerticalDisplay()

            : _HorizontalDisplay();

      },

    );
  }

  _HorizontalDisplay() {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      children: [
        Container(
          margin: EdgeInsets.all(16.3),
          child: Row(
            children: [
              Container(
                width: 600,
                height: 800,
                child: Image.asset("assets/Images/splash_screen.jpg",),
                alignment: Alignment.topLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35,vertical: 35),
                child: Column(
                  children: [
                    Container(child: Text("Smart Investors Use",style: const TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 40,),
                    Container(child: Text("Ovation Money",style: const TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 40,),
                    Container(child: Text("What about You ?",style: const TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 40,),
                    Container(child: Text("Investing For All",style: const TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 40,),
                    Container(child: Text("Investing Smart",style: const TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 40,),
                    Container(child: const Text("Investing By Yourself",style: TextStyle(fontFamily: "Poppins",fontSize: 24)),),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _VerticalDisplay()  {
    final ref = FirebaseStorage.instance
        .ref("Apk file/")
        .child("app-release" + ".apk");
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      children: [
        Container(
          child: Image.asset("assets/Images/splash_screen.jpg",),
          alignment: Alignment.topLeft,
        ),
      Container(
        margin: EdgeInsets.all(12.3),
        child: Column(
          children: [
            Container(child: Text("Smart Investors Use",style: const TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 40,),
            Container(child: Text("Ovation Money",style: const TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 40,),
            Container(child: Text("What about You ?",style: const TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 40,),
            Container(child: Text("Investing For All",style: const TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 40,),
            Container(child: Text("Investing Smart",style: const TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 40,),
            Container(child: const Text("Investing By Yourself",style: TextStyle(fontFamily: "Poppins",fontSize: 15)),),
            SizedBox(height: 20,),
          ],
        ),
      ),
       Container(
         margin: EdgeInsets.all(12.3),
         child: TextButton(
           style: TextButton.styleFrom(
               padding: EdgeInsets.zero,
               minimumSize: const Size(80, 30),
               alignment: Alignment.center,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.3),),
              backgroundColor: Colors.orange.shade300
           ),
             onPressed: () async{
             var uri = Uri.parse("https://firebasestorage.googleapis.com/v0/b/magzgrowth-e18af.appspot.com/o/Apk%20file%2Fapp-release.apk?"
                 "alt=media&token=6a31f6b4-172f-4fa8-9a1e-d38dd59517cf");
               await launchUrl(uri,mode: LaunchMode.externalApplication);
           }, child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 child: Icon(Icons.android_outlined,color: Colors.green.shade900,size: 28),
               ),
               Container(
                   margin: EdgeInsets.all(12.3),
                   child: Text("Download App", style: TextStyle(color: Colors.black,
                       fontSize: 16.2,fontWeight: FontWeight.bold,
                       letterSpacing: 1.0,fontStyle: FontStyle.normal),)),
             ],
           )),
       )
      ],
    );
  }
}
