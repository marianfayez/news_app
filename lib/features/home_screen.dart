import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';
import 'package:news_app/core/widgets/app_drawer.dart';
import 'package:news_app/core/widgets/category_section.dart';
import 'package:news_app/features/sources/presentation/widget/sources_section.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(selectedCategory??"Home"),
      ),
      drawer:AppDrawer(onTab: onDrawerTab,),
      body: selectedCategory == null ? CategorySection(onTab:onSelectedCategory,):
      SourcesSection(categoryId: selectedCategory!, onTap: onDrawerTab,),
    );
  }

  String? selectedCategory;

  onSelectedCategory(category){
    selectedCategory = category;
    setState(() {

    });
  }
  onDrawerTab(){
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {

    });
  }
}
