import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/font_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';

class AppDrawer extends StatelessWidget {
  Function onTab;
   AppDrawer({required this.onTab,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.7,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 166.h,
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            child:  Text("News App",style: getBoldStyle(color: ColorManager.black).copyWith(fontSize: FontSize.s24.sp)),
          ),
          InkWell(
            onTap:(){
              onTab();

            },
            child:  ListTile(
              leading: const Icon(Icons.home_outlined,color: Colors.white,),
              title: Text("Go To Home",style:getBoldStyle(color: ColorManager.white)),
              // subtitle: Text("Click Here",style: getSemiBoldStyle(color: ColorManager.white)),
              trailing: const Icon(Icons.arrow_forward,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
