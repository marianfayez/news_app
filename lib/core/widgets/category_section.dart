import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';
import 'package:news_app/features/theme/presentation/bloc/theme_bloc.dart';

class CategorySection extends StatelessWidget {
  Function onTab;

  CategorySection({required this.onTab, super.key});

  List<String> _getCurrentList(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      return [
        "general_light",
        'business_light',
        'sports_light',
        'technology_light',
        'entertainment_light',
        'health_light',
        'science_light'
      ];
    } else {
      return [
        'general_dark',
        'business_dark',
        'sports_dark',
        'technology_dark',
        'entertainment_dark',
        'health_dark',
        'science_dark'
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        List<String> currentList = _getCurrentList(state.themeMode);

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning\nHere is Some News For You",
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: !index.isOdd
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: Image.asset(
                                  "assets/images/${currentList[index]}.png")),
                          InkWell(
                            onTap: () {
                              onTab(currentList[index]
                                  .substring(0, currentList[index].length - 6));
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 16.w, horizontal: 16.h),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorManager.white.withOpacity(0.5)
                                        : ColorManager.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: index.isOdd
                                        ? [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.r)),
                                                child: const Icon(
                                                    Icons.arrow_back_ios)),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.h),
                                              child: Text(
                                                "View All",
                                              ),
                                            ),
                                          ]
                                        : [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Text(
                                                "View All",
                                                style: getMediumStyle(
                                                    color:
                                                        ColorManager.secondary),
                                              ),
                                            ),
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.r)),
                                                child: const Icon(
                                                    Icons.arrow_forward_ios))
                                          ])),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 16.h,
                        ),
                    itemCount: currentList.length),
              )
            ],
          ),
        );
      },
    );
  }
}
