import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/widgets/app_drawer.dart';


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
        title:  Text(selectedCategory??"Home",style: Theme.of(context).textTheme.titleMedium,),
      ),
      drawer:AppDrawer(onTab: onDrawerTab,),
      // body: selectedCategory == null ? CategorySection(onTab:onSelectedCategory,):
      // SourcesSection(categoryId: selectedCategory!,onTap: onDrawerTab,),
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
