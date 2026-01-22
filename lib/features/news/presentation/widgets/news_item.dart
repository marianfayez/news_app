import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/presentation/widgets/bottom_sheet.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({required this.articles,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => NewsBottomSheet(article: articles),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: Theme.of(context).secondaryHeaderColor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(imageUrl:articles.urlToImage ?? "",
                  height: 220,width: double.infinity,fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),),
                ),
                SizedBox(height: 16.h,),
                Text(articles.title??"",maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.headlineMedium,),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(articles.author!=null && articles.author!.isNotEmpty? articles.author!.split(" ").take(2).join(" "):articles.author??"",
                      style: Theme.of(context).textTheme.headlineSmall),
                    Text(articles.publishedAt?.substring(0,10)??"",style: Theme.of(context).textTheme.headlineSmall)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
