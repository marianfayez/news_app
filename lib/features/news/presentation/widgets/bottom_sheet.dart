import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/routes/auto_route.gr.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

class NewsBottomSheet extends StatelessWidget {
  final Articles article;

  const NewsBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 14.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            // Text(article.title??"",maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.headlineMedium,),
            // const SizedBox(height: 12),
            Text(
              article.description ??
                  article.content ??
                  'No description available',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),

            SizedBox(height: 20.h),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ))),
                  onPressed: () {
                    Navigator.pop(context);
                    context.router.push(ArticleWebViewRoute(
                      url: article.url!,
                      title: article.title ?? 'News',
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Text("View Full Article",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ))
          ],
        ));
  }
}
