import 'dart:developer';

import 'package:digital_trons_prac/Controller/SearchResults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ApiHelper/ApiManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingList = [];
  @override
  void initState() {
    super.initState();
    apiGetTreding();
  }

  apiGetTreding(){
   String webLink = "https://api.themoviedb.org/3/trending/all/day?api_key=f34eb5fc94dd46371e7953221e43eb2b";

    ApiManager()
        .callGetApi(context, webLink, true)
        .then((value) {
      var apiData = value;
        for (var result in apiData["results"]) {
          trendingList.add(result);
        }
if(mounted){
  setState(() {

  });
}


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
             // shrinkWrap: true,
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Trending Movies", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),)),
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 16.h),
                    shrinkWrap: true,itemCount: trendingList.length, itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(trendingList[index]["name"] ?? trendingList[index]["title"], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),
                                SizedBox(height: 4.h,),
                                Text("Media Type: ${trendingList[index]["media_type"].toString().toUpperCase() ?? ""}", style: TextStyle(fontSize: 16.sp),),
                              ],
                            ),
                          )),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 16.h,); },),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                child: Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular( 5.r),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResult(),));
                    },
                    splashColor: Colors.black26,
                    highlightColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                        padding: EdgeInsets.only(
                          right: 10.w,
                          left: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular( 5.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Search", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
