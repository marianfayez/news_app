import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/font_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';

class AppDrawer extends StatelessWidget {
  Function onTab;

  AppDrawer({required this.onTab, super.key});

  String selectedItem = 'Dark';
  String selectedItem2 = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 166.h,
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("News App",
                style: getBoldStyle(color: ColorManager.black)
                    .copyWith(fontSize: FontSize.s24.sp)),
          ),
          InkWell(
            onTap: () {
              onTab();
            },
            child: ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: Text("Go To Home",
                  style: getBoldStyle(color: ColorManager.white)),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: const Icon(
              Icons.imagesearch_roller,
              color: Colors.white,
            ),
            title:
                Text("Theme", style: getBoldStyle(color: ColorManager.white)),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: selectedItem,
                  isExpanded: true,
                  dropdownColor: Colors.black,
                  iconEnabledColor: Colors.white,
                  underline: const SizedBox(),
                  style: getRegularStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                    DropdownMenuItem(value: 'Light', child: Text('Light')),
                  ],
                  onChanged: (value) {
                    // setState(() {
                    selectedItem = value!;
                    // });
                  },
                ),
              )),
          SizedBox(height: 24.h,),
          const Divider(
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            title:
            Text("Language", style: getBoldStyle(color: ColorManager.white)),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: selectedItem2,
                  isExpanded: true,
                  dropdownColor: Colors.black,
                  iconEnabledColor: Colors.white,
                  underline: const SizedBox(),
                  style: getRegularStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(value: 'English', child: Text('English')),
                    DropdownMenuItem(value: 'Arabic', child: Text('Arabic')),
                  ],
                  onChanged: (value) {
                    // setState(() {
                    selectedItem2 = value!;
                    // });
                  },
                ),
              ))
        ],
      ),
    );
  }
}
