import 'package:digital_trons_prac/helperClass/TextFields.dart';
import 'package:digital_trons_prac/helperClass/UrlLaunchers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ApiHelper/ApiManager.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List searchResult = [];
  TextEditingController searchController = TextEditingController();

  apiSearchShows(){
    searchResult.clear();
    String webLink = "https://api.themoviedb.org/3/search/multi?api_key=f34eb5fc94dd46371e7953221e43eb2b&query=${searchController.text.replaceAll(" ", "%")}";

    ApiManager()
        .callGetApi(context, webLink, true)
        .then((value) {
      var apiData = value;
      for (var result in apiData["results"]) {
        searchResult.add(result);
      }
      if (mounted) {
        setState(() {

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Search Movies/Tv Shows", style: TextStyle(color: Colors.black),),
        leading: InkWell(
            onTap: (){
        Navigator.pop(context);
              },
            child: Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(

                    child: CustomBorderTextField(showBorder: true, isEnable: true, labelText: "Search",controller: searchController,),
                  ),
                  SizedBox(width: 8.w,),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(onPressed: (){
                      FocusScope.of(context).unfocus();
                      apiSearchShows();
                    }, child: Text("Search")),
                  )

                ],
              ),

            ),
           SizedBox(height: 30.h),
           searchResult.isNotEmpty ? Expanded(
             child: ListView.separated(shrinkWrap: true,
                 padding: EdgeInsets.only(bottom: 20.h),
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: InkWell(
                    onTap: (){
                      launchUrlLink("https://www.themoviedb.org/${searchResult[index]["media_type"]}/${searchResult[index]["id"]}-${searchController.text.replaceAll(" ", "-").toString().trim()}");
                    },
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(searchResult[index]["name"] ?? searchResult[index]["title"], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),
                              SizedBox(height: 4.h,),
                              Text("Release Date: ${searchResult[index]["release_date"] ?? "".toString().toUpperCase() ?? ""}", style: TextStyle(fontSize: 16.sp),),
                            ],
                          ),
                        )),
                  ),
                );
              }, separatorBuilder: (context, index) => SizedBox(height: 16.h,), itemCount: searchResult.length),
           ) : Container()
          ],
        ),
      ),
    );
  }
}
